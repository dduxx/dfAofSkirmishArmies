# dfAofSkirmishArmies

3D-printable miniatures for *Age of Fantasy Skirmish* armies, built from Dwarf Fortress
pixel-art using the dfCharacterBuilder and twoPointFiveD libraries.

## Overview

This project merges Dwarf Fortress's pixel-art character sprites with the unit rosters from
One Page Rules' *Age of Fantasy Skirmish* game. Each unit is generated as a 2.5D model, a
pixel grid extruded to different heights per color, so it can be 3D printed as a miniature. In
situations where Dwarf Fortress related sprites do not exist, a similiar equivalent of my own is
added (ie Banners). Some units are created by kitbashing different sprites to make one combined
model.

Currently **Kingdom of Angels** and **Saurians** are the supported armies but I intend to add more
armies in the future.

## Prerequisites

- Git
- [OpenSCAD](https://openscad.org/) nightly (>= 2026.07.26)
- [buildscad](https://github.com/dduxx/buildscad)

## Dependencies

This project has a dependency on [dfCharacterBuilder](https://github.com/dduxx/dfCharacterBuilder).

## Installation

```bash
git clone https://github.com/dduxx/dfAofSkirmishArmies.git
cd dfAofSkirmishArmies

# Fetch dependencies (dfCharacterBuilder + twoPointFiveD)
buildscad pull
```

## Unit Roster

All units are exported on build, simply navigate to the produced artifacts in the build folder after
running `buildscad build`

Alternatively open any unit file in OpenSCAD and use the **Customizer** pane to select its options,
then render and export to STL.

### Heroes

| Unit | Customizer options |
|------|--------------------|
| High Angel | `WEAPON_LOADOUT`: default / heavy_ice_halberd / great_weapon / heavy_flame_spear / heavy_hand_weapon_and_bow |
| Champion | `WEAPON_LOADOUT`: default / blessed_greatsword / heavy_halberd / dual_heavy_hand_weapons / heavy_lance / heavy_spear · `HAS_CROSSBOW` · `MOUNT`: none / horse / lion |
| Abbess | `WEAPON_LOADOUT`: default / heavy_flail / heavy_halberd · `HAS_BOW` · `MOUNT`: none / leopard |

### Troops

| Unit | Customizer options |
|------|--------------------|
| Marksmen | `VARIANT`: 1–3 |
| Panther | — |
| Penitents | `VARIANT`: 1–3 · `UPGRADE`: none / banner / musician / sergeant |
| Infantry | `VARIANT`: 1–3 · `WEAPON_LOADOUT`: default / halberd / spear · `UPGRADE`: none / banner / musician / sergeant |
| Battle Nuns | `VARIANT`: 1–3 · `UPGRADE`: none / banner / musician / sergeant |
| Paladin | `WEAPON_LOADOUT`: default / blessed_greatsword · `UPGRADE`: none / banner / musician / sergeant |
| Panther Rider | `WEAPON_LOADOUT`: default / heavy_glaive / halberd · `UPGRADE`: none / banner / musician / sergeant |
| Paladin Knight | `WEAPON_LOADOUT`: default / great_weapon / blessed_greatsword · `UPGRADE`: none / banner / musician / sergeant |
| Palace Guard | `WEAPON_LOADOUT`: default / heavy_halberd / great_weapon |
| Battle Angel | `WEAPON_LOADOUT`: default / great_weapon / bow_and_heavy_hand_weapon · `UPGRADE`: none / banner / musician / sergeant |
| Burning Angel | `WEAPON_LOADOUT`: default / flame_spear · `UPGRADE`: none / banner / musician / sergeant |
| Frozen Angel | `WEAPON_LOADOUT`: default / ice_blade · `UPGRADE`: none / banner / musician / sergeant |
| Scout Nun | — |

### Saurians

#### Heroes

| Unit | Customizer options |
|------|--------------------|
| Frog Mage | — |
| Gator Vetran | `WEAPON_LOADOUT`: default / great_weapon |
| Gecko Champion | `WEAPON_LOADOUT`: default / dual_hand_weapons / lance · `ADDITIONAL_WEAPON`: none / champion_fire_bolas / champion_javelin / champion_blowpipe · `MOUNT`: none / deinonychus / pterodactyl / ripjawdactyl |
| Saurian Vetran | `WEAPON_LOADOUT`: default / obsidian_great_weapon / heavy_halberd / great_weapon / dual_heavy_hand_weapons / heavy_lance / heavy_spear · `MOUNT`: none / raptor |

#### Troops

| Unit | Customizer options |
|------|--------------------|
| Chameleon | `WEAPON_LOADOUT`: default / blowpipe |
| Deinonychus Rider | `WEAPON_LOADOUT`: default / javelin · `UPGRADE`: none / sergeant / musician / banner |
| Gator | `WEAPON_LOADOUT`: default / great_weapon |
| Geckos | `ADDITIONAL_WEAPON_UPGRADE`: none / javelin / blowpipe · `UPGRADE`: none / sergeant / musician / banner · `VARIANT`: 1–3 |
| Pterodactyl Rider | `WEAPON_LOADOUT`: default / javelin / fire_bolas · `UPGRADE`: none / sergeant / musician / banner |
| Raptor Rider | `WEAPON_LOADOUT`: default / lance · `UPGRADE`: none / sergeant / musician / banner |
| Ripjawdactyl Rider | `WEAPON_LOADOUT`: default / javelin / fire_bolas · `UPGRADE`: none / sergeant / musician / banner |
| Saurian Guardian | `WEAPON_LOADOUT`: default / halberd / great_weapon · `UPGRADE`: none / sergeant / musician / banner |
| Saurian Warriors | `WEAPON_LOADOUT`: default / halberd / spear · `UPGRADE`: none / sergeant / musician / banner · `VARIANT`: 1–3 |
| Snake Swarm | — |
| Vulturedactyl | — |

## Project Structure

```
aofArmies/
├── buildscad.properties   # Project config + assembly list
├── deps.json             # Dependencies (dfCharacterBuilder, twoPointFiveD)
├── scad/
│   ├── kingdom_of_angels/
│   │   ├── heroes/       # High Angel, Champion, Abbess
│   │   └── troops/       # Infantry, angels, cavalry, nuns, and more
│   └── saurians/
│       ├── heroes/       # Frog Mage, Gator Vetran, Gecko Champion, Saurian Vetran
│       └── troops/       # Chameleon, Deinonychus Rider, Gator, Geckos, Pterodactyl Rider, Raptor Rider, Ripjawdactyl Rider, Saurian Guardian, Saurian Warriors, Snake Swarm, Vulturedactyl
└── fixtures/
    └── custom_wieldables/ # Army-specific extras (banners)
```
