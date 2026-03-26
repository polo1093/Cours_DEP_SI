$CurrentFolder = Split-Path -Parent $MyInvocation.MyCommand.Path
$CurrentScript = Split-Path -Leaf $MyInvocation.MyCommand.Path

cmd /c "takeown /F `"$CurrentFolder`" /R /D O"
cmd /c "icacls `"$CurrentFolder`" /grant `"Administrateurs`":(OI)(CI)F /T /C"
cmd /c "icacls `"$CurrentFolder`" /grant `"SYSTEM`":(OI)(CI)F /T /C"

Get-ChildItem -Path $CurrentFolder -Force | Where-Object { $_.Name -ne $CurrentScript } | ForEach-Object {
    Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "Droits repris et contenu supprimÃ©."
