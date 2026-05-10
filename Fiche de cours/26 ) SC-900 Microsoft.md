# SC-900 — Défense en profondeur

## Idée principale

La défense en profondeur consiste à protéger un système avec plusieurs couches de sécurité.

Objectif : si une couche échoue, une autre couche bloque ou ralentit l’attaque.

## Couches principales

- Sécurité physique : accès aux bâtiments, serveurs, matériel.
- Identité et accès : MFA, RBAC, accès conditionnel.
- Périmètre : pare-feu, protection DDoS.
- Réseau : segmentation, règles de trafic, NSG.
- Calcul : VM, serveurs, correctifs, ports fermés.
- Applications : code sécurisé, validation des entrées, authentification.
- Données : chiffrement, classification, droits d’accès.
<img width="1100" height="580" alt="image" src="https://github.com/user-attachments/assets/055dbc42-9fca-4086-90ea-41bf99c7a1a4" />

## À retenir

La donnée est la couche la plus critique.
Même si un attaquant passe une barrière, il doit encore franchir les autres.

# Triade CIA

## Confidentialité

Seules les personnes autorisées peuvent accéder aux données.

Exemples :
- chiffrement
- droits d’accès
- MFA

## Intégrité

Les données doivent rester exactes et non modifiées sans autorisation.

Exemples :
- hachage
- signature numérique
- journaux d’audit

## Disponibilité

Les systèmes doivent rester accessibles aux utilisateurs autorisés.

Exemples :
- sauvegardes
- redondance
- protection DDoS
- plan de reprise

## Phrase examen

La défense en profondeur protège par couches.
La triade CIA protège la confidentialité, l’intégrité et la disponibilité.
