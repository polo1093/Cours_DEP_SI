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

📸 **Capture à insérer : Autoriser les notifications **

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

# ✅ Cas 3 — Procédures iPhone (iOS 17+) : Outlook / OneDrive / Teams (avec tes captures)

---

# ✅ 1) Microsoft Outlook — Notifications (réglage iOS)

## 1.1 Accéder aux réglages iPhone

📌 **Action :** ouvrir l’app **Réglages** ⚙️

📸 **Capture à insérer : Accès Réglages**

<div align="center">
  <img src="https://github.com/user-attachments/assets/4b087848-6d8a-4c70-8d2e-d16b1e95cdcf" width="420" alt="iPhone - Accès Réglages" />
</div>

---

## 1.2 Ouvrir la section Notifications

📌 **Chemin :** **Réglages** ⚙️ → **Notifications**

📸 **Capture à insérer : Menu Réglages**

<div align="center">
  <img src="https://github.com/user-attachments/assets/08cd9422-3b67-4169-ba27-0b3cac43e8e1" width="420" alt="iPhone - Menu Réglages" />
</div>

---

## 1.3 Autoriser les notifications Outlook

📌 **Chemin :** **Notifications** → **Outlook** → activer **Autoriser les notifications** ✅

**Réglages recommandés (pro, non intrusif) :**

* ✅ **Centre de notifications** : ON
* ✅ **Pastilles** : ON
* 🔕 **Sons** : OFF (sauf exigence)
* 🟦 **Bannières** : **Temporaire** (évite l’interruption)

📸 **Capture à insérer : Autoriser**

<div align="center">
  <img src="https://github.com/user-attachments/assets/4b003533-67b8-439e-bf20-c86f8eeff008" width="420" alt="iPhone - Autoriser notifications Outlook" />
</div>

📸 **Capture à insérer : Centre de notifications Outlook**

<div align="center">
  <img src="https://github.com/user-attachments/assets/2fac8a01-b73c-4644-9660-34c25f2d28cc" width="420" alt="iPhone - Centre de notifications Outlook" />
</div>

✅ **Validation :**

* Outlook affiche des alertes dans le **Centre de notifications**
* Badge Outlook visible (si activé)

---

# ✅ 2) OneDrive — Synchronisation + sauvegarde (confidentialité)

## 2.1 Vérifier les fichiers synchronisés (espace de travail)

📌 **Objectif :** confirmer que les fichiers pro sont visibles/synchronisés.

📸 **Capture à insérer : Liste fichiers synchronisés OneDrive**

<div align="center">
  <img src="https://github.com/user-attachments/assets/ccd9d1d1-99f2-4c59-83b2-25f580f205f7" width="420" alt="iPhone - OneDrive fichiers synchronisés" />
</div>

✅ **Bonnes pratiques confidentialité :**

* Éviter de mélanger pro/perso (dossiers distincts).
* Ne rendre **hors ligne** que le strict nécessaire (documents non sensibles si possible).
* Utiliser un verrouillage iPhone (Face ID/code) pour protéger l’accès aux fichiers.

---

## 2.2 Activer la sauvegarde automatique (OneDrive)

📌 **Objectif :** éviter la perte de données (photos/documents selon politique).

📸 **Capture à insérer : Sauvegarde OneDrive (1)**

<div align="center">
  <img src="https://github.com/user-attachments/assets/8d145442-575b-410e-a4d7-8553c01384b7" width="420" alt="iPhone - OneDrive sauvegarde 1" />
</div>

📸 **Capture à insérer : Sauvegarde OneDrive (2)**

<div align="center">
  <img src="https://github.com/user-attachments/assets/51af04fd-ead3-4ede-85df-e6eb43b13757" width="420" alt="iPhone - OneDrive sauvegarde 2" />
</div>

✅ **Recommandation pro :**

* **Sauvegarde appareil photo** : ON **uniquement** si appareil pro / politique autorise.
* Sinon : OFF (évite de téléverser des photos personnelles dans l’espace pro).

✅ **Validation :**

* Indicateur de sauvegarde actif
* Dernière sauvegarde visible / pas d’erreur

---

# ✅ 3) Microsoft Teams — Paramètres + notifications + autorisations

## 3.1 Accéder aux paramètres Teams

📌 **Action :** ouvrir Teams puis accéder au menu/profil pour atteindre les réglages.

📸 **Capture à insérer : Accès paramètres Teams**

<div align="center">
  <img src="https://github.com/user-attachments/assets/6eff0b8f-d839-4525-bad1-b1da44c7d6bb" width="420" alt="iPhone - Teams accès paramètres" />
</div>

📸 **Capture à insérer : Onglet Paramètres**

<div align="center">
  <img src="https://github.com/user-attachments/assets/31cc9d3f-6735-4422-a799-a8aaac47806b" width="420" alt="iPhone - Teams onglet paramètres" />
</div>

---

## 3.2 Notifications Teams (limiter au pertinent)

📌 **Objectif :** recevoir messages/alertes importantes sans surcharge.

📸 **Capture à insérer : Sélection du bon “degré”**

<div align="center">
  <img src="https://github.com/user-attachments/assets/53bb8981-dd41-4978-aac8-1a22995c97a1" width="420" alt="iPhone - Teams niveau notifications" />
</div>

📸 **Capture à insérer : Vérification**

<div align="center">
  <img src="https://github.com/user-attachments/assets/508fbea8-ff08-40ce-ae34-3a00f645d60e" width="420" alt="iPhone - Teams vérification notifications" />
</div>

✅ **Paramétrage recommandé (pro)**

* ✅ Messages directs
* ✅ Mentions (@toi)
* ✅ Appels / réunions
* ❌ Réactions / “bruit” (si option disponible)

✅ **Validation :**

* Mentions et messages directs déclenchent une alerte
* Pas d’alertes inutiles en continu

---

## 3.3 Autorisations Teams — micro/caméra/localisation (least privilege)

📌 **Principe :** autoriser seulement ce qui est nécessaire au travail.

📸 **Capture à insérer : Géolocalisation**

<div align="center">
  <img src="https://github.com/user-attachments/assets/d0645e61-e38c-415d-a35c-3a3dfbea76cd" width="420" alt="iPhone - Teams géolocalisation" />
</div>

✅ **Recommandations :**

* 🎤 **Micro** : ON (sinon appels impossibles)
* 📷 **Caméra** : ON si visio utilisée, sinon OFF
* 📍 **Localisation** : **Jamais** ou **Lors de l’utilisation** (souvent **Jamais** en pro si inutile)

✅ **Validation :**

* Appels Teams OK (micro)
* Visio OK si caméra autorisée
* Localisation non accessible si non requise

---

# ✅ 4) Mini-check “sécurité” (à ajouter à ton rendu)

* **Aperçu des notifications** : Réglages → Notifications → *Afficher les aperçus* = **Si déverrouillé**
* **Focus/Ne pas déranger** : vérifier qu’il ne bloque pas Outlook/Teams
* **Déconnexion fin d’exercice** : se déconnecter des comptes CSS dans Outlook/OneDrive/Teams

---
# ✅ Cas 3 — Procédures Samsung (Android One UI 6+) : Outlook / OneDrive / Teams (avec tes captures)

---

# ✅ 1) Microsoft Outlook — Accès réglages + notifications (dans l’app)

## 1.1 Accéder au menu des réglages Outlook

📌 **Objectif :** ouvrir la configuration Outlook pour ajuster les notifications (éviter surcharge).

📸 **Capture à insérer : Accès réglages Outlook**

<div align="center">
  <img src="https://github.com/user-attachments/assets/e81c6dd8-355d-433d-8769-da9a2abcbc55" width="420" alt="Samsung - Outlook accès réglages" />
</div>

📌 **Action :**

1. Ouvrir **Outlook**
2. Appuyer sur le **menu/profil** (selon l’interface)
3. Aller dans **Paramètres** ⚙️

📸 **Capture à insérer : Écran Réglages Outlook**

<div align="center">
  <img src="https://github.com/user-attachments/assets/5b14e8cd-8ccd-49f8-afb2-c5fdbe153a81" width="420" alt="Samsung - Outlook réglages" />
</div>

### Réglage recommandé (pro, non intrusif)

Dans Outlook → **Notifications** (ou équivalent) :

* ✅ **Nouveaux courriels** : ON
* ✅ **Prioritaire / Boîte de réception ciblée** : ON si option
* 🔕 **Son/Vibration** : OFF (ou vibration only, selon politique)
* ❌ Désactiver alertes secondaires (publicité, “tips”, etc.) si présentes

✅ **Validation :**

* Réception d’un mail test → notification visible (sans spam)

---

# ✅ 1.2 Autoriser les notifications côté Samsung (si besoin)

📌 **Chemin système :**
**Paramètres** ⚙️ → **Notifications** → **Notifications des applications** → **Outlook** → ON ✅

**Réglage pro :**

* ✅ Autoriser notifications
* ✅ Badges (pastilles)
* 🔕 Son OFF (optionnel)
* Priorité “silencieuse” si tu veux éviter interruptions

*(si ton enseignant veut une preuve système, fais une capture ici)*

---

# ✅ 2) OneDrive — Synchronisation + sauvegarde

## 2.1 Vérifier les fichiers synchronisés

📌 **Objectif :** confirmer que l’espace pro est bien synchronisé.

📸 **Capture à insérer : Liste fichiers synchronisés OneDrive**

<div align="center">
  <img src="https://github.com/user-attachments/assets/437b6c76-5c73-4acc-b009-5641f2fb9be0" width="420" alt="Samsung - OneDrive fichiers synchronisés" />
</div>

✅ **Bonnes pratiques confidentialité**

* Séparer pro/perso (ne pas utiliser le compte pro pour données personnelles).
* Ne rendre hors-ligne que le strict nécessaire.
* Éviter partage public de liens (privilégier liens internes / droits restreints).

---

## 2.2 Activer la sauvegarde automatique (OneDrive)

📌 **Objectif :** éviter perte de données (selon politique entreprise).

📸 **Capture à insérer : Sauvegarde OneDrive**

<div align="center">
  <img src="https://github.com/user-attachments/assets/6934c0e9-92c7-458f-9b80-17fa6cc80308" width="420" alt="Samsung - OneDrive sauvegarde" />
</div>

✅ **Recommandation pro**

* Sauvegarde **activée uniquement** si c’est demandé (téléphone pro).
* Si téléphone personnel : éviter de sauvegarder photos perso dans espace pro.

✅ **Validation**

* Indicateur de sauvegarde actif
* Pas d’erreurs de synchronisation

---

# ✅ 3) Microsoft Teams — Notifications + autorisations (micro/caméra/localisation)

## 3.1 Réglage des notifications (choix du “bon degré”)

📌 **Objectif :** recevoir l’important (messages/mentions/appels) sans bruit.

📸 **Capture à insérer : Sélection du bon degré**

<div align="center">
  <img src="https://github.com/user-attachments/assets/6341ca67-ad69-4ec6-b69f-380dad559493" width="420" alt="Samsung - Teams degré notifications" />
</div>

📸 **Capture à insérer : Paramètres Teams**

<div align="center">
  <img src="https://github.com/user-attachments/assets/81f07744-e5a6-4775-90b9-173b19addfdd" width="420" alt="Samsung - Teams paramètres" />
</div>

✅ **Paramétrage recommandé**

* ✅ Messages directs
* ✅ Mentions (@toi)
* ✅ Appels / réunions
* ❌ Réactions / “bruit” (si dispo)
* 🔕 Son OFF ou vibration selon politique

✅ **Validation**

* Un message direct déclenche une notification
* Les notifications “parasites” sont limitées

---

## 3.2 Gérer les autorisations (least privilege)

📌 **Objectif :** limiter l’accès aux données (conformité + confidentialité).

📸 **Capture à insérer : Menu autorisations Teams**

<div align="center">
  <img src="https://github.com/user-attachments/assets/5eedfcdd-d9f2-4835-9978-3ec2db14afe1" width="420" alt="Samsung - Teams autorisations" />
</div>

### Caméra

📸 **Capture à insérer : Autorisation caméra**

<div align="center">
  <img src="https://github.com/user-attachments/assets/6718ff29-f374-4fb0-b919-01102330d818" width="420" alt="Samsung - Teams autorisation caméra" />
</div>

✅ Reco :

* 📷 **Caméra** : **Autoriser uniquement pendant l’utilisation** (ou ON si besoin visio)
* 🎤 **Micro** : **Autoriser pendant l’utilisation** (sinon appels KO)

### Localisation

📸 **Capture à insérer : Géolocalisation**

<div align="center">
  <img src="https://github.com/user-attachments/assets/646d47a7-964d-4a3d-90c3-e99dc7c565ab" width="420" alt="Samsung - Teams géolocalisation" />
</div>

✅ Reco :

* 📍 **Localisation** : **Refuser** / **Jamais** (sauf usage métier justifié)
* Si exigé : **Uniquement pendant l’utilisation** (pas “Toujours”)

✅ **Validation**

* Appel Teams OK (micro)
* Visio OK si activée (caméra)
* Pas d’accès permanent à la localisation

---

# ✅ 4) Mini-check “fin d’exercice” (important)

Après les tests avec le compte CSS :

* Dans Outlook / OneDrive / Teams : **Se déconnecter**
* Optionnel : supprimer le compte pro de l’appareil si demandé
* Vérifier que les fichiers pro ne restent pas en offline

---















---



