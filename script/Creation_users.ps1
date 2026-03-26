
# \\NOMDUSERVEUR\ZZ\Personnels\%username%
# lorgana
# hsolo
# askywalker
# okenobi


Import-Module ActiveDirectory

# =========================================================
# PARAMÈTRES GÉNÉRAUX
# =========================================================
$DomainDNS = "zz.local" # Foret
$BaseDN    = "DC=zz,DC=local" 
$OUPath    = "OU=zz,$BaseDN" # Unite d'organisation cible pour les utilisateurs et groupes

$PlainPassword  = 'Pa$$w0rd'
$SecurePassword = ConvertTo-SecureString $PlainPassword -AsPlainText -Force

# =========================================================
# UTILISATEURS
# Tu modifies seulement cette partie selon l'exo
# =========================================================
$Users = @(
    @{ FirstName="PierrePaul"; LastName="FafardAllard"; Role="Marketing"   },
    @{ FirstName="Marielle";   LastName="Page";         Role="Comptables"  },
    @{ FirstName="Jules";      LastName="Larose";       Role="Operations"  },
    @{ FirstName="Diane";      LastName="Dumaine";      Role="Operations"  },
    @{ FirstName="Yves";       LastName="Leblanc";      Role="Operations"  },
    @{ FirstName="Ferdal";     LastName="Bois";         Role="Marketing"   },
    @{ FirstName="Ginette";    LastName="Bouin";        Role="Secretaire"  }
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
# CRÉATION DES GROUPES
# =========================================================



# Rôles uniques trouvés dans la liste des users
$Roles = $Users.Role | Sort-Object -Unique

foreach ($Role in $Roles) {
    $GroupName = "GG_$Role"
    $Description = "Groupe de sécurité pour le rôle $Role"

    New-GroupIfMissing `
        -Name $GroupName `
        -Description $Description `
        -Path $OUPath
}

# =========================================================
# CRÉATION DES UTILISATEURS + AFFECTATION GROUPES
# =========================================================
foreach ($u in $Users) {
    $Sam = New-UserIfMissing -User $u -Path $OUPath    
    Add-UserToGroupSafe -UserSam $Sam -GroupName ("GG_" + $u.Role)
}

Write-Host ""
Write-Host "========================================"
Write-Host "Création terminée."
Write-Host "Domaine : $DomainDNS"
Write-Host "OU : $OUPath"
Write-Host "Mot de passe initial : $PlainPassword"
Write-Host "========================================"