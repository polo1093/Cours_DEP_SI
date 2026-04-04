
# \\NOMDUSERVEUR\ZZ\Personnels\%username%
Import-Module ActiveDirectory

# =========================================================
# PARAMÈTRES GÉNÉRAUX
# =========================================================
$DomainDNS = "PRETEST.local"
$BaseDN    = "DC=PRETEST,DC=local"
$OUPath    = "OU=PRETEST,$BaseDN"

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
# UTILISATEURS + LOGICIELS À RECEVOIR
# =========================================================
$Users = @(
    @{
        FirstName = "Alex"
        LastName  = "Martin"
        Software  = @("Deploy_Firefox", "Deploy_NotepadPP", "Deploy_VLC", "Deploy_PhotoFiltre")
    },
    @{
        FirstName = "Chloe"
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
        FirstName = "Lea"
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
        [string]$Path
    )

    $Sam         = Get-SamFromName -FirstName $User.FirstName -LastName $User.LastName
    $DisplayName = "$($User.FirstName) $($User.LastName)"
    $UPN         = "$Sam@$DomainDNS"

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$Sam'" -ErrorAction SilentlyContinue)) {
        New-ADUser `
            -Name $DisplayName `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -DisplayName $DisplayName `
            -SamAccountName $Sam `
            -UserPrincipalName $UPN `
            -Path $Path `
            -AccountPassword $SecurePassword `
            -Enabled $true `
            -ChangePasswordAtLogon $false

        Write-Host "Utilisateur créé : $DisplayName ($Sam)"
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
# CRÉATION DES GROUPES DE DÉPLOIEMENT
# =========================================================
foreach ($Group in $DeployGroups) {
    New-GroupIfMissing `
        -Name $Group `
        -Description "Groupe de sécurité pour le déploiement de $Group" `
        -Path $OUPath
}

# =========================================================
# CRÉATION DES UTILISATEURS + AFFECTATION DES GROUPES
# =========================================================
foreach ($u in $Users) {
    $Sam = New-UserIfMissing -User $u -Path $OUPath

    foreach ($SoftwareGroup in $u.Software) {
        Add-UserToGroupSafe -UserSam $Sam -GroupName $SoftwareGroup
    }
}

Write-Host ""
Write-Host "========================================"
Write-Host "Création terminée."
Write-Host "Domaine : $DomainDNS"
Write-Host "OU : $OUPath"
Write-Host "Mot de passe initial : $PlainPassword"
Write-Host "========================================"
