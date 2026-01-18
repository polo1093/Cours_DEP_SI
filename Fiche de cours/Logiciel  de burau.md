# 📚 Fiche de cours — Outlook (Devoir 1) : notions clés & erreurs à éviter

## 🧱 1) Outlook = 4 modules (à ne pas mélanger)

* ✉️ **Courrier** : messages, modèles, pièces jointes, catégories, règles, archivage, export PST
* 👥 **Contacts** : fiches contact, **groupes de contacts** (listes), vCard
* 📅 **Calendrier** : rendez-vous vs réunion, périodicité, rappels, fuseaux, partage
* ✅ **Tâches** : tâches simples vs récurrentes, priorité, clôture, suppression

---

## 🖊️ 2) Signatures : qualité pro + stabilité de mise en page

### ✅ Principe

* Une signature Outlook = un bloc HTML → **très sensible** aux copier-coller hasardeux.
* Pour une signature “corporate” (logo, alignements), **Word** est ton “éditeur” le plus fiable.

### ⚙️ Méthode robuste (logo + alignement)

* 📄 Dans Word : créer un **tableau 2 colonnes** (logo / texte), puis **retirer les bordures**
* 🧩 Mettre en forme (police, tailles, gras/italique, couleurs) **dans Word**
* 📋 Copier-coller dans l’éditeur de signature Outlook

### 🧨 Pièges

* ⚠️ Logo qui se décale → collage direct depuis internet / image “glissée” au mauvais endroit
* ⚠️ Police non respectée → des portions restent en “police par défaut”
* ⚠️ Oublier de définir la bonne signature **par défaut** (nouveau message)

---

## 👥 3) Contacts & groupes : logique et impacts

### 👤 Contact

* Un contact = une fiche structurée (nom, rôle, email, tel, adresse, notes, champs divers)
* 💬 “Messagerie instantanée” = champ distinct (souvent oublié car non visible en résumé)

### 👪 Groupe de contacts

* Un groupe = **une liste** d’entrées (contacts / adresses)
* Mettre à jour = **ajouter/supprimer** un membre → pas besoin de recréer le groupe

### 🧨 Pièges

* ⚠️ Confondre “groupe” et “catégorie” (catégorie = étiquette de tri, pas une liste)
* ⚠️ Modifier le contact sans que le groupe reflète ce que tu crois → le groupe peut contenir une adresse “brute” au lieu d’un contact
* ⚠️ Oublier le champ *note* : c’est un attendu “qualité dossier”

---

## 🧾 4) Modèles Outlook (.oft) : standard de réutilisation

### ✅ Principe

* Un **modèle** = un message préconfiguré (objet, texte, mise en forme, blocs)
* Il sert à standardiser un envoi **sans ressaisir** à chaque fois

### ⚙️ Bon réflexe

* Avant d’enregistrer un modèle : enlever tout ce qui ne doit pas être “figé” (signature, destinataires réels si fictifs, date dynamique si demandé)

### 🧨 Pièges

* ⚠️ Enregistrer au mauvais format (pas `.oft`)
* ⚠️ Enregistrer au mauvais emplacement (tu dois retrouver le fichier facilement)
* ⚠️ Laisser la signature dans le modèle → tu te retrouves avec doublons et incohérences

---

## 📇 5) vCard : échange structuré de contacts

### ✅ Principe

* Une **vCard** = “carte d’identité” d’un contact (standard) jointe à un courriel
* C’est plus propre qu’un copier-coller d’infos dans le texte

### 🧨 Pièges

* ⚠️ Joindre le mauvais format (fichier quelconque au lieu de carte de visite)
* ⚠️ Envoyer trop/ pas assez de contacts (vérifier la sélection)

---

## 📅 6) Calendrier : rendez-vous vs réunion + récurrence

### 🗓️ Rendez-vous vs réunion

* **Rendez-vous** : événement “perso” (pas de participants)
* **Réunion** : événement avec **invités** → génère des invitations / réponses

### 🔁 Récurrence (mensuelle “3e vendredi”)

* La récurrence se règle dans une fenêtre dédiée : tu choisis **Mensuel** + **3e vendredi**
* Ensuite seulement : tu règles l’heure, durée, salle, etc.

### ⏰ Rappels

* Rappel sur événement récurrent = s’applique à la série (selon réglage)

### 🧨 Pièges

* ⚠️ “Tous les vendredis” ≠ “3e vendredi du mois”
* ⚠️ Mettre un rendez-vous alors qu’il fallait une réunion (ou inversement)
* ⚠️ Oublier le rappel ou le mettre sur un seul occurrence

---

## ✅ 7) Tâches : récurrence, priorité, cycle de vie

### ✅ Cycle “propre”

* Créer → (option priorité) → exécuter → **marquer terminée** → supprimer si demandé → vider supprimés si exigé

### 🔁 Tâche récurrente

* Attention : récurrence = série (hebdo, mensuel, etc.), pas “dupliquer à la main”

### 🧨 Pièges

* ⚠️ Marquer terminée au mauvais endroit (ça dépend de l’affichage, mais l’état doit être visible)
* ⚠️ Confondre “supprimé” et “terminé” (ce n’est pas pareil)
* ⚠️ Ne pas vider Éléments supprimés quand c’est demandé

---

## 📨 8) Courriels : CC / CCI + catégories + importance

### 👁️ CC vs CCI (BCC)

* **CC** : visible par tous les destinataires
* **CCI** : invisible pour les autres (pilotage interne / traçabilité discrète)

### 🏷️ Catégories

* Catégorie = **tag** (tri/filtre), renommer une catégorie = normaliser le workflow (ex. “Urgences”)

### 🔺 Importance

* Importance haute = signal, **pas une catégorie** (ne sert pas au même usage)

### 🧨 Pièges

* ⚠️ Mettre le supérieur en CC au lieu de CCI (erreur de confidentialité)
* ⚠️ Catégorie non appliquée au bon message (transféré vs original)
* ⚠️ Confondre “importance haute” et “priorité haute” (priorité = tâches)

---

## 🗄️ 9) Archivage & export : hygiène + sauvegarde

### 🧹 Archivage automatique

* Peut déplacer ou **supprimer définitivement** selon paramétrage
* Toujours vérifier : dossier ciblé + seuil (ex. “+ de 3 mois”)

### 💾 Export PST

* PST = conteneur Outlook (boîte + sous-dossiers) → sauvegarde / migration / restauration
* Restauration : importer PST ou ouvrir fichier de données Outlook

### 🧨 Pièges

* ⚠️ Export sans sous-dossiers (sauvegarde incomplète)
* ⚠️ Archivage mal ciblé (mauvais dossier)
* ⚠️ Confondre archivage vs suppression : c’est du paramétrage, pas “vider la corbeille”

---

## 🧠 10) Règles : automatisation de classement

### ✅ Principe

* Une règle = **condition** (ex. “objet contient…”) + **action** (déplacer vers dossier)
* Objectif : réduire le tri manuel et standardiser le rangement

### 🧨 Pièges

* ⚠️ Condition trop large → tu classes trop de mails au mauvais endroit
* ⚠️ Dossier de destination mal choisi
* ⚠️ Règle créée mais non activée / non appliquée

