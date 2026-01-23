##  1)Systèmes de fichiers (HDD/SSD) — mémo

- **NTFS (Windows)**
    - ✅ Journalisation, **droits/ACL**, quotas, audit, chiffrement
    - 🎯 Idéal : **disque système / disque interne Windows**
- **FAT32 (très compatible)**
    - ✅ Compatibilité maximale (appareils, clés USB)
    - ⚠️ **Fichier ≤ 4 Go** ; formatage Windows souvent limité à **32 Go**
- **exFAT (externe moderne)**
    - ✅ Très bon pour **USB/disques externes** + **gros fichiers**
    - 🎯 Idéal : transferts **Windows ↔ macOS** (et souvent Linux selon support)
- **APFS (Apple)**
    - ✅ Optimisé SSD, chiffrement, gestion moderne de l’espace
    - 🎯 Idéal : volumes macOS/iOS
- **EXT4 (Linux)**
    - ✅ Standard Linux, robuste, performant
    - 🎯 Idéal : systèmes et données Linux

---

## 2) Partitionnement & tables (MBR / GPT) — mémo
14
- **MBR (legacy / BIOS)**
    - ⚠️ Disques jusqu’à **~2 To**
    - ⚠️ **4 partitions primaires** max (ou 3 + 1 étendue)
    - ❌ Pas de redondance → plus sensible à la corruption
    - 🔹 Notions : **partition active** (boot), **partition étendue** (lecteurs logiques)
- **GPT (moderne / UEFI)**
    - ✅ Disques **> 2 To**
    - ✅ Jusqu’à **128 partitions**
    - ✅ Table plus robuste (copie + vérifications)
    - 🔹 Notion : **ESP (EFI System Partition)** pour le démarrage
- **Règle rapide**
    - PC récent / UEFI / grand disque → **GPT**
    - Compatibilité ancien matériel/OS (BIOS) → **MBR**
 
## 3) Lettres de lecteurs — contraintes à connaître 📌

* 🔤 Une partition/volume formaté se voit attribuer une lettre (**C:, D:, E:, …**)
* ⚠️ Tu ne peux pas “aller jusqu’à 26” librement, car :

  * **A:** et **B:** sont historiquement réservées (lecteurs de disquettes)
  * Les périphériques (DVD, USB, téléphone, etc.) **consomment aussi** des lettres
    ➜ En pratique, la disponibilité des lettres dépend de l’inventaire matériel connecté. 

---

## 4) Gestion des disques — contrôler le type de table 🧭

* ✅ Pour vérifier si un disque est en **MBR** ou **GPT** :

  * Gestion des disques → clic droit **Disque 0** → **Propriétés** → onglet **Volumes**
  * Lire **Type de partition** (MBR/GPT) 

---

## 5) DISKPART — procédure standard (clé/disque) 🧰

> ⚠️ Manipulations avancées : toujours identifier **le bon disque** avant suppression/clean. 

### 🔧 Workflow typique (partition + format + lettre)

* `list disk` → lister les disques
* `select disk X` → sélectionner le disque cible
* `clean` → nettoyer la table (⚠️ destructif)
* `create part primary` → créer une partition primaire
* `select part 1` → sélectionner la partition
* `active` → marquer **active** (cas MBR/BIOS)
* `format fs=ntfs quick` → formatage NTFS rapide
* `assign letter=F` → attribuer une lettre 

### 🧪 Exercice (variante FAT32)

* `create partition primary size=2000` → partition ~2 Go
* `format fs=fat32`
* `assign letter=F`
* `list volume` → repérer le volume pour le renommer ensuite 

---

## 6) Systèmes de fichiers — choix rapide 💾

* **NTFS** ✅ : standard Windows (interne, droits NTFS, robustesse)
* **FAT32** ✅ : très compatible, mais limitations (notamment taille de fichier)
* **exFAT** ✅ : conçu pour les supports externes, “successeur” moderne de FAT32 

---

## 7) Commandes CMD à connaître (maintenance) 🖥️

* 🎨 `color` → changer la couleur de la console (codes **0–9** et **A–F**) 
* 🩺 `chkdsk X:` → vérifier l’intégrité du système de fichiers et chercher des erreurs 
* 🧱 `sfc /scannow` → contrôler/réparer les fichiers système protégés 
* 🧾 `help` / `commande /?` → obtenir l’aide et les paramètres disponibles 

---

## 8) Clé USB bootable (Rufus) — mapping BIOS/UEFI 🧩

* 🧱 Machine **BIOS (ancien)** → schéma **MBR** + cible **BIOS**
* 🚀 Machine **UEFI (moderne)** → schéma **GPT** + cible **UEFI**
* 💾 Système de fichiers : **NTFS** (cas standard) 

Voici les **2 blocs à ajouter** à ton mémo (copier-coller). 👇

---

## 9) Gestion de l’ordinateur — droits utilisateur & groupes (Windows) 🛡️

### 🧭 Outils à connaître

* **Gestion de l’ordinateur** : `compmgmt.msc` (Win+R)
* **Utilisateurs et groupes locaux** : `lusrmgr.msc` (Win+R) 
* **Panneau de configuration → Comptes d’utilisateurs** : création simple (admin vs limité) 

### ⚠️ Windows Home vs Pro (impact admin)

* Sur **Windows Familiale**, l’outil **Gestion de l’ordinateur** ne permet pas de gérer les utilisateurs (fonctionnalité absente/bridée) 
* Sur **Windows Pro**, tu peux gérer **groupes locaux** + rôles plus fins (ex. **Opérateur de sauvegarde**) 

### 👥 Groupes locaux (RBAC “light”)

Exemples de groupes (selon besoins) : **Administrateurs**, **Utilisateurs**, **Invités**, **Opérateurs de configuration réseau**, **Opérateur de sauvegarde**, **Utilisateurs du Bureau à distance**, etc. 
➡️ Pour voir la définition/descriptions : **Gestion de l’ordinateur → Outils système → Utilisateurs et groupes locaux → Groupes** 

### 🧬 Point critique : SID ≠ nom d’utilisateur

* Un compte est associé à un **SID** (identifiant sécurité).
* Si tu supprimes un utilisateur puis recrées le “même nom”, **c’est un autre compte** (SID différent) → effets sur permissions NTFS/accès 

### 🔐 Droits sur fichiers/dossiers : NTFS obligatoire

* Les **droits d’accès**, **quotas** et **audit** reposent sur **NTFS** (FAT32/exFAT ne gèrent pas ces mécanismes au même niveau) 

### ✅ Workflow “propre” (poste local)

1. Créer l’utilisateur (Panneau de config / `lusrmgr.msc`) 
2. L’affecter à un **groupe local** adapté (principe du moindre privilège) 
3. Appliquer les **permissions NTFS** sur le dossier cible (Propriétés → Sécurité → Avancé : héritage/propagation)
4. Si besoin : activer **audit** (journalisation) côté stratégie de sécurité + événements

---

## 10) Windows 11 — mémo express 🪟

### 🧩 Pré-requis (focus compatibilité)

Recommandé : CPU 64-bit (≥2 cœurs), **8 Go RAM**, **SSD 128 Go+**, **UEFI + Secure Boot**, **TPM 2.0**, GPU DirectX 12/WDDM 2.0+, écran 1080p+, Internet. 
⚠️ **Compte Microsoft** requis pour certaines fonctionnalités / configuration initiale (selon édition/scénario) 

### 🧾 Éditions principales

Home, Pro, Pro for Workstations, Enterprise (et aussi Éducation, etc.) 

### 🧭 UI / ergonomie : ce qui change vite

* **Barre des tâches** modernisée, icônes/menus simplifiés, notifications + calendrier à droite 
* Paramétrage : clic droit barre des tâches → **Paramètres de la barre des tâches** 
* Gestion : éléments (Recherche/Widgets/Tâches), icônes angle, overflow, comportements (alignement centré/gauche, auto-masquage, multi-écrans) 
* Raccourci utile : afficher le bureau ≈ **Win + D** 

### 🆕 “Nouvelles” fonctionnalités (axes)

Windows 11 vise : **moderniser l’UI**, **favoriser la productivité**, **faciliter la communication** 
Exemples : UI repensée (coins arrondis, animations), explorateur/menus simplifiés, barre des tâches centrée 

### 📌 Épingler/Détacher une app (barre des tâches)

* Démarrer → clic droit app → **Plus** → **Épingler à la barre des tâches** 
* Pour retirer : clic droit icône → **Détacher** 

### 🧯 Mode sans échec (rappel)

* Chemin très proche de Windows 10 ; sur Windows 11, l’accès “Démarrage avancé” passe par les options de récupération côté **Système** 



rajout protentiel gest ion ordi pr les droits utilisateur
