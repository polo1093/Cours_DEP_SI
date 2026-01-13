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