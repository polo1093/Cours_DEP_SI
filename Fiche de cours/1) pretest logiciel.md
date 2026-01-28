

# 🧩 BONUS — Prétest Logitell (Word / Excel / Visio)




## 🟨 EXCEL — Formats de nombres “au cordeau” (ce qui fait perdre des points)

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>⌨️ <b>Ctrl + 1</b> → Format de cellule</li>
        <li>🔢 <b>Séparateur de milliers</b> : 0 décimale</li>
        <li>💲 <b>Comptabilité</b> : 2 décimales (ou 0 selon consigne), symbole $ si demandé</li>
        <li>📌 Astuce : applique sur la <b>plage exacte</b> (éviter “tout sélectionner”)</li>
      </ul>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="Format nombre / comptabilité" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

## 🟨 EXCEL — Déplacer une colonne + bordures spécifiques

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>↔️ <b>Déplacer une colonne</b> (ex : “Autres frais de transport”)</li>
        <li>1) Sélectionner la colonne (lettre en haut)</li>
        <li>2) <b>Ctrl + X</b> (Couper)</li>
        <li>3) Clic droit sur la colonne cible → <b>Insérer les cellules coupées</b></li>
      </ul>
      <hr/>
      <ul>
        <li>🧱 <b>Bordure inférieure simple</b> / <b>double</b></li>
        <li>📍 Accueil → Bordures ▼ → <b>Autres bordures…</b></li>
        <li>Choisir <b>Style</b> (simple/double) → appliquer <b>Bas</b></li>
      </ul>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="Déplacer colonne + bordures" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

## 🟨 EXCEL — Impression : 2 versions (mise à l’échelle + sauts de page + titres)

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>🗂️ <b>Version 1 : Frais-4-semaines</b></li>
        <li>📍 Mise en page → <b>Mise à l’échelle</b> : viser <b>les 4 tableaux complets</b> sur la page</li>
        <li>✅ Contrôle final : Fichier → Imprimer (aperçu)</li>
      </ul>
      <hr/>
      <ul>
        <li>🗂️ <b>Version 2 : Frais-2-semaines</b></li>
        <li>📍 Mise en page → <b>Orientation : Paysage</b></li>
        <li>📍 Mise en page → Mise à l’échelle : <b>Toutes les colonnes sur une page</b></li>
        <li>📍 Affichage → <b>Aperçu des sauts de page</b> → ajuster pour : S1+S2 page 1 / S3+S4 page 2</li>
      </ul>
      <hr/>
      <ul>
        <li>📌 <b>Répéter les lignes 4 et 5 en haut</b> (titres)</li>
        <li>📍 Mise en page → <b>Imprimer les titres</b></li>
        <li>Zone “Lignes à répéter en haut” : <code>$4:$5</code></li>
      </ul>
      <hr/>
      <ul>
        <li>🧾 <b>Numéro de page dans l’entête (droite)</b></li>
        <li>📍 Insertion → En-tête et pied de page → section droite → <b>Numéro de page</b></li>
      </ul>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="Impression: mise à l’échelle + sauts de page + titres" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

## 🟨 EXCEL — Protection feuille (mot de passe) + masquage “Plus élevé”

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>🙈 <b>Masquer une ligne</b> (ex : “Plus élevé”)</li>
        <li>Clic droit sur le numéro de ligne → <b>Masquer</b></li>
      </ul>
      <hr/>
      <ul>
        <li>🔐 <b>Protéger la feuille</b> (à refaire sur les 2 versions)</li>
        <li>📍 Révision → <b>Protéger la feuille</b></li>
        <li>Mot de passe : <code>rdvs</code></li>
      </ul>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="Protection feuille rdvs" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

## 🟨 EXCEL — RH : SI / OU + AUJOURDHUI + SOMME.SI / MOYENNE.SI

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>📅 <b>Date du jour</b> (cellule B3 dans l’énoncé)</li>
        <li><code>=AUJOURDHUI()</code></li>
      </ul>
      <hr/>
      <ul>
        <li>📈 <b>% augmentation</b> (Excellent / Très bien = 6%, sinon 3%)</li>
        <li><code>=SI(OU(CellulePerf="Excellent";CellulePerf="Très bien");0,06;0,03)</code></li>
      </ul>
      <hr/>
      <ul>
        <li>💰 <b>Salaire projeté</b></li>
        <li><code>=SalaireActuel*(1+PourcentageAugmentation)</code></li>
      </ul>
      <hr/>
      <ul>
        <li>🏖️ <b>Jours de vacances</b> (≥3 ans → 20, sinon 10)</li>
        <li><code>=SI(Anciennete>=3;20;10)</code></li>
      </ul>
      <hr/>
      <ul>
        <li>📊 <b>Moyenne / Somme par service</b></li>
        <li>Moyenne : <code>=MOYENNE.SI(plage_service;service;plage_salaire)</code></li>
        <li>Somme : <code>=SOMME.SI(plage_service;service;plage_salaire)</code></li>
        <li>🎯 Formules “copiables” : verrouiller les plages avec <code>$</code></li>
      </ul>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="SI/OU + SOMME.SI/MOYENNE.SI" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

## 🟨 EXCEL — Graphiques (barres + secteur) : réglages demandés

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>📊 <b>Barres groupées</b> : moyenne salaires actuels vs projetés par service</li>
        <li>✅ Axe horizontal : format de nombre <b>Général</b></li>
        <li>✅ <b>Étiquettes de données</b> : série “Salaire projeté” → <b>bords extérieurs</b></li>
      </ul>
      <hr/>
      <ul>
        <li>🥧 <b>Secteur</b> : répartition <b>somme</b> salaires projetés</li>
        <li>✅ Légende à <b>droite</b></li>
        <li>✅ Étiquettes : <b>bords extérieurs</b></li>
        <li>✅ “Plus gros secteur” : <b>légèrement excentré</b> (Explosion)</li>
      </ul>
      <p>📍 Placement : à droite des tableaux (colonnes O/P/Q dans l’énoncé).</p>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="Graphiques barres + secteur" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

## 🟦 WORD — Mise en page multi-sections (page 3 = pièce jointe)

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>🧱 <b>Objectif</b> : page 3 (pièce jointe) avec règles différentes</li>
        <li>✅ Utiliser des <b>Sauts de section</b> (pas juste saut de page)</li>
      </ul>
      <hr/>
      <ul>
        <li>1) Place-toi à la fin de la page 2</li>
        <li>2) <b>Mise en page</b> → <b>Sauts</b> → <b>Saut de section : Page suivante</b></li>
        <li>3) Sur la page 3 : En-tête/Pied de page → désactiver <b>Lier au précédent</b></li>
        <li>4) Supprimer le contenu en-tête/pied sur la page 3</li>
        <li>5) Régler distances : en-tête <b>1,25 cm</b> / pied <b>1,25 cm</b></li>
      </ul>
      <hr/>
      <ul>
        <li>📄 Page 3 seulement : <b>Paysage</b> + <b>Marges Étroit</b></li>
        <li>➡️ Mise en page → Orientation / Marges (section courante)</li>
      </ul>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="Saut de section + en-tête/pied indépendants" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

## 🟦 WORD — Traduire une sélection + synonymes (examen)

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>🌍 <b>Traduire une phrase (anglais → français)</b></li>
        <li>📍 Révision → <b>Traduire</b> → <b>Traduire la sélection</b></li>
        <li>✅ Relire et corriger (Word propose parfois du “littéral”)</li>
      </ul>
      <hr/>
      <ul>
        <li>🧠 <b>Synonymes</b> (réduire répétitions : “stratégie”)</li>
        <li>Clic droit sur le mot → <b>Synonymes</b></li>
        <li>⚠️ Si synonyme change le genre : gérer les <b>accords</b> autour</li>
      </ul>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="Traduire + synonymes" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

## 🟦 WORD — Notes de fin (A, B) + restriction totale (mot de passe)

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>📝 <b>Notes de fin</b> (format A, B)</li>
        <li>📍 Références → lanceur “Notes de bas de page” → choisir <b>Notes de fin</b></li>
        <li>Format de nombre : <b>A, B, C…</b></li>
        <li>Insérer après le texte demandé (ordre du jour / pièce jointe)</li>
      </ul>
      <hr/>
      <ul>
        <li>🛡️ <b>Restriction totale (aucune modification)</b></li>
        <li>📍 Révision → <b>Restreindre la modification</b></li>
        <li>✅ Autoriser : <b>Aucune modification (Lecture seule)</b></li>
        <li>🔐 Oui, activer la protection → mot de passe : <code>1ab2</code></li>
      </ul>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="Notes de fin + restriction 1ab2" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

## 🟦 VISIO — Logigramme “ordinateur ne répond plus” (couleurs + losanges)

<table>
  <tr>
    <td valign="top" width="42%">
      <ul>
        <li>📍 Modèle : <b>Logigramme</b> / <b>Basic Flowchart</b></li>
        <li>🔶 <b>Tous les losanges</b> : même texte + couleur <b>gris</b></li>
        <li>🟡 Départ : jaune</li>
        <li>🟢 Problème résolu : vert</li>
        <li>🔴 Contacter le SI : rouge</li>
      </ul>
      <hr/>
      <ul>
        <li>📄 Contrainte : <b>1 page</b> format <b>Lettre US</b> + export PDF</li>
        <li>✅ Vérif : Fichier → Imprimer (aperçu = 1 page)</li>
      </ul>
      <p>📌 (Align/Distribute + Snap : déjà couvert dans ta fiche.)</p>
    </td>
    <td valign="top" width="58%" align="right">
      <!-- <img src="URL" alt="Visio logigramme couleurs" width="900"/> -->
    </td>
  </tr>
</table>

<hr/>

---

Si tu veux que ce soit **encore plus “examen-ready”**, colle-moi juste :

* **les 2–3 captures** de l’onglet **Mise en page (Excel)** que ton prof utilise (mise à l’échelle / sauts / titres),
* et **une capture** de **Restriction Word** (écran exact chez toi).

Je te remets les blocs avec les **bons libellés** correspondant à ton interface (FR/EN, Win10/Win11, 365 école).
