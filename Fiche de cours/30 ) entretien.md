<img width="1055" height="1491" alt="image" src="https://github.com/user-attachments/assets/39470acf-5d49-4c59-8ea4-3e2305095ffb" />



# Fiche de préparation — Entretien stage TI

Objectif : avoir des réponses courtes, professionnelles et faciles à ressortir pendant un entretien de stage en soutien informatique.

---

## 1. Présentation rapide

> Je suis en DEP Soutien informatique. J’ai un profil orienté support utilisateur, diagnostic poste, réseau de base, Windows, serveurs et automatisation. J’aime comprendre la cause d’un problème plutôt que seulement appliquer une solution temporaire.

---

## 2. Point fort

> Mon principal point fort est mon esprit analytique. J’aime structurer un problème, identifier les causes possibles et avancer de manière méthodique. J’ai aussi un bon relationnel, ce qui me permet de collaborer facilement avec les utilisateurs et l’équipe technique.

---

## 3. Point faible

> Dans un nouvel environnement, j’ai parfois tendance à vouloir chercher seul avant de solliciter quelqu’un. Avec l’expérience, j’ai appris à poser une question ciblée plus tôt lorsque cela permet d’être plus efficace et d’éviter de perdre du temps.

---

## 4. Ports réseau essentiels

| Port | Protocole | Usage principal |
|---:|---|---|
| 20/21 | FTP | Transfert de fichiers, non chiffré par défaut |
| 22 | SSH / SFTP | Administration distante sécurisée et transfert sécurisé |
| 23 | Telnet | Administration distante non chiffrée, à éviter |
| 25 | SMTP | Relais SMTP, surtout serveur à serveur |
| 53 | DNS | Résolution de noms en adresses IP |
| 67/68 | DHCP | Attribution automatique de configuration IP |
| 80 | HTTP | Web non chiffré |
| 110 | POP3 | Réception de mails en local, non chiffrée |
| 143 | IMAP | Consultation/synchronisation mail, non chiffrée |
| 443 | HTTPS | Web chiffré avec TLS |
| 465 | SMTPS | SMTP chiffré avec SSL/TLS |
| 587 | SMTP Submission | Envoi de mail authentifié côté client |
| 993 | IMAPS | IMAP chiffré avec SSL/TLS |
| 995 | POP3S | POP3 chiffré avec SSL/TLS |
| 3389 | RDP | Bureau à distance Windows |

### Réponse courte entretien

> Je connais les ports courants en support TI : HTTP/HTTPS pour le Web, DNS en 53, DHCP en 67/68, SMTP/IMAP/POP pour la messagerie, SSH en 22 et RDP en 3389 pour l’administration distante.

---

## 5. Messagerie : SMTP, IMAP et POP3

### SMTP

- Sert à **envoyer** des courriels.
- Le port **25** est surtout utilisé pour le relais entre serveurs mail.
- Le port **587** est courant pour l’envoi authentifié côté client.
- Le port **465** correspond à une connexion SMTP chiffrée SSL/TLS.

### IMAP

- Sert à **consulter les courriels tout en les gardant synchronisés sur le serveur**.
- Utile quand l’utilisateur consulte sa boîte mail depuis plusieurs appareils.
- Ports : **143** non chiffré, **993** chiffré.

### POP3

- Sert à **récupérer les courriels en local**.
- Moins adapté si l’utilisateur veut une synchronisation propre entre plusieurs appareils.
- Ports : **110** non chiffré, **995** chiffré.

### Réponse courte entretien

> SMTP sert à envoyer les courriels. IMAP et POP3 servent à les recevoir. Aujourd’hui, IMAP est souvent préféré parce qu’il synchronise les messages entre plusieurs appareils.

---

## 6. Téléphone IP / VoIP

Un **téléphone IP** est un téléphone qui utilise le réseau informatique pour transmettre la voix, au lieu d’une ligne téléphonique analogique classique.

### Principe

- Il se connecte au réseau Ethernet ou Wi-Fi.
- Il communique avec un serveur de téléphonie IP, souvent appelé **IPBX**.
- Il utilise généralement le protocole **SIP** pour établir les appels.
- La voix circule sous forme de paquets IP sur le réseau.

### Avantages

- Administration centralisée.
- Transfert d’appel, messagerie vocale, conférence.
- Intégration plus simple avec l’infrastructure réseau.
- Possibilité d’utiliser le même câblage réseau que les postes informatiques.

### Réponse courte entretien

> Un téléphone IP utilise le réseau informatique et la VoIP pour transmettre la voix. Il fonctionne souvent avec SIP et peut être administré depuis un serveur de téléphonie IP.

---

## 7. Diagnostic : un poste n’a plus de réseau

### Méthode de diagnostic

1. Vérifier le câble réseau, le Wi-Fi, le switch ou la prise murale.
2. Vérifier que la carte réseau est activée.
3. Exécuter `ipconfig /all` pour contrôler l’adresse IP, le masque, la passerelle et le DNS.
4. Tester la pile TCP/IP avec `ping 127.0.0.1`.
5. Tester la passerelle avec `ping <adresse_passerelle>`.
6. Tester Internet avec `ping 8.8.8.8`.
7. Tester la résolution DNS avec `nslookup google.com`.
8. Renouveler l’adresse IP avec `ipconfig /release` puis `ipconfig /renew`.

### Cas classique : adresse IP en 169.254.x.x

Une adresse en **169.254.x.x** signifie souvent que le poste n’a pas reçu d’adresse IP du serveur DHCP. Windows s’attribue alors une adresse automatique APIPA.

Causes possibles :

- câble réseau débranché ou défectueux ;
- port switch ou prise réseau problématique ;
- mauvais VLAN ;
- serveur DHCP indisponible ;
- configuration IP manuelle incorrecte ;
- problème Wi-Fi ou authentification réseau.

### Commandes utiles

```powershell
ipconfig /all
ipconfig /release
ipconfig /renew
ping 127.0.0.1
ping <passerelle>
ping 8.8.8.8
nslookup google.com
```

### Réponse courte entretien

> Si un poste n’a plus de réseau, je commence par la couche physique, puis je vérifie l’adresse IP, la passerelle, le DNS et le DHCP. Si je vois une adresse 169.254.x.x, je pense d’abord à un problème d’attribution DHCP ou de connectivité réseau.

---

## 8. DHCP et DNS

### DHCP

Le **DHCP** attribue automatiquement la configuration réseau aux postes clients :

- adresse IP ;
- masque de sous-réseau ;
- passerelle par défaut ;
- serveurs DNS.

### DNS

Le **DNS** traduit un nom de domaine en adresse IP.

Exemple :

```text
google.com -> adresse IP du serveur Google
```

### Réponse courte entretien

> DHCP donne automatiquement la configuration réseau à un poste. DNS permet de résoudre les noms de domaine en adresses IP.

---

## 9. Accès distant et transfert de fichiers

### SSH — port 22

- Administration distante en ligne de commande.
- Communication chiffrée.
- Utilisé sur les serveurs Linux, certains équipements réseau et parfois Windows avec OpenSSH.
- Permet aussi le transfert sécurisé via **SCP** ou **SFTP**.

**Réponse entretien :**

> Le port 22 correspond à SSH. Il sert à administrer un système à distance de manière sécurisée, principalement en ligne de commande.

### RDP — port 3389

- Bureau à distance Windows.
- Permet d’ouvrir une session graphique complète.
- Très utilisé pour le support technique et l’administration de serveurs Windows.

**Réponse entretien :**

> Le port 3389 correspond à RDP. Il permet de prendre le contrôle à distance d’un poste ou serveur Windows avec une interface graphique.


### FTP — port 21

- Transfert de fichiers entre un client et un serveur.
- Le port 21 sert au contrôle de session.
- FTP n’est pas chiffré par défaut.
- En production, on préfère souvent **SFTP** ou **FTPS**.

**Réponse entretien :**

> Le port 21 correspond à FTP. Il sert au transfert de fichiers, mais il n’est pas sécurisé par défaut. Pour un usage sécurisé, on privilégie SFTP ou FTPS.

---

## 10. Différence rapide : SSH, RDP et FTP

| Protocole | Port | Utilité | Sécurité |
|---|---:|---|---|
| SSH | 22 | Ligne de commande distante | Chiffré |
| RDP | 3389 | Bureau à distance Windows | Chiffré, mais à sécuriser fortement |
| FTP | 21 | Transfert de fichiers | Non chiffré par défaut |

### Réponse courte entretien

> SSH sert à administrer un système en ligne de commande, RDP permet d’accéder à une interface graphique Windows, et FTP sert au transfert de fichiers. FTP est moins sécurisé s’il n’est pas chiffré.

---

## 11. Phrase finale professionnelle

> Je maîtrise les bases utiles en soutien informatique : diagnostic réseau, adressage IP, DHCP, DNS, ports courants, messagerie, accès distant et premières vérifications sur un poste utilisateur. Mon objectif est de diagnostiquer proprement avant d’appliquer une solution.
