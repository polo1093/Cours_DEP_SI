### VARIABLES A MODIFIER ###

$Partage = "\\%logonserver%\installateur\"
$Executable = "photofiltre11.7.0_fr_setup.exe"
$Switch = "/VERYSILENT /SUPPRESSMSGBOXES"

###FIN DES VARIABLES###


###NE PAS MODIFIER CE QUI SUIT###

$Chemin = $Partage+$Executable
$LocalFolder = "C:\TEMP"
New-Item -ItemType Directory -Path "$LocalFolder" -ErrorAction SilentlyContinue
     Copy-Item "$Chemin" "$LocalFolder" -Force

Start-Process -FilePath "$LocalFolder\$Executable" -ArgumentList $Switch -Wait

Remove-Item "$LocalFolder\$Executable"
