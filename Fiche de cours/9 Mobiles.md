poisson1093@gmail.com
Total223

samasung
1234   : Nip
qwer   : password

Apple 
123456 : Nip
FaceID





---

# 📱 **Cas 1 — Sécurisation parc mobile (Apple iOS 17+ / Samsung One UI 6+)**

**Technicien :** Paul Poisson
**Date :** 18/02/2026
**Cas :** 1

---

## 🎯 **Fonctions de sécurité retenues (2 par système)**

### 🍏 **Apple (iOS 17+)**

* 🔒 **Verrouillage :** Code + **Face ID**
* 📍 **Localiser :** **Localiser mon iPhone** (Find My)

### 🤖 **Samsung (One UI 6+)**

* 🔒 **Verrouillage :** **PIN** (+ biométrie si disponible)
* 📍 **Localiser :** **Google — Localiser mon appareil** *(Samsung Find My si compte Samsung utilisé)*

---

## 🔑 **Codes utilisés (lab)**

> ⚠️ *Ces codes sont uniquement pour le laboratoire. En production : code fort (≥ 6 chiffres / idéal alphanumérique).*

* 🤖 **Samsung :** PIN **`1234`** — MDP **`qwer`**
* 🍏 **Apple :** Code **`123456`** — **Face ID**

---

# ✅ **Procédure Samsung (One UI 6+)**

## 1) 🔒 **Activer PIN + biométrie**

**Chemin :**
**Paramètres** ⚙️ → **Sécurité et confidentialité** 🔐 → **Écran de verrouillage** → **Type de verrouillage** → **PIN** → saisir **`1234`**

<div align="center">
  <img src="https://github.com/user-attachments/assets/174110bf-0295-4ca6-86c9-65658292d95b" width="520" alt="Capture Samsung - Sécurité" />
</div>

---

# ✅ **Procédure Apple (iOS 17+)**

## 1) 🔒 **Activer code + Face ID**

**Chemin :**
**Réglages** ⚙️ → **Face ID et code** 🙂🔐 → **Activer le code** → saisir **`123456`**

**Puis :**
**Configurer Face ID** → activer **Déverrouiller l’iPhone** ✅

📸 **Captures à insérer :** Face ID & code + code activé + Face ID

---

## 2) 📍 **Activer “Localiser mon iPhone” (Find My)**

**Chemin :**
**Réglages** ⚙️ → **[Nom / Apple ID]** → **Localiser** 📍 → **Localiser mon iPhone** → **Activer** ✅
*(+ “Envoyer la dernière position” si affiché)*

<div align="center">
  <img src="https://github.com/user-attachments/assets/266aa715-0f7f-472a-b511-783384239a92" width="520" alt="Capture Apple - Localiser" />
</div>

---

# 🧠 **Comparatif à présenter au superviseur (sécurité / confidentialité)**

* 🍏 **Apple :** parcours très homogène; sécurité fortement intégrée à **Apple ID/iCloud** (Find My, protections), 
écosystème plus fermé ⇒ **moins de variabilité** entre appareils.
* 🤖 **Samsung/Android :** sécurité robuste mais plus variable (modèle/One UI); services répartis entre **Google** (Localiser mon appareil) et **Samsung** (Find My Mobile) ⇒ **standardisation nécessaire**.
* 🔐 **Gestion professionnelle :** les deux sont compatibles gestion “pro” (MDM). Apple est souvent plus uniforme; Android demande plus de procédures + points de contrôle.



# ✅ Procédure Apple (iOS 17+) — Audit & maintenance des applications

## 1) 🔔 Activer les notifications de mise à jour (App Store)

**Objectif :** s’assurer que les alertes de mise à jour sont actives (hygiène sécurité + conformité).

**Chemin :**
**Réglages** ⚙️ → **Notifications** → **App Store** → activer **Autoriser les notifications** ✅
*(Optionnel recommandé : activer “Bannières”, “Sons”, “Badges” selon la politique interne.)*

📸 **Capture à insérer : Notifications > App Store**

<div align="center">
  <img src="https://github.com/user-attachments/assets/8119b0e0-77c1-4f47-bd67-bef56542a649" width="420" alt="iPhone - Notifications App Store" />
</div>

📸 **Capture à insérer : Autoriser les notifications (image tournée 90° à gauche)**

> Si tu colles ça dans un support qui accepte le HTML/CSS (ex : certaines pages web), tu peux forcer la rotation comme ci-dessous.

<div align="center">
  <img src="https://github.com/user-attachments/assets/21333d5b-5a60-46c7-ab12-4ef0cd976e26" width="420" alt="iPhone - Autoriser notifications" style="transform: rotate(-90deg);" />
</div>

**Validation :**

* Le switch **Autoriser les notifications** est **ON** ✅
* Les notifications App Store sont affichées/paramétrées selon la politique.

---

## 2) ⬆️ Vérifier / lancer les mises à jour (App Store)

**Chemin :**
**App Store** → icône **Profil** (haut droite) → section **Mises à jour disponibles** → **Tout mettre à jour** ✅
*(ou “Mettre à jour” sur une app ciblée, ex. Outlook/Teams.)*

**Validation :**

* Plus de “Mises à jour disponibles”
* Les apps critiques (messagerie, navigateur, MDM, VPN) sont à jour.

---

## 3) 🗑️ Désinstaller une application inutile

**Objectif :** réduire le risque (permissions, surface d’attaque) + optimiser stockage.

**Méthode standard :**

1. Appui long sur l’icône de l’app.
2. **Supprimer l’app** → **Supprimer** (confirmation) ✅

📸 **Capture à insérer : Supprimer app**

<div align="center">
  <img src="https://github.com/user-attachments/assets/170f1b85-f953-4788-8d6e-114e518d1043" width="420" alt="iPhone - Supprimer application" />
</div>

**Validation :**

* L’app n’apparaît plus dans la **Bibliothèque d’apps**
* Stockage libéré (optionnel : **Réglages → Général → Stockage iPhone**)

---

---

# ✅ Procédure Samsung (Android One UI 6+) — Audit & maintenance des applications

## 1) 👤 Accéder au profil Play Store

**Chemin :**
**Google Play Store** → icône **Profil** (haut droite) ✅

📸 **Capture à insérer : Cliquer sur profil**

<div align="center">
  <img src="https://github.com/user-attachments/assets/e8b83c7e-6d03-4b68-8655-9d9aeb80eeab" width="420" alt="Samsung - Profil Play Store" />
</div>

---

## 2) 🧩 Ouvrir “Gérer les applications et l’appareil”

**Chemin :**
Play Store → **Profil** → **Gérer les applications et l’appareil** ✅

📸 **Capture à insérer : Gérer les applis**

<div align="center">
  <img src="https://github.com/user-attachments/assets/0ec9a7b5-3c1d-49b6-bb4d-ed9a31714a7e" width="420" alt="Samsung - Gérer les applications" />
</div>

---

## 3) ⬆️ Mettre à jour / confirmer “Tout est à jour”

**Chemin :**
**Gérer les applications et l’appareil** → section **Mises à jour disponibles** → **Tout mettre à jour**
*(ou afficher l’état “Tout est à jour”.)*

📸 **Capture à insérer : Mises à jour — Tout est à jour**

<div align="center">
  <img src="https://github.com/user-attachments/assets/ff280740-3f60-4904-9f79-37bf905a0b15" width="420" alt="Samsung - Tout est à jour" />
</div>



## 4) 🗑️ Désinstaller une application inutile

**Méthode (recommandée) :**

1. **Paramètres** → **Applications**
2. Sélectionner l’app à retirer
3. **Désinstaller** → confirmer ✅

📸 **Capture à insérer : Supprimer app**

<div align="center">
  <img src="https://github.com/user-attachments/assets/09870e83-0fab-40dc-ac8c-33e47cfa5b1d" width="420" alt="Samsung - Désinstaller application" />
</div>



iphone

notifications app 
<img width="1500" height="2000" alt="image" src="https://github.com/user-attachments/assets/8119b0e0-77c1-4f47-bd67-bef56542a649" />

autoriser notif pr maj image  rotation vers la gauche 90
<img width="2000" height="1500" alt="image" src="https://github.com/user-attachments/assets/21333d5b-5a60-46c7-ab12-4ef0cd976e26" />

supprimer app
<img width="1500" height="2000" alt="image" src="https://github.com/user-attachments/assets/170f1b85-f953-4788-8d6e-114e518d1043" />

samsung


cliquer sur profil
<img width="1500" height="2000" alt="image" src="https://github.com/user-attachments/assets/e8b83c7e-6d03-4b68-8655-9d9aeb80eeab" />

Gerer les appls
<img width="1500" height="2000" alt="image" src="https://github.com/user-attachments/assets/0ec9a7b5-3c1d-49b6-bb4d-ed9a31714a7e" />

mises a jour ts a jour
<img width="1500" height="2000" alt="image" src="https://github.com/user-attachments/assets/ff280740-3f60-4904-9f79-37bf905a0b15" />


supprimer app
<img width="1500" height="2000" alt="image" src="https://github.com/user-attachments/assets/09870e83-0fab-40dc-ac8c-33e47cfa5b1d" />


















---



