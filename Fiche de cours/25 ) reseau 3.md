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



Command powershel sur ordi client

Get-NetFirewallRule | Where-Object {
    $_.DisplayName -like "*journal*" -or
    $_.DisplayName -like "*événement*" -or
    $_.DisplayName -like "*Event Log*" -or
    $_.DisplayName -like "*RPC*" -or
    $_.DisplayName -like "*DCOM*"
} | Enable-NetFirewallRule

Enable-PSRemoting -Force

Set-NetFirewallRule -DisplayGroup "Gestion à distance de Windows" -Enabled True








