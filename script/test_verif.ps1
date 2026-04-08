#Set-ExecutionPolicy -Scope Process Bypass
#.\test_verif.ps1

$OutFolder = $PSScriptRoot

$Users = @(
    "amartin",
    "cparent",
    "hlavoie",
    "efortin",
    "lcaron",
    "sgendron",
    "mpelletier",
    "lgirard"
)

foreach ($User in $Users) {
    Write-Host "Traitement de $User ..."
    gpresult /USER PRETEST\$User /R | Out-File "$OutFolder\$User.txt" -Encoding utf8
}

Write-Host ""
Write-Host "Fichiers enregistres dans : $OutFolder"
Read-Host "Termine. Appuie sur Entree pour fermer"
