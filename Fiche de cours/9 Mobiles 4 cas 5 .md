# ✅ Cas 4 — iPhone (Outlook Mobile) : procédures + **tes captures**

---

## 1) 📥 Configurer la boîte **Prioritaire**

**Objectif :** trier automatiquement la boîte de réception en **Prioritaire / Autres** pour gagner du temps (usage commercial).

**Chemin :**
**Outlook** → **Profil** (haut gauche) → **⚙️ Réglages** → activer **Boîte Prioritaire**

**Étapes :**

1. Ouvrir **Outlook**.
2. Appuyer sur l’icône **Profil** (haut gauche).
3. Appuyer sur **⚙️ Réglages**.
<div align="center">
  <img src="https://github.com/user-attachments/assets/b15ecd5e-b82d-4051-b96c-33e23f3f0965" width="320" alt="Outlook iPhone - Réglages" />
</div>
5. Descendre jusqu’à **Boîte Prioritaire**.
<div align="center">
  <img src="https://github.com/user-attachments/assets/ccb582a9-7059-4929-9cfc-115585101da7" width="320" alt="Outlook iPhone - Boîte Prioritaire" />
</div>
6. Activer l’option ✅.







**Validation :**

* Dans la boîte de réception, l’utilisateur voit **2 onglets** : **Prioritaire** et **Autres**.

---

## 2) 🧠 Créer une **règle simple** sur Outlook Web + vérification mobile (dossier “Clients”)

**Objectif :** forcer les mails venant d’un client à arriver dans un dossier **Clients** (classement automatique).

**Chemin (Outlook Web) :**
⚙️ **Paramètres** → **Courrier** → **Règles**

**Étapes (Web) :**

1. Ouvrir Outlook Web et se connecter (compte Microsoft 365).
2. Cliquer sur **⚙️ Paramètres**.
3. Aller dans **Courrier** → **Règles**.
4. Cliquer **Ajouter une nouvelle règle**.
5. Définir :

   * **Nom** : `Clients – Déplacement automatique`
   * **Condition** : *De* = adresse client (ex. `client@exemple.com`)
   * **Action** : **Déplacer vers** → dossier **Clients**
   * (Optionnel) **Arrêter le traitement des autres règles** ✅
6. Cliquer **Enregistrer**.
7. Se **déconnecter** (bonne pratique).

<div align="center">
  <img src="https://github.com/user-attachments/assets/982857de-3241-476e-a06f-5ea8a294f5ea" width="700" alt="Outlook Web - Règles" />
</div>

**Vérification sur iPhone (Outlook Mobile) :**

1. Ouvrir **Outlook** sur iPhone.
2. Ouvrir la liste des dossiers (menu/profil).
3. Aller dans le dossier **Clients**.
4. Envoyer un mail test depuis l’adresse configurée → vérifier qu’il arrive dans **Clients**.

---

## 3) ✍️ Rédiger une **signature professionnelle** (Outlook iPhone)

**Objectif :** standardiser l’identité commerciale + crédibilité + contact direct.

**Chemin :**
**Outlook** → Profil → **⚙️ Réglages** → **Signature**

**Signature (modèle) :**
Prénom NOM
Poste / Fonction — Nom de l’entreprise
Tél : +1 (XXX) XXX-XXXX
[www.entreprise.com](http://www.entreprise.com)

**Étapes :**

1. Ouvrir **Outlook**.
2. Profil → **⚙️ Réglages**.
3. Ouvrir **Signature**.
4. Saisir la signature (modèle ci-dessus).
5. Revenir en arrière (sauvegarde automatique dans la plupart des cas).
6. Tester : s’envoyer un mail à soi-même.

<div align="center">
  <img src="https://github.com/user-attachments/assets/08ee1f33-18a7-4a6c-b076-ef49f89be043" width="420" alt="Outlook iPhone - Signature" />
</div>

---

## 4) 📎 Envoyer un courriel avec **pièce jointe via OneDrive** (lien)

**Objectif :** partager un document pro sans gonfler le mail + garder le contrôle d’accès (OneDrive).

**Chemin :**
**Outlook** → Nouveau message → **📎 Joindre** → **OneDrive** → **Joindre en tant que lien**

**Étapes :**

1. Ouvrir **Outlook** → **Nouveau message**.
2. Renseigner **À** + **Objet**.
3. Appuyer sur **📎**.
4. Choisir **Joindre un fichier** / **OneDrive**.

6. Sélectionner le document.
7. Choisir **Joindre en tant que lien** ).
<div align="center">
  <img src="https://github.com/user-attachments/assets/947da89b-e97a-43cf-b03d-b8bb2871f697" width="420" alt="Outlook iPhone - Joindre en tant que lien OneDrive" />
</div>
9. Envoyer le message.



<div align="center">
  <img src="https://github.com/user-attachments/assets/be65d869-73cf-43c8-9925-38a8964aa91c" width="420" alt="Outlook iPhone - Mail avec lien OneDrive" />
</div>

**Validation :**

* Le destinataire reçoit le mail avec un **lien OneDrive cliquable** ✅
* Le document reste contrôlable (droits/partage) côté OneDrive.
OK ✅ Je te génère le **bloc Markdown prêt à coller** pour tes **pages 5 et 6 (Cas 5 – iPhone)**, avec tes 2 captures (Google 2 étapes + Microsoft MFA).
Je reste volontairement “procédure élève” : **chemin, étapes, validation, captures**.

---

# ✅ **Cas 5 : Activation MFA Google Workspace (Google Authenticator)**

## 1) 🔐 Activer la validation en deux étapes (Google Workspace)

**Objectif :** sécuriser le compte Google Workspace via **MFA (TOTP)** avec **Google Authenticator**.

**Pré-requis (iPhone) :**

* Google Authenticator installé ✅
* Heure automatique activée : **Réglages** → **Général** → **Date et heure** → **Réglage automatique ON**

**Chemin :**
Navigateur (Safari/Chrome) → **myaccount.google.com/security** → **Validation en deux étapes**

### Étapes

1. Ouvrir **myaccount.google.com/security**
2. Aller dans **Validation en deux étapes** → **Commencer**
3. Suivre l’assistant (authentification + validation si demandée)
4. Choisir **Application d’authentification**
5. Scanner le QR code avec **Google Authenticator** :

   * Authenticator → **+** → **Scanner un code QR**
6. Saisir le **code 6 chiffres** généré → **Valider**
7. Activer / confirmer la **validation en deux étapes**

### Validation attendue

* Statut : **Validation en deux étapes = activée**
* Un jeton TOTP lié au compte Google apparaît dans **Google Authenticator**



<div align="center">
  <img src="https://github.com/user-attachments/assets/6a9e3caf-e791-4ba7-9697-aad5ce5a2789" width="650" alt="Google - Validation en deux étapes" />
</div>

---

# ✅ **Cas 5 : Activation MFA Microsoft 365 (Google Authenticator)**

## 2) 🔐 Activer la double authentification Microsoft 365 (MFA)

**Objectif :** sécuriser le compte Microsoft 365 via **MFA TOTP** (Google Authenticator) et valider un test de connexion.

**Chemin :**
Navigateur (Safari/Chrome) → **aka.ms/mfasetup** → **Méthodes de sécurité / Informations de sécurité**

### Étapes

1. Ouvrir **aka.ms/mfasetup**
2. Se connecter au compte Microsoft 365 (PME/CSS)
3. Ajouter une méthode MFA :

   * **Ajouter une méthode** → **Application d’authentification**
   * Choisir **“utiliser une autre application d’authentification”** (si proposé)
4. Scanner le QR code avec **Google Authenticator** :

   * Authenticator → **+** → **Scanner un code QR**
5. Entrer le **code 6 chiffres** → **Confirmer**
6. (Si proposé) définir cette méthode comme **méthode par défaut**

### Test MFA (obligatoire)

1. Se déconnecter du portail Microsoft 365
2. Se reconnecter
3. Lors de la demande MFA : entrer le code TOTP de Google Authenticator
4. Vérifier l’accès OK ✅

### Validation attendue

* MFA activée pour Microsoft 365
* Connexion réussie avec code TOTP

📸 **Capture à insérer : Double authentification Microsoft**

<div align="center">
  <img src="https://github.com/user-attachments/assets/b8b896b0-a00e-4066-a456-c6cbea4b98a9" width="650" alt="Microsoft 365 - Double authentification" />
</div>


---
## Cas 6 — MDM (ex. Miradore) : enrôlement, simulation, limites, procédure 📱🔐

---

# 1) Principe d’enrôlement (profil, certificats, compte)

### 🎯 Objectif MDM

L’enrôlement (“enrollment”) sert à **attacher un appareil** (iPhone/Galaxy) à une **console MDM** afin d’appliquer des **politiques** (sécurité, apps, Wi-Fi, restrictions), d’avoir un **inventaire**, et éventuellement des **actions à distance** (verrouillage, effacement, etc.).

### 🧩 Les 3 briques clés

**A) Le compte / identité**

* L’utilisateur (enseignant/testeur) s’authentifie avec un **compte** (souvent compte M365/Google/MDM local).
* Le MDM sait *qui* utilise l’appareil et à *quelle* unité/équipe il appartient.
* Ça permet l’**attribution** : politiques “Enseignants”, “Élèves”, “Appareils prêtés”, etc.

**B) Le profil MDM**

* C’est la “fiche de configuration” installée sur l’appareil :

  * Sur **iOS** : un **profil de gestion** (configuration profile) qui active la gestion de l’appareil.
  * Sur **Android** : une inscription via **Device Policy / Android Enterprise** (profil de travail ou appareil géré).
* Le profil crée le **lien de confiance** entre l’appareil et le serveur MDM.

**C) Certificats / confiance (PKI)**

* Pendant l’enrôlement, l’appareil obtient souvent :

  * un **certificat d’identité** (pour s’authentifier auprès du MDM),
  * et/ou des certificats Wi-Fi/VPN (si politiques réseau).
* Les certificats servent à :

  * authentifier l’appareil de façon forte,
  * chiffrer les échanges,
  * permettre du “zero trust” (accès réseau conditionnel).

✅ Résultat : appareil **enregistré**, **identifié**, **pilotable** par politiques — dans les limites du contexte (démo/école).

---

# 2) Étapes d’enrôlement (simulation / description) via app MDM ou QR

## iOS (iPhone) — scénario “app + profil de gestion”

> Variante typique en démo/formation : on installe l’app MDM (ou un agent) + on autorise l’installation d’un **profil**.

1. **Préparation**

   * iPhone à jour, Wi-Fi OK
   * Safari disponible (souvent utilisé pour télécharger le profil)
2. **Accès au lien / QR**

   * Scanner un **QR code** fourni par la console MDM *ou* ouvrir une URL d’enrôlement
3. **Authentification**

   * S’identifier avec un compte de test (ou code d’inscription)
4. **Installation du profil**

   * iOS télécharge un **profil**
   * Aller dans : **Réglages** → **Général** → **VPN et gestion de l’appareil** (ou “Profils”)
   * **Installer** le profil et **faire confiance**
5. **Fin d’enrôlement**

   * L’appareil apparaît dans la console (inventaire)
   * Le MDM pousse des politiques “basiques” (code, restrictions, Wi-Fi, apps)

✅ À vérifier :

* “Appareil géré” (statut dans Réglages)
* Appareil visible dans la console + infos modèle/OS

---

## Android (Galaxy / One UI) — scénario “QR / Android Enterprise”

> 2 modes fréquents :

* **Profil de travail (BYOD)** : gestion **du conteneur pro** seulement
* **Appareil entièrement géré (COPE / Corporate-owned)** : gestion **totale** (plus restrictif)

**A) Profil de travail (souvent le plus réaliste en classe)**

1. Installer l’app/agent MDM depuis le Play Store (si demandé)
2. Ouvrir le lien/QR d’enrôlement
3. Authentifier (compte de test)
4. Accepter la création du **profil de travail**
5. Vérifier l’icône “mallette” (apps du profil pro)

**B) Appareil géré (plus “entreprise”)**

1. Réinitialisation (souvent nécessaire)
2. À l’écran initial, scanner un QR “Enterprise Enrollment”
3. Installation de “Device Policy”
4. Récupération des politiques

✅ À vérifier :

* Profil de travail actif (apps avec badge “mallette”) ou statut “appareil géré”
* Appareil visible dans console

---

# 3) Limitations (contexte scolaire / environnement démo) — au moins 2

Voici **4 limitations** typiques (tu peux en garder 2–3 selon ton livre) ⚠️ :

1. **Pas de vrai domaine / pas d’intégration complète**

   * En démo, pas de lien réel avec le domaine CSS (pas d’Azure AD/Google Workspace prod).
   * Donc : **pas d’assignation automatique** basée sur de “vraies” unités/identités.

2. **Fonctionnalités restreintes par l’environnement**

   * Certaines actions (effacement, verrouillage complet, supervision iOS, Android fully managed) peuvent être **bloquées** ou **non testables**.

3. **Pas de données sensibles / pas de conformité réelle**

   * On ne peut pas tester des politiques “prod” (DLP, accès conditionnel, certificats internes) sans exposer des secrets.
   * Donc : tests limités à des politiques génériques.

4. **Matériel de test / droits limités**

   * Appareils prêtés, pas réinitialisables librement.
   * Permissions administrateur limitées en classe → pas d’enrôlement “zéro-touch”/ABM/DEP.

---

# 4) Procédure d’enrôlement “version élève” (fidèle + compatible limites)

## A) Procédure  — iPhone (iOS) 📱

**But :** enrôler un iPhone de test dans le MDM de démonstration (sans données sensibles).

### Étapes

1. **Connexion**

   * Activer Wi-Fi sur l’iPhone (réseau de classe)
2. **Démarrer l’enrôlement**

   * Scanner le **QR code** fourni par l’enseignant *ou* ouvrir le lien d’enrôlement
3. **S’identifier**

   * Entrer les identifiants **de test** (fourni en classe)
4. **Installer le profil**

   * Quand iOS télécharge le profil :

     * Réglages → Général → **VPN et gestion de l’appareil**
     * Installer le profil → Confirmer
5. **Vérifier**

   * Ouvrir “VPN et gestion de l’appareil” : profil présent
   * L’enseignant vérifie dans la console que l’appareil est visible

### Validation attendue

* Appareil listé dans la console MDM
* Profil installé côté iOS

---

## B) Procédure  — Samsung (Android) 🤖

**But :** enrôler un appareil Android en mode **profil de travail** (réaliste en classe).

### Étapes

1. **Connexion**

   * Activer Wi-Fi (réseau de classe)
2. **Démarrer l’enrôlement**

   * Scanner QR MDM ou ouvrir le lien
3. **S’identifier**

   * Compte de test / code d’inscription
4. **Accepter le profil de travail**

   * Autoriser la création du profil pro
5. **Vérifier**

   * Apps “pro” avec badge **mallette**
   * Appareil visible dans console

### Validation attendue

* Profil de travail actif
* Appareil listé dans la console MDM










