$BasePath = Split-Path -Parent $MyInvocation.MyCommand.Path

Get-ChildItem -Path $BasePath -Directory | ForEach-Object {
    $FolderPath = $_.FullName
    $UserName   = $_.Name

    Write-Host "Traitement : $FolderPath"

    # Coupe lâ€™hÃ©ritage et copie les droits hÃ©ritÃ©s en explicites
    icacls $FolderPath /inheritance:r | Out-Null

    # Retire les groupes gÃ©nÃ©riques courants
    icacls $FolderPath /remove "Utilisateurs" | Out-Null
    icacls $FolderPath /remove "Users" | Out-Null
    icacls $FolderPath /remove "Utilisateurs authentifiÃ©s" | Out-Null
    icacls $FolderPath /remove "Authenticated Users" | Out-Null
    icacls $FolderPath /remove "Domain Users" | Out-Null
    icacls $FolderPath /remove "Utilisateurs du domaine" | Out-Null

    # Donne les droits au propriÃ©taire du dossier
    icacls $FolderPath /grant:r "${UserName}:(OI)(CI)M" | Out-Null

    # Garde les droits admin + systÃ¨me
    icacls $FolderPath /grant:r "Administrateurs:(OI)(CI)F" | Out-Null
    icacls $FolderPath /grant:r "SYSTEM:(OI)(CI)F" | Out-Null

    Write-Host "OK : $UserName"
}
