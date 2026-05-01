## 4) Arborescence type

Créer un **dossier principal** sur le 2e disque ou sur `D:` :

```text
D:\WEB20
│
├── Groupes
│   ├── Direction
│   ├── Comptabilite
│   │   └── Payes
│   ├── Operations
│   └── Secretaire
│
└── Personnels
    ├── user1
    ├── user2
    ├── user3
    └── ...
```

## 5) Partage réseau

* Partager **le dossier principal** `D:\WEB20`
* Nom de partage : `WEB20` ou `WEB20$`
* **Droits de partage** :

  * Admins : **Contrôle total**
  * Utilisateurs du domaine / Tout le monde : **Contrôle total**
* Ensuite, la vraie sécurité se gère en **NTFS**
* Bon réflexe : **ne pas partager tout le disque D:**, mais seulement le dossier principal de l’entreprise

## 6) Sécurité NTFS à appliquer

### Dossier principal `D:\WEB20`

* `Administrateurs` : **Contrôle total**
* `SYSTEM` : **Contrôle total**
* `Utilisateurs du domaine` : **Lecture / exécution**
* Les utilisateurs **ne doivent pas écrire** ici

### Dossier `Groupes\Direction`

* `GG_Direction` : **Modification**
* `Administrateurs` : **Contrôle total**

### Dossier `Groupes\Comptabilite`

* `GG_Comptabilite` : **Modification**
* `Administrateurs` : **Contrôle total**

### Dossier `Groupes\Comptabilite\Payes`

* **Désactiver l’héritage ici**
* Retirer les groupes hérités inutiles
* Laisser seulement :

  * le comptable autorisé
* Si l’énoncé dit que **l’admin n’a pas accès**, le retirer aussi de ce sous-dossier

### Dossier `Groupes\Operations`

* `GG_Operations` : **Modification**
* `Administrateurs` : **Contrôle total**

### Dossier `Groupes\Secretaire`

* `GG_Secretaire` : **Modification**
* `Utilisateurs du domaine` : **Lecture**
* `Administrateurs` : **Contrôle total**

### Dossier `Personnels`

* Parent `Personnels` :

  * `Administrateurs` : **Contrôle total**
  * `SYSTEM` : **Contrôle total**
  * `Utilisateurs du domaine` : **Lecture** / traversée seulement

### Chaque dossier personnel `Personnels\%username%`

* **Désactiver l’héritage ici**
* Garder seulement :

  * l’utilisateur concerné : **Modification** ou **Contrôle total**
  * `Administrateurs` : **Contrôle total**
  * `SYSTEM` : **Contrôle total**
* Les autres utilisateurs : **aucun accès**

## 7) Où désactiver l’héritage

À retenir pour le test :

* **Oui** sur chaque **dossier personnel**
* **Oui** sur le sous-dossier **Payes / confidentiel**
* **Non en général** sur le dossier principal et les dossiers de groupe, sauf consigne spéciale

## 8) Lecteur personnel W:

Dans **Utilisateurs et ordinateurs Active Directory** :

* Propriétés utilisateur
* Onglet **Profil**
* **Dossier de base / Home folder**
* Connecter `W:` vers :

```text
\\SRV-AD\WEB20\Personnels\%username%
```

## 9) Script d’ouverture de session

### Version type demandée en examen

```bat
@echo off
msg %username% "C'est réussi !"
if not exist W:\ net use V: \\SRV-AD\WEB20
start calc.exe
```

### Variante du prof avec message + notepad

```bat
@echo off
msg %username% "Bienvenue"
start notepad.exe
```

## 10) Où placer / assigner le script

Selon l’énoncé :

* soit dans le **profil utilisateur** AD
* soit via une **GPO**
* emplacement classique : dossier scripts du domaine / `NETLOGON`

## 11) GPO

Créer une GPO liée à l’OU des utilisateurs :

* Bloquer l’accès au **Panneau de configuration**
* Assigner le **script d’ouverture de session**
* Si demandé : fond d’écran imposé via GPO

Point technique utile :

* la **stratégie de mot de passe du domaine** se configure normalement au **niveau domaine** (pas une simple OU), sauf cas particuliers

## 12) Client Windows 10/11

* Créer une VM cliente
* Joindre la machine au domaine
* Ajouter les utilisateurs demandés au groupe **Administrateurs local** si exigé
* Ouvrir une session avec plusieurs utilisateurs et vérifier :

  * ouverture OK
  * script lancé
  * message pop-up affiché
  * `calc.exe` ou `notepad.exe` démarre
  * lecteur `W:` présent
  * lecteur `V:` créé si la condition le demande
  * fond d’écran appliqué si demandé

## 13) Sauvegarde

* Installer **Sauvegarde Windows Server**
* Planifier une sauvegarde quotidienne à **20h**
* Source : dossier principal de l’entreprise
* Destination : **2e disque**
* Lancer aussi une **sauvegarde unique**
* Restaurer dans un dossier `Restauration` sur le bureau

## 14) Sécurité Windows

Dans **Sécurité Windows**, vérifier les 4 voyants verts :

* Protection antivirus / menaces
* Pare-feu réseau
* Contrôle des applications / navigateur
* Sécurité de l’appareil

## 15) Contrôle final

* DNS OK
* Domaine OK
* OU / groupes / utilisateurs OK
* Horaires / expiration OK
* Partage OK
* NTFS OK
* Héritage coupé aux bons endroits
* Lecteur `W:` OK
* Script OK
* GPO OK
* Sauvegarde + restauration OK

### Règle simple à mémoriser

* **Partage = large**
* **NTFS = précis**
* **Héritage coupé seulement sur les dossiers sensibles**
  → **personnels** + **payes/confidentiel**

Si tu veux, je peux maintenant te faire une **version encore plus condensée “1 page révision rapide”**, prête à imprimer.
