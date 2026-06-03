activer mail

<img width="913" height="547" alt="image" src="https://github.com/user-attachments/assets/99c5172d-3923-4b26-87b7-06d9b0f14ad7" />
bat**courrier.csduroy.qc.ca**

bureau a distance 3 actions:
lien vers le script  https://github.com/polo1093/Cours_DEP_SI/blob/main/script/bureau%20a%20distance.bat tout en 1
<img width="1122" height="886" alt="image" src="https://github.com/user-attachments/assets/ad3f5e29-9a31-4928-bb35-e5115f214abe" />
<img width="1457" height="924" alt="image" src="https://github.com/user-attachments/assets/5fdedd3b-bb8d-450e-91fa-55118f02081f" />
puis sc.exe config TermService start= auto >nul 2>&1
net start TermService >nul 2>&1
depuis le cle client : Test-NetConnection 192.168.33.135 -Port 3389



config reseau sur le serveur ipconfig tout recopier 
et ne pas oublier que le mask est : 255.255.255.192



filtre erreur depuis serveur 
<img width="1077" height="799" alt="image" src="https://github.com/user-attachments/assets/4ffce67e-8f35-4258-b00e-097690d0fab6" />

Verrouillage connexion fail
<img width="1787" height="858" alt="image" src="https://github.com/user-attachments/assets/d452a321-19f3-4a81-948d-fc7853c23d15" />

trace de log des echec de connexion
<img width="1668" height="978" alt="image" src="https://github.com/user-attachments/assets/2cfc3496-8406-423a-b254-b28c31f664b2" />



journal evenemet client
<img width="1904" height="978" alt="image" src="https://github.com/user-attachments/assets/7bbf02ee-49ed-4ef2-905a-1b17a3ffe412" />


performance
<img width="1411" height="917" alt="image" src="https://github.com/user-attachments/assets/01078e88-dbe8-4fa5-9c90-5b77e40a8ec2" />


# Culture general


## Command powershel sur ordi client

Get-NetFirewallRule | Where-Object {
    $_.DisplayName -like "*journal*" -or
    $_.DisplayName -like "*événement*" -or
    $_.DisplayName -like "*Event Log*" -or
    $_.DisplayName -like "*RPC*" -or
    $_.DisplayName -like "*DCOM*"
} | Enable-NetFirewallRule

Enable-PSRemoting -Force

Set-NetFirewallRule -DisplayGroup "Gestion à distance de Windows" -Enabled True








