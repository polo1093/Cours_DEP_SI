# \\NOMDUSERVEUR\ZZ\Personnels\%username%

Import-Module ActiveDirectory

# =========================================================
# PARAMÈTRES GÉNÉRAUX
# =========================================================

# Domaine / OU
$DomainDNS = "PRETEST.local"
$BaseDN    = "DC=PRETEST,DC=local"
$OUName    = "PRETEST"
$OUPath    = "OU=$OUName,$BaseDN"

# Fin de mail modifiable
$MailSuffix = "@PRETEST.local"

# Mot de passe initial
$PlainPassword  = 'Pa$$w0rd'
$SecurePassword = ConvertTo-SecureString $PlainPassword -AsPlainText -Force

# =========================================================
# UTILISATEURS + GROUPE UNIQUE
# Réseau 2 : chaque utilisateur appartient à un seul groupe GG
# =========================================================

$Users = @(
    @{ FirstName = "Alex";  LastName = "Martin";   Group = "GG_Direction" }
    @{ FirstName = "Chloe"; LastName = "Parent";   Group = "GG_Comptabilite" }
    @{ FirstName = "Hugo";  LastName = "Lavoie";   Group = "GG_Operations" }
    @{ FirstName = "Emma";  LastName = "Fortin";   Group = "GG_Secretaire" }
    @{ FirstName = "Louis"; LastName = "Caron";    Group = "GG_Comptabilite" }
)

# =========================================================
# FONCTIONS
# =========================================================

function Remove-Accents {
    param([string]$Text)

    $Normalized = $Text.Normalize([Text.NormalizationForm]::FormD)
    $Builder = New-Object System.Text.StringBuilder

    foreach ($Char in $Normalized.ToCharArray()) {
        if ([Globalization.CharUnicodeInfo]::GetUnicodeCategory($Char) -ne [Globalization.UnicodeCategory]::NonSpacingMark) {
            [void]$Builder.Append($Char)
        }
    }

    return $Builder.ToString().Normalize([Text.NormalizationForm]::FormC)
}

function Get-SamFromName {
    param(
        [string]$FirstName,
        [string]$LastName
    )

    $First = Remove-Accents $FirstName
    $Last  = Remove-Accents $LastName

    $First = $First.ToLower() -replace '[^a-z]', ''
    $Last  = $Last.ToLower()  -replace '[^a-z]', ''

    if ($First.Length -ge 1) {
        return ($First.Substring(0,1) + $Last)
    }
    else {
        return $Last
    }
}

function Ensure-OUExists {
    param(
        [string]$OUName,
        [string]$BaseDN
    )

    $ExistingOU = Get-ADOrganizationalUnit -LDAPFilter "(ou=$OUName)" -SearchBase $BaseDN -ErrorAction SilentlyContinue

    if (-not $ExistingOU) {
        New-ADOrganizationalUnit -Name $OUName -Path $BaseDN
        Write-Host "OU créée : OU=$OUName,$BaseDN"
    }
    else {
        Write-Host "OU déjà présente : OU=$OUName,$BaseDN"
    }
}

function New-GroupIfMissing {
    param(
        [string]$Name,
        [string]$Description,
        [string]$Path
    )

    if (-not (Get-ADGroup -Filter "SamAccountName -eq '$Name'" -ErrorAction SilentlyContinue)) {
        New-ADGroup `
            -Name $Name `
            -SamAccountName $Name `
            -GroupScope Global `
            -GroupCategory Security `
            -Path $Path `
            -Description $Description

        Write-Host "Groupe créé : $Name"
    }
    else {
        Write-Host "Groupe déjà présent : $Name"
    }
}

function New-UserIfMissing {
    param(
        [hashtable]$User,
        [string]$Path,
        [string]$MailSuffix
    )

    $Sam         = Get-SamFromName -FirstName $User.FirstName -LastName $User.LastName
    $DisplayName = "$($User.FirstName) $($User.LastName)"
    $UPN         = "$Sam@$DomainDNS"
    $Email       = "$Sam$MailSuffix"

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$Sam'" -ErrorAction SilentlyContinue)) {
        New-ADUser `
            -Name $DisplayName `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -DisplayName $DisplayName `
            -SamAccountName $Sam `
            -UserPrincipalName $UPN `
            -EmailAddress $Email `
            -Path $Path `
            -AccountPassword $SecurePassword `
            -Enabled $true `
            -ChangePasswordAtLogon $false

        Write-Host "Utilisateur créé : $DisplayName ($Sam) - $Email"
    }
    else {
        Write-Host "Utilisateur déjà présent : $DisplayName ($Sam)"
    }

    return $Sam
}

function Add-UserToGroupSafe {
    param(
        [string]$UserSam,
        [string]$GroupName
    )

    try {
        $Member = Get-ADUser -Identity $UserSam
        $AlreadyMember = Get-ADGroupMember -Identity $GroupName -ErrorAction SilentlyContinue |
            Where-Object { $_.DistinguishedName -eq $Member.DistinguishedName }

        if (-not $AlreadyMember) {
            Add-ADGroupMember -Identity $GroupName -Members $UserSam
            Write-Host "$UserSam ajouté à $GroupName"
        }
        else {
            Write-Host "$UserSam déjà membre de $GroupName"
        }
    }
    catch {
        Write-Warning "Impossible d'ajouter $UserSam à $GroupName : $_"
    }
}

# =========================================================
# CRÉATION DE L'OU SI ABSENTE
# =========================================================

Ensure-OUExists -OUName $OUName -BaseDN $BaseDN

# =========================================================
# CRÉATION DES GROUPES GG
# Les groupes sont déduits automatiquement des utilisateurs
# =========================================================

$Groups = $Users.Group | Sort-Object -Unique

foreach ($Group in $Groups) {
    New-GroupIfMissing `
        -Name $Group `
        -Description "Groupe de sécurité $Group pour les droits réseau / NTFS" `
        -Path $OUPath
}

# =========================================================
# CRÉATION DES UTILISATEURS + AJOUT AU GROUPE UNIQUE
# =========================================================

foreach ($User in $Users) {
    $Sam = New-UserIfMissing -User $User -Path $OUPath -MailSuffix $MailSuffix
    Add-UserToGroupSafe -UserSam $Sam -GroupName $User.Group
}

# =========================================================
# FIN
# =========================================================

Write-Host ""
Write-Host "========================================"
Write-Host "Création terminée."
Write-Host "Domaine              : $DomainDNS"
Write-Host "OU                   : $OUPath"
Write-Host "Suffixe mail         : $MailSuffix"
Write-Host "Mot de passe initial : $PlainPassword"
Write-Host "========================================"
