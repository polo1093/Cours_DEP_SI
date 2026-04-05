
# \\NOMDUSERVEUR\ZZ\Personnels\%username%

Import-Module ActiveDirectory

# =========================================================
# PARAMÈTRES GÉNÉRAUX
# =========================================================

# Domaine / OU
$DomainDNS   = "PRETEST.local"
$BaseDN      = "DC=PRETEST,DC=local"
$OUName      = "PRETEST"
$OUPath      = "OU=$OUName,$BaseDN"

# FIN DE MAIL MODIFIABLE ICI
# Exemple:
# "@PRETEST.local"
# "@entreprise.local"
$MailSuffix  = "@PRETEST.local"

# Mot de passe initial
$PlainPassword  = 'Pa$$w0rd'
$SecurePassword = ConvertTo-SecureString $PlainPassword -AsPlainText -Force

# =========================================================
# GROUPES DE DÉPLOIEMENT
# =========================================================
$DeployGroups = @(
    "Deploy_Firefox",
    "Deploy_Inkscape",
    "Deploy_NotepadPP",
    "Deploy_VLC",
    "Deploy_PhotoFiltre"
)

# =========================================================
# UTILISATEURS + LOGICIELS
# Tu peux modifier la liste Software pour chaque user
# =========================================================
$Users = @(
    @{
        FirstName = "Alex"
        LastName  = "Martin"
        Software  = @("Deploy_Firefox", "Deploy_NotepadPP", "Deploy_VLC", "Deploy_PhotoFiltre")
    },
    @{
        FirstName = "Chloé"
        LastName  = "Parent"
        Software  = @("Deploy_Firefox", "Deploy_Inkscape", "Deploy_VLC", "Deploy_PhotoFiltre")
    },
    @{
        FirstName = "Hugo"
        LastName  = "Lavoie"
        Software  = @("Deploy_Inkscape", "Deploy_NotepadPP", "Deploy_VLC", "Deploy_PhotoFiltre")
    },
    @{
        FirstName = "Emma"
        LastName  = "Fortin"
        Software  = @("Deploy_Firefox", "Deploy_NotepadPP", "Deploy_PhotoFiltre")
    },
    @{
        FirstName = "Louis"
        LastName  = "Caron"
        Software  = @("Deploy_Inkscape", "Deploy_NotepadPP", "Deploy_VLC", "Deploy_PhotoFiltre")
    },
    @{
        FirstName = "Sarah"
        LastName  = "Gendron"
        Software  = @("Deploy_Firefox", "Deploy_Inkscape", "Deploy_VLC", "Deploy_PhotoFiltre")
    },
    @{
        FirstName = "Maxime"
        LastName  = "Pelletier"
        Software  = @("Deploy_Inkscape", "Deploy_NotepadPP", "Deploy_PhotoFiltre")
    },
    @{
        FirstName = "Léa"
        LastName  = "Girard"
        Software  = @("Deploy_Firefox", "Deploy_VLC", "Deploy_PhotoFiltre")
    }
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
        $member = Get-ADUser -Identity $UserSam
        $alreadyMember = Get-ADGroupMember -Identity $GroupName -ErrorAction SilentlyContinue |
            Where-Object { $_.DistinguishedName -eq $member.DistinguishedName }

        if (-not $alreadyMember) {
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
# CRÉATION DES GROUPES DE DÉPLOIEMENT
# =========================================================
foreach ($Group in $DeployGroups) {
    New-GroupIfMissing `
        -Name $Group `
        -Description "Groupe de sécurité pour le déploiement de $Group" `
        -Path $OUPath
}

# =========================================================
# CRÉATION DES UTILISATEURS + AJOUT AUX GROUPES
# =========================================================
foreach ($u in $Users) {
    $Sam = New-UserIfMissing -User $u -Path $OUPath -MailSuffix $MailSuffix

    foreach ($SoftwareGroup in $u.Software) {
        Add-UserToGroupSafe -UserSam $Sam -GroupName $SoftwareGroup
    }
}

# =========================================================
# FIN
# =========================================================
Write-Host ""
Write-Host "========================================"
Write-Host "Création terminée."
Write-Host "Domaine            : $DomainDNS"
Write-Host "OU                 : $OUPath"
Write-Host "Suffixe mail       : $MailSuffix"
Write-Host "Mot de passe initial : $PlainPassword"
Write-Host "========================================"
