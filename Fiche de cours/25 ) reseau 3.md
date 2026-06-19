# Préparation examen

## Activer le mail

<img width="913" height="547" alt="image" src="https://github.com/user-attachments/assets/99c5172d-3923-4b26-87b7-06d9b0f14ad7" />

Adresse / serveur mail à recopier :

```text
courrier.csduroy.qc.ca
```

Faire clignoter un disque :

<img width="1665" height="814" alt="image" src="https://github.com/user-attachments/assets/28422aa7-94eb-4a04-8f2e-34e09d548964" />

---

## Configuration réseau sur le serveur

Faire un `ipconfig` sur le serveur et recopier les informations réseau.

Ne pas oublier le masque :

```text
255.255.255.192
```

<img width="1157" height="757" alt="image" src="https://github.com/user-attachments/assets/ab62e2dd-83ac-4b06-9c04-acb9c74273d9" />

Puis aller dans les paramètres avancés et renseigner le suffixe DNS suivant, sans accent :

```text
Competence19.local
```

<img width="1076" height="798" alt="image" src="https://github.com/user-attachments/assets/b0da1935-4808-4e30-87ea-30b840d94324" />

---

## Utilisateur

### Réinitialiser le mot de passe

<img width="921" height="657" alt="image" src="https://github.com/user-attachments/assets/5f2d00de-692c-4c8e-bd63-a2edbb440863" />

### Modifier les horaires

<img width="1073" height="694" alt="image" src="https://github.com/user-attachments/assets/51d09354-ceac-4eec-a930-ac440eec0851" />

---

## Sauvegarde système

<img width="1172" height="819" alt="image" src="https://github.com/user-attachments/assets/9fc63540-bd86-4f61-a988-027e4d877d22" />


---

## Performance Windows

Dans la recherche Windows, taper :

```text
perform
```

<img width="1411" height="917" alt="image" src="https://github.com/user-attachments/assets/01078e88-dbe8-4fa5-9c90-5b77e40a8ec2" />

---

# Culture générale Pas a l exam

## Bureau à distance — 3 actions

Script tout-en-un :

```text
https://github.com/polo1093/Cours_DEP_SI/blob/main/script/bureau%20a%20distance.bat
```

<img width="1122" height="886" alt="image" src="https://github.com/user-attachments/assets/ad3f5e29-9a31-4928-bb35-e5115f214abe" />

<img width="1457" height="924" alt="image" src="https://github.com/user-attachments/assets/5fdedd3b-bb8d-450e-91fa-55118f02081f" />

Commandes à exécuter sur le serveur :

```bat
sc.exe config TermService start= auto >nul 2>&1
net start TermService >nul 2>&1
```

Depuis le client, vérifier le port RDP :

```powershell
Test-NetConnection 192.168.33.135 -Port 3389
```

---

## Filtrer les erreurs depuis le serveur

<img width="1077" height="799" alt="image" src="https://github.com/user-attachments/assets/4ffce67e-8f35-4258-b00e-097690d0fab6" />

---

## Verrouillage après échec de connexion

<img width="1787" height="858" alt="image" src="https://github.com/user-attachments/assets/d452a321-19f3-4a81-948d-fc7853c23d15" />

---

## Traces de logs des échecs de connexion

<img width="1668" height="978" alt="image" src="https://github.com/user-attachments/assets/2cfc3496-8406-423a-b254-b28c31f664b2" />

---

## Journal d’événements client

<img width="1904" height="978" alt="image" src="https://github.com/user-attachments/assets/7bbf02ee-49ed-4ef2-905a-1b17a3ffe412" />

---

## Commandes PowerShell sur l’ordinateur client

```powershell
Get-NetFirewallRule | Where-Object {
    $_.DisplayName -like "*journal*" -or
    $_.DisplayName -like "*événement*" -or
    $_.DisplayName -like "*Event Log*" -or
    $_.DisplayName -like "*RPC*" -or
    $_.DisplayName -like "*DCOM*"
} | Enable-NetFirewallRule
```

```powershell
Enable-PSRemoting -Force
```

```powershell
Set-NetFirewallRule -DisplayGroup "Gestion à distance de Windows" -Enabled True
```
