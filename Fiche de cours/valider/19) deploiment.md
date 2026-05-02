Voici une version Markdown propre avec tes images en taille 50 % :

````markdown
# Déploiement par GPO – fiche express

Objectif : déployer un logiciel MSI ou un script PowerShell par GPO sur des postes clients du domaine.

---

## 1. Préparation du poste client

Avant de toucher aux GPO, vérifier le poste client.

Checklist :

- Vérifier le pare-feu Windows.
- Vérifier les réglages réseau VMware.
- Vérifier la carte réseau du poste client.
- Vérifier que le poste est dans le bon réseau.
- Vérifier que le DNS pointe vers le serveur du domaine.

Exemple de configuration réseau :

- IP client : `192.168.48.159`
- Passerelle par défaut : `192.168.48.2`
- DNS : `192.168.48.2`

Dans les paramètres DNS avancés :

- Ajouter le suffixe DNS du domaine / de la forêt.
- Vérifier que le nom du domaine est correct.
- Vérifier que le poste client peut résoudre le serveur.

<img src="https://github.com/user-attachments/assets/7dfe109c-de63-4fda-8406-11f50ef0c8e8" width="50%">

---

## 2. Préparer le dossier installateur partagé

Créer un dossier partagé qui contient les installateurs MSI ou les scripts.

Exemple :

```text
\\SERVEUR\Installateurs
````

Droits à vérifier :

* Partage : `Tout le monde`
* Sécurité NTFS : `Tout le monde`
* Ajouter aussi les ordinateurs du domaine ou les ordinateurs clients si le labo le demande.

Important :

* Le chemin doit être un chemin UNC.
* Ne pas utiliser un chemin local comme `C:\Installateurs`.
* Les postes clients doivent pouvoir accéder au dossier au démarrage.

---

## 3. Organisation Active Directory

Avant de lier les GPO, vérifier les OU.

À faire :

* Les utilisateurs sont déjà créés.
* Déplacer les postes depuis `Computers` vers la bonne OU.
* Créer ou utiliser des OU séparées :

  * Utilisateurs
  * Groupes
  * Ordinateurs clients
* Vérifier que le poste client est bien joint au domaine.

---

## 4. Installation MSI par GPO

Chemin classique :

```text
Configuration ordinateur
→ Stratégies
→ Paramètres du logiciel
→ Installation de logiciels
→ Nouveau
→ Package
```

Règles importantes :

* Utiliser le package MSI depuis un chemin UNC.
* Lier la GPO à la bonne OU.
* Dans le filtrage de sécurité, mettre seulement le groupe attribué.
* Pour l’évaluation ou la lecture de la GPO, ajouter `Utilisateurs authentifiés` si nécessaire.
* Ajouter l’ordinateur client dans les droits si le labo le demande.

<img src="https://github.com/user-attachments/assets/21e80965-783e-43a9-ab5b-81998f940d87" width="50%">

---

## 5. Sécurité de la GPO

Dans la sécurité de la GPO, vérifier :

* Le groupe ciblé doit avoir les droits nécessaires.
* Le groupe doit pouvoir appliquer la stratégie.
* Les utilisateurs authentifiés peuvent être ajoutés pour permettre la lecture si nécessaire.
* Le filtrage doit rester propre : ne pas laisser trop de groupes inutiles.

<img src="https://github.com/user-attachments/assets/93e7a092-0453-4048-b100-1e1924e53e9f" width="50%">

<img src="https://github.com/user-attachments/assets/7da65e59-669a-49bd-86d1-5f6c40e263e9" width="50%">

---

## 6. Script PowerShell au démarrage

Pour déployer un script PowerShell au démarrage :

```text
Configuration ordinateur
→ Stratégies
→ Paramètres Windows
→ Scripts
→ Démarrage
```

À vérifier :

* Le script est dans un dossier accessible par les postes clients.
* Le script est lancé en démarrage ordinateur.
* Le poste client a les droits de lecture sur le script.
* Le script doit fonctionner sans session utilisateur ouverte.

<img src="https://github.com/user-attachments/assets/d0efd397-0466-4cad-a679-72dce388c7cb" width="50%">

---

## 7. Autoriser les scripts PowerShell

Dans l’éditeur de stratégie de groupe :

```text
Configuration ordinateur
→ Modèles d’administration
→ Composants Windows
→ Windows PowerShell
```

Activer la stratégie permettant l’exécution des scripts.

À retenir :

* Autoriser les scripts distants si le script vient d’un partage réseau.
* Vérifier que la stratégie ne bloque pas l’exécution PowerShell.
* Redémarrer le poste client après application.

<img src="https://github.com/user-attachments/assets/76c12552-f8c7-4d5d-abdc-69128612231b" width="50%">

---

## 8. Commandes côté client

Sur le poste client, lancer :

```cmd
gpupdate /force
```

Puis redémarrer :

```cmd
shutdown /r /t 0
```

Après redémarrage, vérifier :

* Le logiciel est installé.
* Le script s’est exécuté.
* La GPO apparaît dans les résultats.
* Le poste client est bien dans la bonne OU.

---

## 9. Commande de vérification

Commande utile :

```cmd
gpresult /USER admin /R
```

Variante avec domaine :

```cmd
gpresult /USER DOMAINE\admin /R
```

À vérifier dans le résultat :

* La GPO est bien appliquée.
* Le bon utilisateur est ciblé.
* Le bon ordinateur est ciblé.
* Aucun filtrage de sécurité ne bloque la GPO.

---

## 10. Bonus : ajouter un compte en administrateur local

Si le labo le demande, ajouter un compte ou un groupe dans les administrateurs locaux du poste.

Chemin classique :

```text
Configuration ordinateur
→ Préférences
→ Paramètres du Panneau de configuration
→ Utilisateurs et groupes locaux
```

À faire :

* Créer ou modifier le groupe `Administrateurs`.
* Ajouter le compte ou le groupe demandé.
* Appliquer la GPO à l’OU des ordinateurs clients.
* Redémarrer le poste client.

<img src="https://github.com/user-attachments/assets/7aee09ab-5d3d-497c-aa2f-6b4b1ab061d9" width="50%">

---

## Ordre conseillé

1. Vérifier le réseau du client.
2. Vérifier DNS + suffixe DNS.
3. Vérifier que le poste est joint au domaine.
4. Déplacer le poste dans la bonne OU.
5. Préparer le dossier partagé des installateurs.
6. Créer la GPO MSI ou script.
7. Régler le filtrage de sécurité.
8. Lier la GPO à la bonne OU.
9. Lancer `gpupdate /force`.
10. Redémarrer avec `shutdown /r /t 0`.
11. Vérifier avec `gpresult /USER admin /R`.

```

Petite note : sur GitHub, `width="50%"` fonctionne généralement mieux que `style="width:50%;"` dans du Markdown.
```



## 1. Préparation


securite windows par feu


dossier installateur partager tout le monde et securite tout le monde et ordi locaux
<img width="1411" height="877" alt="image" src="https://github.com/user-attachments/assets/7dfe109c-de63-4fda-8406-11f50ef0c8e8" />



Les gpo on mets que le groupe attribuer
installatation msi gpo
<img width="1814" height="930" alt="image" src="https://github.com/user-attachments/assets/21e80965-783e-43a9-ab5b-81998f940d87" />

securite gpo 
<img width="776" height="520" alt="image" src="https://github.com/user-attachments/assets/93e7a092-0453-4048-b100-1e1924e53e9f" />
evaulation rajoute utilisateur authentifier
<img width="1844" height="879" alt="image" src="https://github.com/user-attachments/assets/7da65e59-669a-49bd-86d1-5f6c40e263e9" />


on met ordinateur client dans les droits
script powershell demarrage
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d0efd397-0466-4cad-a679-72dce388c7cb" />
autoriser les script distant dans editeur de gestion de strategies de groupes windows poweshell
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/76c12552-f8c7-4d5d-abdc-69128612231b" />


check list 


dns et nom du donaime sur l ordi client a changer

OU
Tous users groupes et ordi clients le deplacer de computer 


sur le client
gpupdate /force
shutdown /r /t 0

bonus
mettre un compte en admin local
<img width="1563" height="893" alt="image" src="https://github.com/user-attachments/assets/7aee09ab-5d3d-497c-aa2f-6b4b1ab061d9" />


commande de verification
gpresolt user admin identity
