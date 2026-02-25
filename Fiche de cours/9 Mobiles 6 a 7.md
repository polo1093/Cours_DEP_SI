---

# 🧩 Cas 7 — Procédure Miradore (Enrôlement + Profil + Retrait)

## 1) 📲 Enrôler / “Link” un appareil (depuis l’appareil)

### 1.1 Ouvrir les paramètres

* Sur l’appareil : **Paramètres** → accéder aux options nécessaires avant l’enrôlement (Wi-Fi, sécurité, etc.).

<img src="https://github.com/user-attachments/assets/20a10462-f89b-4934-8ce9-facca44d5c1a" width="320" />

---

### 1.2 Réinitialiser l’appareil

* Aller dans **Réinitialiser** (selon l’OS : Réglages → Général → Réinitialiser).

<img src="https://github.com/user-attachments/assets/7ec4e8f7-728e-4196-b69e-3e3787c69dde" width="320" />

---

### 1.3 Réinitialisation d’usine

* Lancer une **réinitialisation d’usine** pour repartir d’un état propre (recommandé en contexte de démonstration/MDM).

<img src="https://github.com/user-attachments/assets/35be02f9-afe4-44a0-9650-1dcbc99021cb" width="320" />

---

### 1.4 Se connecter (réseau / compte)

* Reconnecter l’appareil (Wi-Fi / compte) pour poursuivre l’enrôlement.

<img src="https://github.com/user-attachments/assets/557d2937-d1ce-48d2-8421-7f80d45d502e" width="320" />

---

### 1.5 Scanner (QR / lien d’enrôlement)

* Ouvrir l’app ou la caméra et **scanner le QR code** fourni par Miradore pour enrôler l’appareil.

<img src="https://github.com/user-attachments/assets/ddec8d96-b181-4bf2-9e18-61aaae47564a" width="320" />

✅ **Résultat attendu :** l’appareil apparaît dans Miradore avec un statut **Enrolled/Managed**.

---

## 2) 🧱 Créer un *Configuration Profile* (politique MDM) dans Miradore

### 2.1 Accéder à la création de profil

* Dans Miradore : **Management → Configuration profiles**
* Cliquer sur **Add** (ou équivalent) pour créer un profil.

<img src="https://github.com/user-attachments/assets/f79c7874-8d54-4c15-8175-d619b57b8912" width="320" />

📌 **Contenu recommandé pour une politique “minimale élève” :**

* **Passcode obligatoire** (code de verrouillage)
* **Wi-Fi** : ajout d’un SSID de test (école)
* **Restrictions** : limiter installation d’apps non approuvées (si dispo)
* **Sécurité** : chiffrement/localisation si la plateforme le permet

---

## 3) 🧹 Retirer l’enrôlement (Unenroll) depuis Miradore

### 3.1 Ouvrir l’appareil dans la console

* Dans Miradore : **Devices** → sélectionner l’appareil concerné.

<img src="https://github.com/user-attachments/assets/a4c5660c-2986-4702-99a2-c3978ff26749" width="320" />

---

### 3.2 Lancer “Retirer l’enrôlement”

* Utiliser l’action **Retirer l’enrôlement** (Unenroll) pour supprimer la gestion MDM sur l’appareil.

<img src="https://github.com/user-attachments/assets/4bb34817-e994-482f-b64b-f8f5cce5e319" width="320" />


Si tu veux, je peux aussi te formatter la **fiche “Direction”** (vulgarisée) dans le même style Markdown, avec “✅ Permet / ⚠️ Limites”.
