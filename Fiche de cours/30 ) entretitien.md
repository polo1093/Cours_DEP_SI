# Fiche entretien stage IT

point fort
“Mon point principal fort, c’est mon esprit analytique. J’aime structurer un problème, identifier les causes possibles et avancer de façon méthodique. J’ai aussi un bon relationnel, donc je collabore facilement avec les autres.”

point faible
“Dans un nouvel environnement, j’ai parfois tendance à vouloir d’abord avancer seul avant de solliciter quelqu’un. Avec l’expérience, j’ai appris à poser une question ciblée plus tôt quand cela permet d’être plus efficace.”
## 1. Ports mail à connaître

### SMTP
- **SMTP** = envoi de mails
- Port **25** = ancien port SMTP, souvent bloqué
- Port **587** = SMTP authentifié, le plus courant
- Port **465** = SMTP sécurisé SSL/TLS

### IMAP
- **IMAP** = consulter les mails en gardant la synchronisation avec le serveur
- Port **143** = IMAP non chiffré
- Port **993** = IMAP sécurisé SSL/TLS

### POP3
- **POP3** = récupérer les mails en local
- Port **110** = POP3 non chiffré
- Port **995** = POP3 sécurisé SSL/TLS

### Réponse courte entretien
- SMTP sert à **envoyer**
- IMAP et POP servent à **recevoir**
- IMAP est souvent préféré aujourd’hui car il synchronise les mails sur plusieurs appareils

---

## 2. C’est quoi un téléphone IP ?

Un **téléphone IP** est un téléphone qui passe par le **réseau informatique** au lieu d’utiliser une ligne téléphonique analogique classique.

### Principe
- il se connecte au **réseau Ethernet**
- il communique avec un **serveur de téléphonie IP / IPBX / VoIP**
- il utilise l’adresse IP du réseau
- souvent il fonctionne avec le protocole **SIP**

### Avantages
- installation plus simple en entreprise
- transfert d’appel, messagerie vocale, conférence
- administration centralisée
- possible via le réseau local ou Internet

### Réponse courte entretien
> Un téléphone IP est un téléphone qui utilise le réseau informatique et la VoIP pour transmettre la voix, souvent via SIP, au lieu d’une ligne téléphonique classique.

---

## 3. Si le réseau ne fonctionne pas sur un poste : quoi vérifier ?

### Vérifications de base
1. vérifier le **câble réseau** ou le **Wi-Fi**
2. vérifier si la carte réseau est activée
3. lancer :
   - `ipconfig`
   - `ping 127.0.0.1`
   - `ping passerelle`
   - `ping 8.8.8.8`
4. vérifier si le PC reçoit bien une IP du bon réseau
5. vérifier le **DHCP**, la **passerelle** et le **DNS**

### Cas classique
#### Adresse IP en `169.254.x.x`
- cela signifie souvent que le poste **n’a pas reçu d’adresse IP du serveur DHCP**
- donc :
  - problème câble / switch / Wi-Fi
  - DHCP indisponible
  - mauvais VLAN
  - configuration manuelle incorrecte

### Commandes utiles
- `ipconfig /all`
- `ipconfig /release`
- `ipconfig /renew`
- `ping`
- `nslookup`

### Réponse courte entretien
> Si le réseau ne fonctionne pas, je vérifie d’abord la connectivité physique, puis l’adresse IP, la passerelle, le DNS et le DHCP. Si le poste a une IP 169.254.x.x, cela indique souvent un problème d’attribution DHCP.

---

## 4. DHCP et DNS

### DHCP
- attribue automatiquement :
  - adresse IP
  - masque
  - passerelle
  - DNS

### DNS
- traduit un **nom** en **adresse IP**
- exemple :
  - `google.com` → adresse IP

### Réponse courte entretien
> DHCP donne automatiquement la configuration réseau au poste. DNS permet de résoudre les noms de domaine en adresses IP.

---
## 22 = SSH
- **SSH** = Secure Shell
- Sert à **se connecter à distance** à une machine en **ligne de commande**
- Utilisé surtout sur :
  - serveurs Linux
  - équipements réseau
  - parfois Windows avec OpenSSH
- Communication **chiffrée**
- Permet :
  - administration distante
  - exécution de commandes
  - transfert sécurisé de fichiers via **SCP** ou **SFTP**

### Exemple
- se connecter à un serveur Linux
- administrer un switch ou un routeur

### Réponse entretien
> Le port 22 correspond à SSH. Il sert à l’administration distante sécurisée d’un système en ligne de commande.

---

## 3389 = RDP
- **RDP** = Remote Desktop Protocol
- Sert à **prendre le contrôle à distance d’un poste ou serveur Windows**
- Permet d’ouvrir une **session graphique complète**
- Très utilisé pour :
  - support technique
  - administration de serveurs Windows
  - accès à un poste distant

### Exemple
- se connecter à un serveur Windows
- dépanner un poste utilisateur à distance

### Réponse entretien
> Le port 3389 correspond à RDP. Il permet l’accès à distance à l’interface graphique d’un poste ou serveur Windows.

---

## 21 = FTP
- **FTP** = File Transfer Protocol
- Sert à **transférer des fichiers** entre un client et un serveur
- Port **21** = port de commande
- Historiquement, le port **20** pouvait servir pour les données en mode actif
- **FTP n’est pas chiffré** en standard
- Donc aujourd’hui on préfère souvent :
  - **SFTP** = via SSH, port 22
  - **FTPS** = FTP avec chiffrement TLS

### Exemple
- déposer des fichiers sur un serveur
- récupérer des sauvegardes ou des documents

### Réponse entretien
> Le port 21 correspond à FTP. Il sert au transfert de fichiers, mais il n’est pas sécurisé par défaut.

---

## Différence rapide
- **SSH (22)** → accès distant en ligne de commande, sécurisé
- **RDP (3389)** → accès distant avec interface graphique
- **FTP (21)** → transfert de fichiers, non sécurisé par défaut
## 5. Ports réseau utiles à connaître en plus

- **80** = HTTP
- **443** = HTTPS
- **53** = DNS
- **67/68** = DHCP
- **22** = SSH
- **3389** = RDP
- **21** = FTP

---

## 6. Petite phrase propre pour entretien

> Je connais les bases réseau utiles en support informatique : adressage IP, DHCP, DNS, ports courants, messagerie, et premiers diagnostics en cas de perte de connectivité sur un poste.
