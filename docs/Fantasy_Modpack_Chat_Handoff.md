# Fantasy modpack handoff: Absolute Nonsense XXXL — Wild Realms

Prepared 29 October 2026. This document is self-contained: the receiving chat does not need access to the original conversation or other local files.

## What I want

Build on the mod collection below to design an extravagant Minecraft Java fantasy/adventure/RPG modpack. My attitude is **“the more/crazier content, the merrier.”** I repeatedly asked for a much larger selection and a sweep of popular mods for anything unusual, extravagant or fantasy-RPG-like.

- **Prioritize dragons and mounts:** tameable, rideable creatures; raising them; distinctive individuals and variants.
- **Prioritize crazy mobs and collecting:** strange wildlife, mythical monsters, bosses, pets, rare creatures and collectible equipment.
- **Prioritize farmable things with variations:** breeding, genetics, different appearances, creature collections and things worth raising or farming over time.
- **Make the world feel alive:** NPCs, companions, settlements, interesting structures, ruins, dungeons and reasons to explore.
- **Go big on fantasy:** dimensions, magic, supernatural powers, cool ores, powerful weapons, armor, artifacts and treasure.
- **Allow absurd crossovers:** Disney-style collaborations, anime/pop-culture nonsense and Crazy Craft-style excess are welcome. This is a taste preference, not a claim that any particular franchise mod exists for our target version.
- **Avoid an engineering-centered pack:** I am tired of factory-heavy packs. Technology should not be the central progression or a gate to the fantasy content. An optional dinosaur-revival or weaponcraft activity can be considered separately.
- **Do not shrink the vision into a minimal vanilla-plus pack.** Keep worthwhile additions and distinguish optional systems honestly instead of silently removing them.

## Decisions and authorization so far

- The working target is **Minecraft Java 1.20.1, Forge 47.x, Java 17 (64-bit)**. This is the existing design choice, not a user demand to stay on this version at any cost.
- I originally wanted Dragons of Berk, collectible Hats (hats found on mobs), and Morph (unlock a mob form by killing it).
- I explicitly said **Hats and Morph can be dropped if that opens more options**. Do not constrain the whole pack to old Minecraft just to retain those originals.
- I asked to investigate the Berk successor. The prior research distinguishes **Isle of Berk**, **Dragons of Berk**, and **Book of Dragons / New Berk's Dawn**. Preserve those distinctions; the detailed findings and source links are below.
- The assistant proposed **Book of Dragons as a preferred flagship**, with **Dragons of Berk as an alternative**. That is a recommendation, not my final choice. Do not assume I approved combining them or that they share genetics/taming data.
- When asked whether “load the pack” meant install/launch or expand the list, I answered **“Expand the list and TXT file only.”** No installation, downloading of mod jars, launcher changes or launch testing has been requested since.
- This handoff request is to create a Markdown file containing my wishes and everything collected. Continue according to my next instruction; the document itself is not an instruction to install anything.
- I also asked whether updating Dragons of Berk, Morph and Hats through AI-assisted “vibe coding” is possible, explicitly saying **not to do it**. Treat that as a conceptual question only, not authorization to port or rewrite mods.

## Current result and how to use it

The latest catalogue contains **198 numbered content selections**, **20 utilities**, **5 performance/diagnostic tools**, and **3 atmosphere mods**: **226 named non-library selections**. The 198 includes addons, building content, optional choices and alternatives; it is not a count of 198 mutually compatible content jars.

The sequence is original 101 content entries, a 70-entry expansion, then a 27-entry popular-mod sweep. All are reproduced below, together with dependency notes, source links, configuration ideas and version receipts. The previous 101-entry TXT is superseded and is already represented in this catalogue.

**Important status:** this is a researched proposal, not a version-locked, installed or launch-tested modpack. Some project/file availability was checked in the prior chat. Those observations are historical research notes, not fresh verification by this handoff. Exact dependency ranges, transitive dependencies and full-pack compatibility remain unresolved. Recheck official release pages before selecting actual files.

### Integration questions to preserve

- Resolve exact Forge 1.20.1 files and dependencies; never substitute another loader or Minecraft version just because its file is newest.
- Choose or test the dragon alternatives carefully. Avoid conflating the discontinued original with modern ports or successors.
- Major combat, damage, identity and progression systems need deliberate integration. Mine and Slash is an alternative configuration candidate; Origins, Dragon Survival, Vampirism and Werewolves should not be assumed to stack seamlessly.
- ProjectE can trivialize rare collections. Infernal Mobs and other scaling systems can compound Apotheosis. Mark and configure these as optional rather than describing the whole catalogue as ready to enable.
- Preserve mount, breeding, sanctuary, farming and collection loops when tuning loot and progression.
- Tune structure density, creature spawning and NPC safety so the world remains enjoyable to inhabit.
- The sanctuary, tavern, greenhouse and settlement-centered gameplay loop below is the assistant's proposed way to satisfy my preferences, not an additional requirement I explicitly imposed.
- Do not inflate counts with libraries, duplicate versions or both sides of an alternative without explaining the count.

## Complete current catalogue and design notes

The following is a Markdown conversion of the complete latest TXT, retaining its mod names, descriptions, qualifications and URLs. References to earlier answers inside this material refer to the original chat.

### ABSOLUTE NONSENSE XXXL: WILD REALMS
#### Minecraft Java Edition modpack design -- 29 October 2026

198 CONTENT CHOICES: ORIGINAL 101 + FIRST EXPANSION 70 + POPULAR-MOD SWEEP 27
20 utilities + 5 performance/diagnostic tools + 3 atmosphere mods.
#### Dependencies are separate. Optional alternatives are included in the 198;
#### this is not a promise that 198 content jars should all run together unchanged.

#### TARGET: Minecraft 1.20.1, Forge 47.x, Java 17 (64-bit).
#### Match each file to BOTH Minecraft 1.20.1 and Forge.
#### This is the requested expanded list and design, NOT an installed, launched,
#### tested or version-locked modpack. No Minecraft installation was changed.
#### Exact dependency ranges and the full combination remain to be tested.
This document supersedes Absolute_Nonsense_XXL_1.20.1.txt.

#### THE EXPERIENCE
#### A fantasy wilderness full of creatures worth capturing, mounts worth raising,
#### towns worth visiting and ruins worth investigating. Build a dragon sanctuary,
#### rare-animal ranch, magical greenhouse and a village around a lively tavern.
#### Set off with companions, collect bizarre weapons and treasures, return with
#### new species, and use that wealth to expand your home.

#### The big magic systems, dimensions, bosses and crossovers from the 101-mod
#### selection stay. This expansion adds inhabitants and collection loops, not
#### an engineering progression. Breeding, exploration and fighting are valid
#### ways to progress; factory chains are never intended to be mandatory.

#### BERK CORRECTION AND SUCCESSOR CHECK
#### I previously conflated the original Isle of Berk with Dragons of Berk.
#### The original Isle of Berk remains discontinued and listed for Forge 1.18.2.
#### That does NOT mean HTTYD is unavailable for this 1.20.1 pack.

1. Dragons of Berk is a modern port with an actual Forge 1.20.1 release:
dragonsofberk-1.20.1-1.2.2.jar, published 26 October 2026.
https://www.curseforge.com/minecraft/mc-mods/dragons-of-berk/files/9335730
The project also lists a confusingly tagged 1.21.1/NeoForge file near
the 1.20.1 files. Select the explicitly named 1.20.1 FORGE jar.

2. The New Berk's Dawn community is now publicly titled
"Book of Dragons: New Berk's Dawn". Its public About text still describes
an earlier planned 1.18 release; that text is not a current file manifest.
https://discord.com/servers/new-berks-dawn-1154425761650974821
I have not verified private Discord announcements or a merger history.

3. Book of Dragons has a real, separate Forge 1.20.1 release:
bookofdragons-1.4-1.20.1.jar, published 27 October 2026.
https://www.curseforge.com/minecraft/mc-mods/book-of-dragons/files/9339901
Its published features include genetics, coat variation, individual
personalities, dragon research, bonding and flight. This is my preferred
flagship for your interest in distinctive creatures and variants.
Do not infer that every promised New Berk's Dawn feature is implemented.

#### Start with Book of Dragons OR Dragons of Berk. Both remain listed as options.
#### Try combining them only after checking duplicate species, hostility, spawning,
#### riding, camera controls and keybinds. They do not automatically share dragons,
#### genetics, breeding, taming progress or saved data.
#### Do not install old 1.18.2 Isle of Berk addons into this 1.20.1 selection.

#### HOW TO READ THE LIST
#### Entries 001-101 retain the original selection; 102-171 are the first expansion.
#### Entries 172-198 are the latest popular-mod sweep, including optional modules.
#### Entries marked OPTIONAL are substantial alternatives or extra modules.
#### Dragon Survival and Mine Piece from the earlier selection are also optional
#### high-impact modules. Published builds for the same Minecraft version do not
#### prove that all systems work together.
#### Descriptions cover each mod's role, not an assurance that every feature from
#### its newest Minecraft branch exists in its 1.20.1 branch.
#### The target includes addons and building content, not just standalone overhauls.



#### CONTENT LIST

#### DRAGONS, MONSTERS AND BOSSES


##### 001. Ice and Fire: Dragons
Rideable dragons, mythical monsters and dragon equipment.
https://www.curseforge.com/minecraft/mc-mods/ice-and-fire-dragons


##### 002. Dragon Mounts: Legacy
Hatch and raise additional dragon mounts.
https://www.curseforge.com/minecraft/mc-mods/dragon-mounts-legacy


##### 003. Dragon Survival
Play as a dragon; test its transformation controls with other mods.
https://www.curseforge.com/minecraft/mc-mods/dragons-survival


##### 004. Alex's Mobs
A huge collection of animals and unusual creatures.
https://www.curseforge.com/minecraft/mc-mods/alexs-mobs


##### 005. Alex's Caves
Prehistoric, toxic, magnetic, deep-sea, horror and candy cave adventures.
https://www.curseforge.com/minecraft/mc-mods/alexs-caves


##### 006. Mowzie's Mobs
Animated enemies and distinctive boss encounters.
https://www.curseforge.com/minecraft/mc-mods/mowzies-mobs


##### 007. L_Ender's Cataclysm
Major dungeon bosses and powerful equipment.
https://www.curseforge.com/minecraft/mc-mods/lendercataclysm


##### 008. Born in Chaos
Strange hostile creatures and dangerous encounters.
https://www.curseforge.com/minecraft/mc-mods/born-in-chaos


##### 009. Mutant Monsters
Giant mutant versions of familiar mobs.
https://www.curseforge.com/minecraft/mc-mods/mutant-monsters


##### 010. Illager Invasion
Additional illager enemies and encounters.
https://www.curseforge.com/minecraft/mc-mods/illager-invasion


##### 011. Savage & Ravage
Expanded illager and creeper-related content.
https://www.curseforge.com/minecraft/mc-mods/savage-and-ravage


##### 012. Rotten Creatures
Special undead enemies.
https://www.curseforge.com/minecraft/mc-mods/rotten-creatures


##### 013. Aquamirae
Ocean horror, frozen-sea exploration and boss content.
https://www.curseforge.com/minecraft/mc-mods/aquamirae


##### 014. The Graveyard
Undead enemies, spooky structures and a boss.
https://www.curseforge.com/minecraft/mc-mods/the-graveyard-forge


##### 015. Bosses of Mass Destruction [Forge]
Additional boss encounters; use this Forge port.
https://www.curseforge.com/minecraft/mc-mods/bosses-of-mass-destruction-forge


##### 016. The Endergetic Expansion
Stranger End ecology and creatures.
https://www.curseforge.com/minecraft/mc-mods/endergetic


##### 017. Ender's Delight
End-themed foods and ingredients.
https://www.curseforge.com/minecraft/mc-mods/enders-delight


##### 018. Friends&Foes
Creatures inspired by unchosen mob-vote ideas.
https://www.curseforge.com/minecraft/mc-mods/friends-and-foes-forge


##### 019. Meet Your Fight
Summon bosses and craft special rewards.
https://www.curseforge.com/minecraft/mc-mods/meet-your-fight


##### 020. The Conjurer
An illager magician boss and theater structure.
https://www.curseforge.com/minecraft/mc-mods/the-conjurer

#### DIMENSIONS AND OTHERWORLDLY ADVENTURES


##### 021. The Twilight Forest
Forest dimension with castles, labyrinths and bosses.
https://www.curseforge.com/minecraft/mc-mods/the-twilight-forest


##### 022. The Aether
Sky islands, new materials and dungeon bosses.
https://www.curseforge.com/minecraft/mc-mods/aether


##### 023. Deep Aether
More Aether exploration, biomes and equipment.
https://www.curseforge.com/minecraft/mc-mods/deep-aether


##### 024. The Aether: Redux
Further expands and reworks Aether content.
https://modrinth.com/mod/the-aether-redux


##### 025. Blue Skies
Two adventure dimensions and dungeon bosses.
https://www.curseforge.com/minecraft/mc-mods/blue-skies


##### 026. The Bumblezone
A gigantic bee-themed dimension.
https://www.curseforge.com/minecraft/mc-mods/the-bumblezone-forge


##### 027. Deeper and Darker
Sculk-themed exploration and the Otherside dimension.
https://www.curseforge.com/minecraft/mc-mods/deeperdarker


##### 028. The Undergarden
An underground dimension with unique life and materials.
https://www.curseforge.com/minecraft/mc-mods/the-undergarden


##### 029. DivineRPG
Fantasy dimensions, monsters, bosses and equipment.
https://www.curseforge.com/minecraft/mc-mods/official-divinerpg


##### 030. Advent of Ascension
Its modern adventure branch; 1.20.1 is beta and differs from legacy AoA.
https://www.curseforge.com/minecraft/mc-mods/advent-of-ascension-nevermine


##### 031. Voidscape
A hostile void dimension and its own materials.
https://www.curseforge.com/minecraft/mc-mods/voidscape


##### 032. The Lost Cities
Ruined city exploration; configure a separate city dimension instead of replacing the primary world.
https://www.curseforge.com/minecraft/mc-mods/the-lost-cities

#### SPELLCASTING, CURSES AND SUPERNATURAL POWERS


##### 033. Iron's Spells 'n Spellbooks
Combat spells, spellbooks, magical equipment and encounters.
https://www.curseforge.com/minecraft/mc-mods/irons-spells-n-spellbooks


##### 034. Ars Nouveau
Build your own spells and collect magical companions.
https://www.curseforge.com/minecraft/mc-mods/ars-nouveau


##### 035. Ars Elemental
Elemental expansion for Ars Nouveau.
https://www.curseforge.com/minecraft/mc-mods/ars-elemental


##### 036. Ars Additions
Additional Ars spells and magical utilities.
https://www.curseforge.com/minecraft/mc-mods/ars-additions


##### 037. Occultism
Summon spirits and perform rituals.
https://www.curseforge.com/minecraft/mc-mods/occultism


##### 038. Hexerei
Witchcraft, herbs, cauldrons and broomsticks.
https://www.curseforge.com/minecraft/mc-mods/hexerei


##### 039. EvilCraft
Dark magic and unusual supernatural tools.
https://www.curseforge.com/minecraft/mc-mods/evilcraft


##### 040. Blood Magic
Rituals, sigils and blood-powered magic.
https://www.curseforge.com/minecraft/mc-mods/blood-magic


##### 041. Malum
Spirit magic, rituals and equipment.
https://www.curseforge.com/minecraft/mc-mods/malum


##### 042. Eidolon: Repraised
Necromancy and occult rituals.
https://www.curseforge.com/minecraft/mc-mods/eidolon-repraised


##### 043. Forbidden and Arcanus
Rare magical materials, artifacts and equipment.
https://www.curseforge.com/minecraft/mc-mods/forbidden-arcanus


##### 044. Mahou Tsukai
Spectacular spells and anime-inspired magical weapons.
https://www.curseforge.com/minecraft/mc-mods/mahou-tsukai


##### 045. Goety
Dark wizardry, summons and hostile magical content.
https://www.curseforge.com/minecraft/mc-mods/goety


##### 046. Vampirism
Become a vampire or hunt them.
https://www.curseforge.com/minecraft/mc-mods/vampirism-become-a-vampire


##### 047. Werewolves
Werewolf transformations; an expansion for Vampirism.
https://www.curseforge.com/minecraft/mc-mods/werewolves-become-a-beast


##### 048. Enigmatic Legacy
Powerful and sometimes cursed artifacts.
https://www.curseforge.com/minecraft/mc-mods/enigmatic-legacy

#### CROSSOVERS, COLLECTIBLES AND NONSENSE


##### 049. Kingdom Keys 2
Kingdom Hearts-inspired keyblades, magic and enemies; fan-made crossover content.
https://www.curseforge.com/minecraft/mc-mods/kingdom-keys-re-coded


##### 050. Touhou Little Maid
Touhou-inspired maid companions and playful extras.
https://www.curseforge.com/minecraft/mc-mods/touhou-little-maid


##### 051. SlashBlade
Stylized katana combat and collectible blades.
https://www.curseforge.com/minecraft/mc-mods/slashblade


##### 052. Mine Piece
One Piece-inspired powers and encounters; high-impact experimental module.
https://www.curseforge.com/minecraft/mc-mods/mine-piece


##### 053. Inventory Pets
Collect inventory creatures with special powers.
https://www.curseforge.com/minecraft/mc-mods/inventory-pets


##### 054. Chance Cubes
Random rewards, traps and disasters.
https://www.curseforge.com/minecraft/mc-mods/chance-cubes


##### 055. Artifacts
Find wearable items with special abilities.
https://www.curseforge.com/minecraft/mc-mods/artifacts


##### 056. Relics
Collect and develop unusual magical relics.
https://www.curseforge.com/minecraft/mc-mods/relics-mod


##### 057. Buddycards
Collectible trading cards and sets.
https://www.curseforge.com/minecraft/mc-mods/buddycards


##### 058. Rats
Cheese, upgradeable rats and ridiculous rat adventures; automation is optional.
https://www.curseforge.com/minecraft/mc-mods/rats

#### DUNGEONS, RUINS AND STRUCTURES


##### 059. When Dungeons Arise
Huge structures, dangerous dungeons and spectacular landmarks.
https://www.curseforge.com/minecraft/mc-mods/when-dungeons-arise


##### 060. When Dungeons Arise: Seven Seas
Large seafaring structures.
https://www.curseforge.com/minecraft/mc-mods/when-dungeons-arise-seven-seas


##### 061. Dungeon Crawl
Large underground dungeon networks.
https://www.curseforge.com/minecraft/mc-mods/dungeon-crawl


##### 062. Repurposed Structures
New variants of familiar structures across biomes.
https://www.curseforge.com/minecraft/mc-mods/repurposed-structures


##### 063. Towns and Towers
More varied settlements and outposts.
https://www.curseforge.com/minecraft/mc-mods/towns-and-towers


##### 064. Valhelsia Structures
Ruins, buildings and exploration landmarks.
https://www.curseforge.com/minecraft/mc-mods/valhelsia-structures


##### 065. ChoiceTheorem's Overhauled Village
Larger and more varied villages.
https://www.curseforge.com/minecraft/mc-mods/choicetheorems-overhauled-village


##### 066. YUNG's Better Dungeons
Reworked dungeon exploration.
https://www.curseforge.com/minecraft/mc-mods/yungs-better-dungeons


##### 067. YUNG's Better Mineshafts
Larger, more varied mineshafts.
https://www.curseforge.com/minecraft/mc-mods/yungs-better-mineshafts-forge


##### 068. YUNG's Better Strongholds
Expansive strongholds.
https://www.curseforge.com/minecraft/mc-mods/yungs-better-strongholds


##### 069. YUNG's Better Desert Temples
Larger desert temples.
https://www.curseforge.com/minecraft/mc-mods/yungs-better-desert-temples


##### 070. YUNG's Better Jungle Temples
Expanded jungle temple challenges.
https://www.curseforge.com/minecraft/mc-mods/yungs-better-jungle-temples


##### 071. YUNG's Better Ocean Monuments
Expanded ocean monuments.
https://www.curseforge.com/minecraft/mc-mods/yungs-better-ocean-monuments


##### 072. YUNG's Better Nether Fortresses
More interesting Nether fortresses.
https://www.curseforge.com/minecraft/mc-mods/yungs-better-nether-fortresses


##### 073. YUNG's Better Witch Huts
More distinctive witch huts.
https://www.curseforge.com/minecraft/mc-mods/yungs-better-witch-huts


##### 074. YUNG's Better End Island
A reworked central End island.
https://www.curseforge.com/minecraft/mc-mods/yungs-better-end-island


##### 075. YUNG's Bridges
Generated bridges that add exploration landmarks.
https://www.curseforge.com/minecraft/mc-mods/yungs-bridges

#### ORES, WEAPONS AND TREASURE


##### 076. Apotheosis
Powerful affix loot, gems, enchanting and adventure progression.
https://www.curseforge.com/minecraft/mc-mods/apotheosis


##### 077. Simply Swords
Large weapon selection and unique magical weapons.
https://www.curseforge.com/minecraft/mc-mods/simply-swords


##### 078. Spartan Weaponry
Polearms, throwing weapons and more.
https://www.curseforge.com/minecraft/mc-mods/spartan-weaponry


##### 079. Spartan Shields
More shield materials and choices.
https://www.curseforge.com/minecraft/mc-mods/spartan-shields


##### 080. Epic Knights: Shields, Armor and Weapons
Medieval equipment and armor sets.
https://www.curseforge.com/minecraft/mc-mods/epic-knights-armor-and-weapons


##### 081. Tetra
Modular weapon/tool upgrades and exploration discoveries.
https://www.curseforge.com/minecraft/mc-mods/tetra


##### 082. Silent Gear
Build equipment from materials; optional crafting path.
https://www.curseforge.com/minecraft/mc-mods/silent-gear


##### 083. Silent's Gems
Additional gems and associated equipment/content.
https://www.curseforge.com/minecraft/mc-mods/silents-gems


##### 084. Gobber
Strong equipment, rings and rare resources.
https://www.curseforge.com/minecraft/mc-mods/gobber


##### 085. SimpleOres
Additional ores and material tiers.
https://www.curseforge.com/minecraft/mc-mods/simpleores


##### 086. Treasure2
Locked treasure chests and keys.
https://www.curseforge.com/minecraft/mc-mods/treasure2

#### WILDLIFE, EXPLORATION AND USEFUL TOYS


##### 087. Biomes O' Plenty
A varied Overworld for the pack's adventures.
https://www.curseforge.com/minecraft/mc-mods/biomes-o-plenty


##### 088. Ecologics
Additional biome life and creatures.
https://www.curseforge.com/minecraft/mc-mods/ecologics


##### 089. Naturalist
More wildlife.
https://www.curseforge.com/minecraft/mc-mods/naturalist


##### 090. Critters and Companions
Small distinctive animals and companions.
https://www.curseforge.com/minecraft/mc-mods/critters-and-companions


##### 091. Unusual Prehistory
Prehistoric creatures and revival content.
https://www.curseforge.com/minecraft/mc-mods/unusual-prehistory


##### 092. Domestication Innovation
More depth and abilities for pets.
https://www.curseforge.com/minecraft/mc-mods/domestication-innovation


##### 093. Doggy Talents Next
Train and develop dog companions.
https://www.curseforge.com/minecraft/mc-mods/doggy-talents-next


##### 094. Guard Villagers
Villagers gain defenders.
https://www.curseforge.com/minecraft/mc-mods/guard-villagers


##### 095. Small Ships
Sailable ships for ocean adventures.
https://www.curseforge.com/minecraft/mc-mods/small-ships


##### 096. Paragliders
Gliding exploration and an associated stamina system.
https://www.curseforge.com/minecraft/mc-mods/paragliders


##### 097. Farmer's Delight
Better adventure food and cooking.
https://www.curseforge.com/minecraft/mc-mods/farmers-delight


##### 098. Nether's Delight
Nether-themed cooking and ingredients.
https://www.curseforge.com/minecraft/mc-mods/nethers-delight


##### 099. Supplementaries
Interactive objects and exploration/building toys.
https://www.curseforge.com/minecraft/mc-mods/supplementaries


##### 100. Quark
Configurable additions throughout the world.
https://www.curseforge.com/minecraft/mc-mods/quark


##### 101. Chococraft
Final Fantasy-inspired chocobo mounts.
https://www.curseforge.com/minecraft/mc-mods/chococraft

#### EXPANSION: 70 NEW CONTENT CHOICES

#### DRAGONS, MOUNTS AND GENETICS


##### 102. Book of Dragons
Flagship HTTYD addition: dragon genetics, rare coats, individual temperaments, bonding, taming and flight. Observed file: bookofdragons-1.4-1.20.1.jar (Forge). New AI and flight systems need integration testing.
https://www.curseforge.com/minecraft/mc-mods/book-of-dragons


##### 103. Dragons of Berk
Modern Isle of Berk port with familiar HTTYD dragons and mount controls. Observed file: dragonsofberk-1.20.1-1.2.2.jar (Forge). OPTIONAL ALTERNATIVE to Book of Dragons initially; running both duplicates species and needs spawn/control testing.
https://www.curseforge.com/minecraft/mc-mods/dragons-of-berk


##### 104. Mythic Mounts (Forge)
Flying, land and aquatic fantasy mounts, breeding, babies and miniature pets. Use the Forge project.
https://www.curseforge.com/minecraft/mc-mods/mythic-mounts-forge


##### 105. Realistic Horse Genetics
Breed horses for inherited colours, markings, sizes and performance traits; build a proper stud farm.
https://www.curseforge.com/minecraft/mc-mods/realistic-horse-genetics

#### NPCS, SETTLEMENTS AND COMPANIONS


##### 106. Ribbits
Swamp settlements of musical frog people, traders, gardeners and sorcerers.
https://www.curseforge.com/minecraft/mc-mods/ribbits


##### 107. Human Companions
Recruit knights, archers and other companions from wilderness houses; outfit an adventuring party.
https://www.curseforge.com/minecraft/mc-mods/human-companions


##### 108. Villager Recruits
Hire soldiers, command groups and defend your settlement; give castles and barracks a purpose.
https://www.curseforge.com/minecraft/mc-mods/recruits


##### 109. Villager Workers 2
Hire farmers, fishers, cooks, builders and other workers. Current generation requires Recruits. Village labour is optional.
https://www.curseforge.com/minecraft/mc-mods/workers


##### 110. Goblin Traders
Unexpected merchants underground and in the Nether.
https://www.curseforge.com/minecraft/mc-mods/goblin-traders


##### 111. More Villagers
Extra professions, workstations and trades give towns more purposes.
https://www.curseforge.com/minecraft/mc-mods/more-villagers


##### 112. Bountiful
Village bounty boards with repeatable jobs and rewards. Custom modded hunts/rewards require authoring bounty data.
https://www.curseforge.com/minecraft/mc-mods/bountiful


##### 113. MCA Reborn
OPTIONAL SOCIAL-VILLAGE MODULE: relationships, families and distinctive residents. Replaces villagers; test custom professions, guards and recruitment before combining every village system.
https://www.curseforge.com/minecraft/mc-mods/minecraft-comes-alive-reborn


##### 114. Wares
Delivery contracts and trading tasks: an additional reason to gather goods and return to civilisation.
https://www.curseforge.com/minecraft/mc-mods/wares


##### 115. MineColonies
OPTIONAL KINGDOM-BUILDING MODULE: a working colony with citizens, builders and professions. Substantial management and resource demands; choose this if running a kingdom sounds fun. It is not automatic integration with MCA or Recruits.
https://www.curseforge.com/minecraft/mc-mods/minecolonies

#### WILDLIFE, STRANGE VARIANTS AND LIVELY BIOMES


##### 116. Untamed Wilds
More wild animals and habitat variety. Published 1.20.1 beta; balance spawns with Alex's Mobs and Naturalist.
https://www.curseforge.com/minecraft/mc-mods/untamedwilds


##### 117. Exotic Birds
Bird species and egg collecting/hatching for an aviary.
https://www.curseforge.com/minecraft/mc-mods/exotic-birds


##### 118. Environmental
Extra biome life and environmental detail between major adventures.
https://www.curseforge.com/minecraft/mc-mods/environmental


##### 119. Upgrade Aquatic
Richer waterways with additional aquatic life and plants.
https://www.curseforge.com/minecraft/mc-mods/upgrade-aquatic


##### 120. Autumnity
Autumn landscapes, turkeys and snails with harvestable products.
https://www.curseforge.com/minecraft/mc-mods/autumnity


##### 121. Habitat
Biome-specific flora and fauna to make ordinary exploration more varied.
https://www.curseforge.com/minecraft/mc-mods/habitat


##### 122. Earth Mobs
Minecraft Earth creatures and unusual mob variants populate the Overworld.
https://www.curseforge.com/minecraft/mc-mods/earth-mobs


##### 123. Enderman Overhaul
Regional endermen with different appearances and behaviours.
https://www.curseforge.com/minecraft/mc-mods/enderman-overhaul


##### 124. Creeper Overhaul
Biome-themed creeper variants.
https://www.curseforge.com/minecraft/mc-mods/creeper-overhaul


##### 125. It Takes a Pillage
Expanded pillager civilisation, enemies and hostile settlements.
https://www.curseforge.com/minecraft/mc-mods/it-takes-a-pillage


##### 126. Illager Revolution
Additional illager enemies and magical threats; tune combined raids.
https://www.curseforge.com/minecraft/mc-mods/illager-revolution


##### 127. Whisperwoods
Wisps, strange forest creatures and supernatural woodland encounters.
https://www.curseforge.com/minecraft/mc-mods/whisperwoods


##### 128. LUMINOUS: NETHER
Additional Nether biomes, creatures and rare legendary beasts.
https://www.curseforge.com/minecraft/mc-mods/luminous-nether


##### 129. Mutant More
Dangerous mutant mobs, mutation-related discoveries and reward items. Use the new project, not Old Mutant More; early-access content.
https://www.curseforge.com/minecraft/mc-mods/new-mutant-more


##### 130. Cobblemon
OPTIONAL CROSSOVER MODULE: catch, train and battle Pokemon; a huge collecting side-game. Use Forge 1.20.1 v1.5.2. Do not assume newer-version riding, breeding or addon features exist in this branch.
https://www.curseforge.com/minecraft/mc-mods/cobblemon

#### BREEDING, RESOURCE FARMS, FISHING AND FOOD


##### 131. Productive Bees
Collect and breed resource bees with genetic traits; Bumblezone integration. Includes processing blocks, but no wider engineering progression is required.
https://www.curseforge.com/minecraft/mc-mods/productivebees


##### 132. Modern Chickens
Modern Chickens/Roost-style resource chicken breeding and coops. Its optional power/fluid/tech integrations are outside this pack's intended progression.
https://www.curseforge.com/minecraft/mc-mods/modern-chickens


##### 133. Aquaculture 2
More fishing species, tackle and aquatic treasure; build a fishing lodge.
https://www.curseforge.com/minecraft/mc-mods/aquaculture


##### 134. Fish of Thieves
Sea of Thieves-inspired fish and variants; another crossover collecting loop.
https://www.curseforge.com/minecraft/mc-mods/fish-of-thieves


##### 135. Nether Depths Upgrade
Lava fish, Nether aquatic exploration and lava-aquarium possibilities.
https://www.curseforge.com/minecraft/mc-mods/nether-depths-upgrade


##### 136. Mystical Agriculture
Grow resources and mob essences as crops; an optional magical greenhouse route.
https://www.curseforge.com/minecraft/mc-mods/mystical-agriculture


##### 137. Mystical Agradditions
Extra resource-growing tiers and content for Mystical Agriculture.
https://www.curseforge.com/minecraft/mc-mods/mystical-agradditions


##### 138. Croptopia
A larger collection of crops, fruit trees and recipes for orchards and farms.
https://www.curseforge.com/minecraft/mc-mods/croptopia


##### 139. Fruits Delight
Fruit-growing and food variety around Farmer's Delight.
https://www.curseforge.com/minecraft/mc-mods/fruits-delight


##### 140. Delightful
More foods and cross-mod cooking uses.
https://www.curseforge.com/minecraft/mc-mods/delightful


##### 141. Brewin' And Chewin'
Fermented drinks and foods for a functioning inn or tavern.
https://www.curseforge.com/minecraft/mc-mods/brewin-and-chewin


##### 142. Farmer's Respite
Tea and coffee farming for gardens and roadside inns.
https://www.curseforge.com/minecraft/mc-mods/farmers-respite


##### 143. Collector's Reap
Wild ingredients and extra foods that reward foraging.
https://www.curseforge.com/minecraft/mc-mods/collectors-reap


##### 144. Ocean's Delight
Cooking uses for ocean resources.
https://www.curseforge.com/minecraft/mc-mods/oceans-delight


##### 145. Alex's Delight
Connects Alex's Mobs ingredients with Farmer's Delight cooking.
https://www.curseforge.com/minecraft/mc-mods/alexs-delight

#### MORE MAGIC, BOSSES AND OTHER WORLDS


##### 146. Feywild
Fairies, seasonal courts, quests and a fairy realm: a major fantasy/NPC addition.
https://www.curseforge.com/minecraft/mc-mods/feywild


##### 147. Legendary Monsters
Additional midgame and endgame bosses give powerful equipment worthy targets.
https://www.curseforge.com/minecraft/mc-mods/legendary-monsters


##### 148. Celestisynth
OPTIONAL LEGACY MODULE: flashy celestial weapons and effects. Current project says cancelled pending a rewrite; published Forge 1.20.1 files remain.
https://www.curseforge.com/minecraft/mc-mods/celestisynth


##### 149. Marium's Soulslike Weaponry
Legendary weapons and extra bosses. Select the Forge 1.20.1 build.
https://www.curseforge.com/minecraft/mc-mods/mariums-soulslike-weaponry


##### 150. Stalwart Dungeons
Harder dungeons and relic-hunting encounters in the Nether and End.
https://www.curseforge.com/minecraft/mc-mods/stalwart-dungeons


##### 151. Gateways to Eternity
Summoned wave-combat challenges and loot; these are encounters, not additional dimensions.
https://www.curseforge.com/minecraft/mc-mods/gateways-to-eternity


##### 152. Dimensional Doors
Rifts, pocket spaces and dangerous dimensional exploration.
https://www.curseforge.com/minecraft/mc-mods/dimensionaldoors


##### 153. Dimensional Dungeons
Repeatable portal-accessed dungeon expeditions without crowding the Overworld.
https://www.curseforge.com/minecraft/mc-mods/dimensional-dungeons


##### 154. Unusual End
Additional End life, discoveries and progression.
https://www.curseforge.com/minecraft/mc-mods/unusual-end


##### 155. Enlightend
Alien End biomes and creatures; test biome distribution with other End expansions.
https://www.curseforge.com/minecraft/mc-mods/enlightend


##### 156. Bygone Nether
Biome-specific Nether structures and enemies.
https://www.curseforge.com/minecraft/mc-mods/bygone-nether


##### 157. Nature's Aura
Nature rituals and environmental magic. Its automation remains optional.
https://www.curseforge.com/minecraft/mc-mods/natures-aura


##### 158. Roots Classic
Plant-based ritual magic and spells.
https://www.curseforge.com/minecraft/mc-mods/roots-classic


##### 159. Reliquary Reincarnations
Magical curios, powerful items and alchemical toys.
https://www.curseforge.com/minecraft/mc-mods/reliquary-reincarnations


##### 160. Ars Ocultas
Connects Ars Nouveau and Occultism, both already selected.
https://www.curseforge.com/minecraft/mc-mods/ars-ocultas


##### 161. Ars Instrumentum
Extra equipment and tools for your Ars Nouveau mage.
https://www.curseforge.com/minecraft/mc-mods/ars-instrumentum

#### MORE RUINS, DUNGEONS AND MEDIEVAL LANDMARKS


##### 162. Dungeons and Taverns
Taverns and exploration structures. Use the Forge-packaged 1.20.1 release; newer-version features are not promised.
https://modrinth.com/datapack/dungeons-and-taverns


##### 163. Explorify
Smaller discoveries and structures along the journey between major dungeons.
https://www.curseforge.com/minecraft/mc-mods/explorify


##### 164. Structory
Atmospheric ruins, cottages and settlements; a sense of past inhabitants.
https://www.curseforge.com/minecraft/mc-mods/structory


##### 165. Dungeons Enhanced
Castles, crypts and large fantasy dungeons.
https://www.curseforge.com/minecraft/mc-mods/dungeonsenhanced


##### 166. Medieval Buildings
Medieval houses, settlements and treasure-bearing landmarks.
https://www.curseforge.com/minecraft/mc-mods/medieval-buildings


##### 167. Realm RPG: Fallen Adventurers
Discover the skeletal remains and treasure of earlier adventurers. Environmental storytelling, not recruitable living NPCs.
https://www.curseforge.com/minecraft/mc-mods/realm-rpg-fallen-adventurers

#### MAKE YOUR HOME WORTH RETURNING TO


##### 168. Fantasy's Furniture
Furnish castles, wizard rooms and fantasy inns.
https://www.curseforge.com/minecraft/mc-mods/fantasys-furniture


##### 169. Handcrafted
Furniture and decorative pieces for homes, shops and lodges.
https://www.curseforge.com/minecraft/mc-mods/handcrafted


##### 170. Chipped
Many building-block variants for distinctive sanctuaries, towers and settlements.
https://www.curseforge.com/minecraft/mc-mods/chipped


##### 171. Serene Seasons
Changing seasons and seasonal farming. Recommended: keep seasonal visuals but relax crop restrictions if they become a chore.
https://www.curseforge.com/minecraft/mc-mods/serene-seasons


#### POPULAR-MOD SWEEP: 27 FURTHER CONTENT CHOICES
#### Checked 29 October 2026. This pass compares CurseForge's popular RPG and
#### dungeon roundups with the existing list, then checks author project/file
#### pages for Forge 1.20.1. It includes popular omissions and smaller projects
#### that fit this pack especially well; it is not a claim that every entry is
#### a top-download mod. Versions below are observed examples, not a locked set.

#### Discovery sources:
#### https://blog.curseforge.com/top-minecraft-rpg-mods/
#### https://blog.curseforge.com/best-minecraft-dungeon-mods/

#### MORE ADVENTURES, STRUCTURES AND WORLDS


##### 172. Iter RPG
More fantasy creatures, bosses and dungeon adventures.
Forge 1.20.1 file observed: iter_rpg-0.7.9a-forge-1.20.1.jar.
Requires GeckoLib and Curios; match the chosen file's version ranges.
https://www.curseforge.com/minecraft/mc-mods/iter-rpg


##### 173. Dungeons Content
Minecraft Dungeons-inspired enemies, equipment and adventure content.
Forge 1.20.1 file observed: dungeons_1.19_mc1.20.1.jar.
Check overlap with the existing Dungeons-themed equipment additions.
https://www.curseforge.com/minecraft/mc-mods/minecraft-dungeons-content


##### 174. Dungeon Now Loading
Handcrafted dungeon exploration and boss encounters.
Forge 1.20.1 version 2.2% listed. The project's ambitious dungeon total
is a roadmap, not a promise of 100 finished dungeons in this release.
https://www.curseforge.com/minecraft/mc-mods/dungeon-now-loading


##### 175. BrassAmber BattleTowers
Climb dangerous towers, fight their guardians and take the treasure.
Forge 1.20.1 version 3.0.0-beta3.2.1 listed; beta content.
https://www.curseforge.com/minecraft/mc-mods/brassamberbattletowers


##### 176. Doomlike Dungeons
Large randomized underground dungeon networks for loot expeditions.
Forge 1.20.1 file: dldungeonsjbg-2.2.1-MC1.20.1.jar.
Tune underground generation alongside the existing dungeon mods.
https://www.curseforge.com/minecraft/mc-mods/project-74246


##### 177. Moog's Voyager Structures
More landmarks and structures to discover while travelling.
1.20.1-filtered file list includes 5.1.3-1.20+ UNIVERSAL with Forge.
https://www.curseforge.com/minecraft/mc-mods/moogs-voyager-structures


##### 178. Moog's End Structures
More reasons to explore the End islands beyond the dragon fight.
1.20.1-filtered file list includes MES 2.0.3-1.20 UNIVERSAL with Forge.
https://www.curseforge.com/minecraft/mc-mods/moogs-end-structures


##### 179. Ancient Structures: Cultural buildings
Ruins and buildings inspired by historic civilizations, with secrets,
custom encounters and loot. Adds a different architectural identity.
Verified Forge 1.20.1 file: ancientstructures-forge-1.20.1-0.0.10.jar.
https://www.curseforge.com/minecraft/mc-mods/ancient-cultural-structures


##### 180. The Abyss II - The Other Side
Another dark fantasy dimension and its exploration/progression.
Forge 1.20.1: TATOS 1.0.1 Stable. Do not substitute the 1.20.2 beta
or treat the separate Abyss III announcement as a 1.20.1 release.
Project lists JEI, GeckoLib and Patchouli for this branch.
https://www.curseforge.com/minecraft/mc-mods/the-abyss-chapter-ii

#### STRANGER CREATURES AND A PREHISTORIC COLLECTION


##### 181. Myths & Legends (oVinter)
Fantasy encounters including gargoyles, imps and possessed armor.
Forge 1.20.1 file observed: mythsandlegends-1.0.6.jar.
https://www.curseforge.com/minecraft/mc-mods/myths-n-legends


##### 182. Species
Inventive fictional wildlife with unusual behavior and uses.
Forge 1.20.1 version 3.5 listed. Not every creature is a mount or pet.
https://www.curseforge.com/minecraft/mc-mods/species


##### 183. Fossils and Archeology: Revival
Excavate fossils, recover genetic material and revive prehistoric
creatures. A substantial new collection to build habitats around.
Forge 1.20.1 version 9.3.4.0 listed.
Listed dependencies include Architectury, GeckoLib, More Hitboxes and
TerraBlender. Revival machinery is a specialist dinosaur activity;
never make it a prerequisite for the rest of the fantasy progression.
https://www.curseforge.com/minecraft/mc-mods/fossils


##### 184. EEEAB's Mobs
Additional elaborate creatures and boss encounters.
Forge 1.20.1 version 0.98.1 listed as beta.
https://www.curseforge.com/minecraft/mc-mods/eeeabs-mobs

#### MORE MAGIC AND CHARACTER BUILD OPTIONS


##### 185. Enchanted: Witchcraft
Witchery-inspired rituals and circle magic for a dedicated witch's
woodland home and a different style of magical progression.
Forge 1.20.1 file: enchanted-forge-1.20.1-3.1.14.jar.
https://www.curseforge.com/minecraft/mc-mods/enchanted-witchcraft


##### 186. Totemic
Totem poles, musical ceremonies and nature-themed magical benefits.
Forge 1.20.1 version 0.12.18 listed. Patchouli is recommended for its
guide; resolve required libraries from the selected release.
https://www.curseforge.com/minecraft/mc-mods/totemic


##### 187. Enchanted: Wands & Tomes
Turn enchantments into spellcasting tools. Version 1.1.0 explicitly
describes integration with Ars Nouveau and Iron's Spells 'n Spellbooks.
Forge/NeoForge 1.20.1 release verified; choose the matching loader.
https://modrinth.com/mod/enchanted-wands-tomes/version/1Bv0RmoF


##### 188. Enigmatic Addons
More unusual equipment and accessories for Enigmatic Legacy.
Forge 1.20.1 version 1.2.7 listed. Requires the existing base mod;
inspect the selected release for all additional dependency requirements.
https://www.curseforge.com/minecraft/mc-mods/enigmatic-addons


##### 189. Passive Skill Trees
A branching character-build system inspired by action RPGs.
Forge 1.20.1 file: PassiveSkillTree-1.20.1-BETA-0.7.6e-all.jar.
Beta. Check whether bonuses affect each mod's spells and weapons;
universal support for every custom damage system is not assumed.
https://www.curseforge.com/minecraft/mc-mods/passive-skill-tree


##### 190. Ice and Fire: Spellbooks
Connects two existing pillars of the pack: dragonsteel mage armor,
a legendary spellbook, Dragon Priest equipment and exploration loot.
Forge 1.20.1 version 2.3.2 listed. Requires Ice and Fire and Iron's
Spells 'n Spellbooks, plus their matching dependencies.
https://www.curseforge.com/minecraft/mc-mods/ice-and-fire-spellbooks

#### OPTIONAL EXTRAVAGANCE AND ALTERNATIVE RULESETS
#### These eight are included in the catalogue count. Their individual release
#### availability does not make them a recommendation to enable all together.


##### 191. ProjectE [OPTIONAL: OVERPOWERED ALCHEMY]
Transmutation and powerful alchemical equipment for a demigod route.
Forge 1.20.1 file: ProjectE-1.20.1-PE1.0.1.jar.
EMC exchange can erase the reason to hunt rare resources. If enabled,
exclude collectible eggs, rare drops and quest rewards from exchange
where appropriate. Not every modded item has a valid EMC value.
https://www.curseforge.com/minecraft/mc-mods/projecte


##### 192. Tinkers Construct [OPTIONAL: ARTISAN WEAPONCRAFT]
Assemble and improve custom tools and weapons from different materials.
Forge 1.20.1 version 3.12.1.231 listed; requires matching Mantle.
Includes casting and a smeltery. This is an optional crafting hobby,
never a mandatory industrial chain for accessing other content.
https://www.curseforge.com/minecraft/mc-mods/tinkers-construct


##### 193. Progressive Bosses [OPTIONAL: REPEATABLE CHALLENGE]
Makes supported vanilla bosses more challenging with repeated kills.
Forge 1.20.1 version 4.3.12 listed. Do not assume it scales every modded
boss. Tune separately from other difficulty and boss-replacement mods.
https://www.curseforge.com/minecraft/mc-mods/progressive-bosses


##### 194. AtomicStryker's Infernal Mobs [OPTIONAL: ELITE MONSTERS]
Random enemy modifiers create unpredictable elite encounters.
Official file list includes Forge 1.20.1 releases, including Feb 2026.
With Apotheosis already present, restrict eligible mobs and avoid
uncontrolled double-scaling. Protect pets, villagers and custom bosses.
https://www.curseforge.com/minecraft/mc-mods/atomicstrykers-infernal-mobs/files/all?page=1&version=1.20.1


##### 195. Origins (Forge) [OPTIONAL: CHARACTER IDENTITY; DISCONTINUED]
Choose an origin with distinct abilities and limitations.
A published Forge 1.20.1 release exists: 1.10.0.9. The project is marked
discontinued. Treat as an alternative identity layer; transformations
from Dragon Survival, Vampirism and Werewolves need individual testing.
https://www.curseforge.com/minecraft/mc-mods/origins-forge


##### 196. Jujutsu Craft (Sorcery Fight), by Orca [OPTIONAL: ANIME CHAOS]
Cursed spirits, sorcerers and extravagant supernatural techniques.
Author project lists Forge 1.20.1. Use this Orca project, not unrelated
mods with the same name. Test destructive abilities and NPC survival;
ideally keep the most disruptive encounters away from the home region.
https://modrinth.com/mod/orca-jujutsu-craft


##### 197. Mine and Slash [OPTIONAL: SEPARATE RPG RULESET]
Extensive action-RPG stats, levelling, loot and combat progression.
Forge 1.20.1 version 6.4.13 listed.
This is an ALTERNATIVE PROFILE candidate, not a default drop-in for
the full pack. Its damage/stat systems require deliberate integration
with custom weapons, bosses, spells and other skill/progression mods.
https://www.curseforge.com/minecraft/mc-mods/mine-and-slash-reloaded


##### 198. End Remastered [OPTIONAL: EXPLORATION GATE]
Hunt special eyes to reach the End. Gives widespread exploration a
central objective; it does not add a new dimension.
Forge 1.20.1-filtered releases include R5.3.3 for 1.20.X.
Enable only if this extra End-access requirement sounds fun; leave it
out for the pack's default freely chosen exploration routes.
https://www.curseforge.com/minecraft/mc-mods/endremastered/files/all?version=1.20.1

#### HOW THESE ADDITIONS FIT THE EXISTING PACK
#### The intended loop: explore from the existing NPC settlements, discover a
#### tower or ruin, recover an artifact or fossil, return to expand the sanctuary,
#### then build a new magical loadout for the next expedition. Species and revived
#### prehistoric creatures give the world more inhabitants; they do not replace
#### the existing dedicated genetics, breeding, mount and farming selections.

#### Prefer distinctive destinations over structures in every visible chunk.
#### Adjust spacing and loot tables after checking generation in a fresh world.
#### New structures and ores generally require newly generated terrain.
#### Do not promise every structure contains friendly NPCs: most here are
#### exploration encounters; the earlier settlement/companion mods supply towns.

#### Keep the full fantasy/magic foundation. Do not automatically layer Epic Fight
#### and its animation-dependent weapon addons over the selected combat mods;
#### that would need its own integration pass. Popularity lists also mix loaders
#### and Minecraft versions: a Fabric RPG mod is not automatically a Forge choice.

#### DEPENDENCY STATUS FOR THIS SWEEP
#### Content names are not a complete jar manifest. Existing libraries may cover
#### several new mods, but exact release dependency ranges must still be resolved.
#### Use the chosen Forge 1.20.1 file's Relations/Dependencies, including transitive
#### requirements. Add Mantle for Tinkers and More Hitboxes for Fossils as needed;
#### do not duplicate existing GeckoLib, Curios, Architectury or TerraBlender jars.
#### No launches, installations or full-combination compatibility tests were done.



#### UTILITY MODS (20 -- SEPARATE FROM CONTENT COUNT)


##### U01. JEI: Recipes and item lookup.
https://www.curseforge.com/minecraft/mc-mods/jei


##### U02. Jade: Identify blocks and entities.
https://www.curseforge.com/minecraft/mc-mods/jade


##### U03. AppleSkin: Food and saturation information.
https://www.curseforge.com/minecraft/mc-mods/appleskin


##### U04. Mouse Tweaks: Inventory handling.
https://www.curseforge.com/minecraft/mc-mods/mouse-tweaks


##### U05. Controlling: Find keybind conflicts.
https://www.curseforge.com/minecraft/mc-mods/controlling


##### U06. Enchantment Descriptions: Understand enchantments.
https://www.curseforge.com/minecraft/mc-mods/enchantment-descriptions


##### U07. Xaero's Minimap: Local navigation.
https://www.curseforge.com/minecraft/mc-mods/xaeros-minimap


##### U08. Xaero's World Map: Track discoveries.
https://www.curseforge.com/minecraft/mc-mods/xaeros-world-map


##### U09. Waystones: Fast return travel.
https://www.curseforge.com/minecraft/mc-mods/waystones


##### U10. Nature's Compass: Locate biomes.
https://www.curseforge.com/minecraft/mc-mods/natures-compass


##### U11. Explorer's Compass: Locate structures.
https://www.curseforge.com/minecraft/mc-mods/explorers-compass


##### U12. Sophisticated Backpacks: Carry treasure.
https://www.curseforge.com/minecraft/mc-mods/sophisticated-backpacks


##### U13. Sophisticated Storage: Store treasure without a factory.
https://www.curseforge.com/minecraft/mc-mods/sophisticated-storage


##### U14. Comforts: Sleep while exploring.
https://www.curseforge.com/minecraft/mc-mods/comforts


##### U15. Carry On: Move supported containers and creatures.
https://www.curseforge.com/minecraft/mc-mods/carry-on


##### U16. GraveStone Mod: Recover your equipment after disasters.
https://www.curseforge.com/minecraft/mc-mods/gravestone-mod


##### U17. Polymorph: Choose between conflicting crafting recipes.
https://www.curseforge.com/minecraft/mc-mods/polymorph


##### U18. Lootr: Personal chest loot in multiplayer.
https://www.curseforge.com/minecraft/mc-mods/lootr


##### U19. Clumps: Combine XP orbs.
https://www.curseforge.com/minecraft/mc-mods/clumps


##### U20. FTB Backups 2: World backups.
https://www.curseforge.com/minecraft/mc-mods/ftb-backups-2

#### PERFORMANCE / DIAGNOSTICS (5 -- ADD AFTER BASELINE WORKS)


##### P1. Embeddium: Rendering optimization; client.
https://www.curseforge.com/minecraft/mc-mods/embeddium


##### P2. ModernFix: Loading/memory fixes.
https://www.curseforge.com/minecraft/mc-mods/modernfix


##### P3. FerriteCore: Memory optimization.
https://www.curseforge.com/minecraft/mc-mods/ferritecore


##### P4. Entity Culling: Avoid rendering hidden entities; client.
https://www.curseforge.com/minecraft/mc-mods/entityculling


##### P5. spark: Diagnose performance; not an FPS boost by itself.
https://www.curseforge.com/minecraft/mc-mods/spark

#### DEPENDENCIES AND SUPPORT LIBRARIES
#### The list below is a build checklist, not a complete locked dependency
#### manifest. For ALL content/utility files, accept required dependencies
#### recursively in the launcher. Select Minecraft 1.20.1 + Forge first.
#### Then inspect Forge's startup report for missing or incompatible ranges.
#### Do not automatically install optional or incompatible project relations.

#### Important: modern PROJECT dependency pages can describe other Minecraft
#### versions. Use the chosen FILE's dependencies. For example:
- Do not add Fabric API or Fabric's Forge Config API Port to a Forge profile
just because a project's current Fabric release lists them.
- Do not add new standalone Apothic modules from another Minecraft version.
- Quark here uses Zeta, not its old 1.12.2 AutoRegLib dependency.
- Ice and Fire here uses Citadel, not the old LLibrary stack.
- Aether Fabric dependencies do not describe the Forge release.

- Citadel: Shared support for Ice and Fire, Alex's Mobs, Alex's Caves, Rats and Domestication Innovation. Check overlapping version ranges.
https://www.curseforge.com/minecraft/mc-mods/citadel
- GeckoLib: Animation support for many creatures/magic mods and Kingdom Keys; use the Forge 1.20.1 generation required by each file.
https://www.curseforge.com/minecraft/mc-mods/geckolib
- Curios API: Accessory slots used by many magic/loot mods.
https://www.curseforge.com/minecraft/mc-mods/curios
- Patchouli: In-game books; Blood Magic, Goety and various other selected mods.
https://www.curseforge.com/minecraft/mc-mods/patchouli
- playerAnimator: Player animations, including relevant Iron's Spells/SlashBlade releases.
https://www.curseforge.com/minecraft/mc-mods/playeranimator
- Iron's Lib: Required by current Iron's Spells releases; follow the chosen file.
https://www.curseforge.com/minecraft/mc-mods/irons-lib
- Caelus API: Needed by some 1.20.1 spell/flight mod releases; file-dependent.
https://www.curseforge.com/minecraft/mc-mods/caelus
- Architectury API: Cross-platform support used by Simply Swords and other selected files.
https://www.curseforge.com/minecraft/mc-mods/architectury-api
- Cloth Config API: Configuration support where requested by the selected files.
https://www.curseforge.com/minecraft/mc-mods/cloth-config
- Fzzy Config: Current Simply Swords dependency.
https://www.curseforge.com/minecraft/mc-mods/fzzy-config
- Simply Tooltips: Current Simply Swords dependency.
https://www.curseforge.com/minecraft/mc-mods/simply-tooltips
- Modonomicon: Occultism's guide system; follow its own dependencies too.
https://www.curseforge.com/minecraft/mc-mods/modonomicon
- SmartBrainLib: Required by some Occultism-era files; file-dependent.
https://www.curseforge.com/minecraft/mc-mods/smartbrainlib
- Cyclops Core: EvilCraft.
https://www.curseforge.com/minecraft/mc-mods/cyclops-core
- Lodestone: Malum.
https://www.curseforge.com/minecraft/mc-mods/lodestone
- Valhelsia Core: Forbidden and Arcanus and Valhelsia Structures.
https://www.curseforge.com/minecraft/mc-mods/valhelsia-core
- OctoLib: Relics.
https://www.curseforge.com/minecraft/mc-mods/octo-lib
- Puzzles Lib: Mutant Monsters and Illager Invasion.
https://www.curseforge.com/minecraft/mc-mods/puzzles-lib
- Blueprint: Savage & Ravage and The Endergetic Expansion.
https://www.curseforge.com/minecraft/mc-mods/blueprint
- Structure Gel API: Blue Skies and The Conjurer.
https://www.curseforge.com/minecraft/mc-mods/structure-gel-api
- Obscure API: Older Aquamirae 1.20.1 releases. Newer Aquamirae files may use a different library; select a matching Forge pair.
https://www.curseforge.com/minecraft/mc-mods/obscure-api
- YUNG's API: YUNG's structure suite.
https://www.curseforge.com/minecraft/mc-mods/yungs-api
- TerraBlender: Biome integration used by Biomes O' Plenty and Aether addons.
https://www.curseforge.com/minecraft/mc-mods/terrablender
- GlitchCore: Required by newer 1.20.1 Biomes O' Plenty files; not every older release.
https://www.curseforge.com/minecraft/mc-mods/glitchcore
- Aeroblender: Aether biome integration, including Aether Redux.
https://www.curseforge.com/minecraft/mc-mods/aeroblender
- Cumulus: Aether support where required by the chosen Forge file; do not add a second copy if embedded.
https://www.curseforge.com/minecraft/mc-mods/cumulus
- Resourceful Lib: Bumblezone and any dependent selected file.
https://www.curseforge.com/minecraft/mc-mods/resourceful-lib
- Resourceful Config: File-dependent configuration support.
https://www.curseforge.com/minecraft/mc-mods/resourceful-config
- Placebo: Apotheosis.
https://www.curseforge.com/minecraft/mc-mods/placebo
- Apothic Attributes: Apotheosis 1.20.1 support.
https://www.curseforge.com/minecraft/mc-mods/apothic-attributes
- mutil: Tetra.
https://www.curseforge.com/minecraft/mc-mods/mutil
- Silent Lib: Silent Gear and Silent's Gems.
https://www.curseforge.com/minecraft/mc-mods/silent-lib
- GottschCore: Treasure2.
https://www.curseforge.com/minecraft/mc-mods/gottschcore
- SimpleCore API: SimpleOres.
https://www.curseforge.com/minecraft/mc-mods/simplecore-api
- BucketLib: SimpleOres file-dependent support.
https://www.curseforge.com/minecraft/mc-mods/bucketlib
- Balm: Waystones.
https://www.curseforge.com/minecraft/mc-mods/balm
- Sophisticated Core: Sophisticated Backpacks and Storage.
https://www.curseforge.com/minecraft/mc-mods/sophisticated-core
- Zeta: Quark 1.20.1.
https://www.curseforge.com/minecraft/mc-mods/zeta
- Moonlight Lib: Supplementaries; also known as Selene.
https://www.curseforge.com/minecraft/mc-mods/selene
- Searchables: Controlling for applicable 1.20.1 files.
https://www.curseforge.com/minecraft/mc-mods/searchables
- Bookshelf: Enchantment Descriptions.
https://www.curseforge.com/minecraft/mc-mods/bookshelf
- Lionfish API: Newer Cataclysm files; follow the chosen release.
https://www.curseforge.com/minecraft/mc-mods/lionfish-api
- Kotlin for Forge: Only when requested by a selected file or its dependencies.
https://www.curseforge.com/minecraft/mc-mods/kotlin-for-forge

#### Additional file-specific dependencies may be requested by the exact release,
#### especially mods updated after the older established 1.20.1 versions.
#### Aquamirae's newer project metadata references Fragmentum; do not substitute a
#### NeoForge-only library into this Forge pack. Choose a documented matching
#### Forge release/dependency pair.
#### The Graveyard's newest project metadata also lists VillagersTradingPlus;
#### check whether the specific 1.20.1 file requires it.
#### A library listed as embedded does not need a duplicate external jar.

#### CONTENT-TO-CONTENT DEPENDENCIES
- Ars Elemental + Ars Additions -> Ars Nouveau.
- Deep Aether + Aether Redux -> The Aether.
- Werewolves -> Vampirism.
- Nether's Delight + Ender's Delight -> Farmer's Delight.
- Every addon must match the base mod's allowed version range.
#### These base mods are already part of the retained content selection.

#### HIGH-PRIORITY VERSION NOTES
- Ice and Fire has a published 1.20.1 beta line; do not use its 1.18.2 jar.
- Dragon Mounts: Legacy has a published 1.20.1 beta line.
- Dragon Survival has release and alpha 1.20.1 branches. Prefer a release
file, and do not assume alpha worlds or configs are interchangeable.
- AoA 1.20.1 is beta and partially redesigned; it is not a promise of
every dimension present in the original legacy mod.
- DivineRPG lists both Forge-era and NeoForge-labelled 1.20.1 files.
Pick an explicitly Forge-compatible file, not just the newest one.
- Kingdom Keys 2 has a Forge 1.20.1 release (2.6.6c observed).
- ChocoCraft has a Forge 1.20.1 release (0.9.12 observed).
- Do not include the original Illage and Spillage from 1.19.2.
- Do not include Grappling Hook v13: its author labels it broken on
Forge 47.1.4+. It was deliberately removed from this selection.
- Better Combat and Epic Fight are NOT part of this baseline. Layering
broad combat overhauls on top of SlashBlade, Kingdom Keys and many
spell systems needs separate integration work.
- Mine Piece is an optional high-impact module within the full selection:
test health, movement, keybinds, damage and progression against the rest.
- Dragon Survival changes player form; test casting, riding and equipment
alongside Kingdom Keys, Vampirism and Werewolves. Multiple supernatural
progressions existing does not mean their transformations can all be
active simultaneously on one player.

#### ADDITIONAL ATMOSPHERE MODS (3; OUTSIDE THE CONTENT COUNT)

##### A1. AmbientSounds -- regional environmental audio. Add CreativeCore as required.
https://modrinth.com/mod/ambientsounds

##### A2. Sound Physics Remastered -- environmental echoes and sound occlusion.
https://www.curseforge.com/minecraft/mc-mods/sound-physics-remastered

##### A3. Falling Leaves (NeoForge/Forge) -- falling leaf particles; select Forge 1.20.1.
https://modrinth.com/mod/fallingleavesforge
#### Use the matching 1.20.1 client files. Tune ambient audio volumes and particle
#### density so the world feels rich without drowning out creatures or dialogue.

#### ADDITIONAL DEPENDENCY CHECKLIST
#### This extends the earlier support-library list below. It is not a complete
#### resolved manifest. Let the launcher resolve REQUIRED dependencies for EACH
#### chosen FILE recursively. Never use current project metadata alone to choose
#### libraries for an older Minecraft branch.

- Book of Dragons: AzureLib and FAUNA Engine; use the versions required by
the selected 1.20.1 file, not the 1.21.1 libraries.
https://www.curseforge.com/minecraft/mc-mods/book-of-dragons/relations/dependencies
- Mythic Mounts: matching GeckoLib and Patchouli. The project description
retains old 1.19.2 library version numbers; do not copy them into 1.20.1.
- Ribbits: follow the chosen file's GeckoLib/YUNG's API/support requirements.
- Villager Workers 2: Villager Recruits is a required CONTENT dependency.
- Bountiful: Kambrik and Kotlin for Forge.
https://www.curseforge.com/minecraft/mc-mods/bountiful/relations/dependencies
- Goblin Traders: Framework for the applicable 1.20.1 releases.
- MCA Reborn: older files can require Architectury; follow the selected file.
- MineColonies: matching Structurize, BlockUI, Domum Ornamentum and
Multi-Piston files where required. Current project metadata also lists
TownTalk; only install it if the chosen 1.20.1 file requires and supports it.
https://www.curseforge.com/minecraft/mc-mods/minecolonies/relations/dependencies
- Environmental, Upgrade Aquatic and Autumnity: matching Blueprint.
- Earth Mobs: check Bagus Lib requirements for the chosen file.
- Fish of Thieves: current supported 1.20.1 line lists YACL; older files use
Cloth Config. Biolith is optional unless using its Tropical Island generation.
https://modrinth.com/mod/fish-of-thieves
- Mystical Agriculture/Agradditions: Cucumber Library; Agradditions also
requires Mystical Agriculture.
- Croptopia: check Epherolib requirements for the chosen file.
- Fruits Delight: check L2 Library requirements for the chosen file.
- Delightful, Brewin' And Chewin', Farmer's Respite, Collector's Reap,
Ocean's Delight and Alex's Delight: matching Farmer's Delight.
Alex's Delight also needs Alex's Mobs. Check Fruits Delight's file relations.
- Ars Ocultas: Ars Nouveau + Occultism; Ars Instrumentum: Ars Nouveau.
- Dungeons Enhanced: matching Structure Gel API.
- Gateways to Eternity: matching Placebo and any additional file requirements.
- Fantasy's Furniture: ApexCore.
https://www.curseforge.com/minecraft/mc-mods/fantasys-furniture/relations/dependencies
- Handcrafted: Resourceful Lib; Chipped: check Athena and Resourceful Lib.
- Serene Seasons: check GlitchCore requirements for the selected release.
- AmbientSounds: CreativeCore.
- Cobblemon: follow Forge 1.5.2 dependencies, including the matching
Kotlin for Forge requirement. Newer Cobblemon addons may target 1.21.1 only.

#### SHARED-LIBRARY RULE: all selected mods must accept one compatible installed
#### version of each library. Installing two conflicting GeckoLib/AzureLib/Citadel
#### versions is not a fix. Resolve the content version choices instead.
#### An embedded library should not be added again as an external jar.

#### WHAT MAKES THIS PACK DISTINCTIVE
#### The following is a configuration and play-design brief, not implemented
#### quests, scripts, configs or a premade world.

1. A HOME WITH A PURPOSE
Build a dragon sanctuary, mount stables, aviary, apiary, rare-chicken coops,
fish collection, orchards and a tavern. Display rare coats and trophies.
Use Fantasy's Furniture, Handcrafted and Chipped to give each area a style.
Different mods keep separate breeding/genetics systems; crossbreeding
between unrelated mods is not implied.

2. AN INHABITED COUNTRYSIDE
Keep the existing Towns and Towers + CTOV village selection.
Add Ribbits, Goblin Traders, Human Companions, Bountiful and Wares.
Recruits/Workers let the player establish a defended working settlement.
These mods provide their own encounters; a universal NPC economy,
faction system or integrated quest story would need custom development.

3. TWO OPTIONAL TOWN STYLES
Default: professions, trades, hireable helpers and soldiers.
Social alternative: add MCA after testing villager replacement and trades.
Kingdom alternative: add MineColonies if colony management appeals.
Do not turn MineColonies building/resource demands into a mandatory gate
for magic, mounts or dimensions. Its citizens are their own system.

4. DISTINCT PLACES, NOT A STRUCTURE EVERY FIFTY BLOCKS
Keep towns and small ruins relatively discoverable, large fortresses
less common and major boss sites rare. Adjust structure sets per mod;
there is no universal spacing switch for every selected structure.
As starting design targets only: a small landmark every few hundred
blocks, a substantial settlement roughly 800-1500 blocks apart, and
major strongholds several thousand blocks apart. Inspect actual worlds
and tune by experience; these are NOT guaranteed generation distances.
Retain open plains for riding, oceans for ships and stretches of wild
forest so that finding a large castle still feels special.

5. FAUNA THAT DOES NOT ERASE CIVILISATION
Check combined mob spawn caps so common mobs do not crowd out rare ones.
Reduce destructive dragon/fire behaviour around settlements and farms.
Tune illager raids so stacked mods produce interesting battles rather
than unwinnable permanent sieges. Protect tamed collections from
accidental friendly fire where supported.
Book of Dragons has configurable dragon reactivity and terrain effects;
its own AI may make tamed dragons antagonistic until socialised.

6. A REASON TO RETURN TO TOWN
Use Bountiful's normal jobs and Wares contracts.
Custom pack-wide jobs are a later authoring task. Suggested themes:
monster hunts, fish deliveries, unusual ingredients, resource-chicken
products and expedition supplies. Custom dragon/rare-variant objectives
may need extra scripting or a quest system; do not assume Bountiful
recognises every entity's coat/genetic data automatically.

7. MULTIPLE INDEPENDENT ADVENTURE PATHS
Dragon researcher; mount breeder; monster hunter; fairy ally; vampire;
wizard; ruin diver; treasure fisher; village captain.
Keep portals and spell schools accessible through their own progression.
Avoid a linear sequence that forces everyone to complete every system.
Do not assume every transformation can run simultaneously on one player.

8. LET THE RIDICULOUS LOOT BE RIDICULOUS
Keep the previous Kingdom Keys, Mine Piece, Touhou Little Maid, Rats,
Inventory Pets, Chance Cubes, Buddycards and ChocoCraft.
Cobblemon adds an optional Pokemon collecting/battling branch.
Keep Celestisynth/Marium/Simply Swords/Apotheosis equipment exciting,
but check boss immunities, damage scaling and combat-animation conflicts.
No blanket Better Combat/Epic Fight overhaul is added by this list.

9. FARMING SHOULD FEEL LIKE COLLECTING
Bees, resource chickens, horse genetics, fantasy mounts, bird eggs,
fish and unusual crops give different kinds of collections.
Mystical Agriculture and resource breeding should supplement expeditions.
If late resource farms trivialise everything, restrict only the problem
resource recipes; do not impose a factory chain on the entire pack.
Relax seasonal crop restrictions if they make the farm feel like chores.

10. LIVING ATMOSPHERE
Use Serene Seasons, AmbientSounds, Sound Physics and Falling Leaves.
Keep particles and audio adjustable. Start without shaders, particularly
while checking Alex's Caves and the new dragon rendering/flight systems.

#### ASSEMBLY NOTES FOR WHEN YOU ACTUALLY BUILD IT
- Create a fresh Forge 1.20.1 profile and resolve exact dependency versions.
- Begin with Book of Dragons, Mythic Mounts, the NPC/trading core and wildlife.
- Add structure groups, then the retained spell/dimension/gear groups.
- Add the optional transformation/crossover/colony modules last.
- Test world generation, village trades/recruitment, taming/riding, breeding,
save/reload, dimension return trips, death recovery and multiplayer if used.
- Use a fresh test world for worldgen checks; old explored chunks will not
automatically acquire new structures.
- Test the existing Aether + Deep Aether + Redux combination and the expanded
End/Nether generation before committing to a long-term save.
- Keep backup snapshots before changing large content mods.
- Choose memory/render/simulation settings after measuring on your machine.
This expanded selection has no measured RAM, CPU or FPS requirement.
- Export a pinned manifest and configs only after the chosen combination works.
This TXT does not itself install, configure or test anything.

#### VERSION RECEIPTS / IMPORTANT BRANCHES
#### Book of Dragons: Forge 1.20.1, 1.4
#### https://www.curseforge.com/minecraft/mc-mods/book-of-dragons/files/9339901
#### Dragons of Berk: Forge 1.20.1, 1.2.2
#### https://www.curseforge.com/minecraft/mc-mods/dragons-of-berk/files/9335730
#### Mythic Mounts: Forge 1.20.1, 20.1-7.4.2-forge
#### https://www.curseforge.com/minecraft/mc-mods/mythic-mounts-forge
#### Cobblemon: Forge 1.20.1, 1.5.2; not the newer 1.21.1 branch
#### https://www.curseforge.com/minecraft/mc-mods/cobblemon
#### Dimensional Dungeons: verified Forge 1.20/1.20.1 release 194
#### https://modrinth.com/mod/dimensional-dungeons/version/Hn1QKGHI
#### Dimensional Doors: Forge 1.20.1, 5.4.4 listed
#### https://www.curseforge.com/minecraft/mc-mods/dimensionaldoors
#### More Villagers: Forge 1.20.1, 5.0.0 listed
https://www.curseforge.com/minecraft/mc-mods/more-villagers/files/all?version=1.20.1
#### Enderman Overhaul: Forge 1.20.1, 1.0.4 listed
https://www.curseforge.com/minecraft/mc-mods/enderman-overhaul/files/all?version=1.20.1
#### Chipped: Forge 1.20.1, 3.0.7 listed
https://www.curseforge.com/minecraft/mc-mods/chipped/files/all?version=1.20.1
#### Handcrafted: Forge 1.20.1, 3.0.6 listed
https://www.curseforge.com/minecraft/mc-mods/handcrafted/files/all?version=1.20.1
#### Croptopia: Forge 1.20.1, 4.0.1 listed
https://www.curseforge.com/minecraft/mc-mods/croptopia/files/all?version=1.20.1

#### These receipts demonstrate release availability, not a mutually compatible
#### version lock. Project and file pages are the download sources. Do not infer
#### compatibility from a project's latest headline file alone.

#### COUNT AUDIT
#### Retained content selections: 101.
#### New dragons/mounts/genetics: 4.
#### New NPC/settlement/companion selections: 10.
#### New wildlife/mob/crossover selections: 15.
#### New breeding/farming/fishing/food selections: 15.
#### New magic/boss/dimensional selections: 16.
#### New structure/discovery selections: 6.
#### New homebuilding/season selections: 4.
#### First expansion content choices: 70.
#### Popular-mod sweep: 27 (19 recommended candidates + 8 optional/alternative choices).
#### Total content choices: 198 (includes marked optional alternatives).
#### Utilities: 20. Performance/diagnostics: 5. Atmosphere: 3.
#### Total named non-library selections: 226.
#### Libraries and conditional support dependencies are NOT part of that total.
#### The eventual installed count depends on module choices and resolved libraries.
#### No installed-total or full-pack compatibility claim is made.



## Historical appendix: superseded 1.12.2 proposal

This earlier proposal is retained so that older mod ideas are not lost when handing off to another chat. **It is a separate, superseded legacy catalogue, not an additional set of mods to mix into the Forge 1.20.1 pack.** Its original Hats/Morph-driven version choice no longer represents my preference. Its old Berk discussion is superseded by the correction in the current catalogue above. Historical counts do not increase the 198-content / 226-non-library totals.

The archive below is reproduced verbatim; treat its version claims and recommendations as historical notes requiring rechecking, not current instructions.

```text
ABSOLUTE NONSENSE: DRAGONS, DIMENSIONS & BAD DECISIONS
Minecraft Java Edition modpack blueprint
Prepared: 29 October 2026

TARGET
Minecraft Java Edition 1.12.2, Forge 14.23.5.x, 64-bit Java 8.
Use a current 1.12.2 Forge build accepted by the selected files.
Choose ONLY Forge/Minecraft 1.12.2 releases, including for every library.
This is a researched mod list and configuration plan, not an installed,
version-locked or launch-tested modpack. Whole-pack compatibility remains
unverified. A shared Minecraft version is necessary but not sufficient.

WHY THIS VERSION?
The original collectible Hats and kill-to-unlock Morph both support 1.12.2.
Isle of Berk is a different-version mod (Forge 1.18.2). It cannot be added
to this profile. Ice and Fire supplies rideable dragons here.
The main pack prioritizes the original Hats/Morph mechanics and an enormous
legacy adventure ecosystem. The separate Berk option is described at the end.

DESIGN
Explore, collect, fight, cast spells, ride dragons, get distracted by nonsense.
No required engineering progression, power grid or factory chain.
All 40 content entries below belong to the proposed full-content selection.
They are not all hard dependencies of one another. Magic research, dinosaur
revival and alloy crafting are optional activities within their respective mods.

DRAGONS, TRANSFORMATIONS, CROSSOVERS AND CREATURES
==================================================

1. Hats
   Collect hats from mobs you kill. Use 1.12.2 version 7.1.1.
   https://www.curseforge.com/minecraft/mc-mods/hats

2. Morph
   Kill mobs to unlock their forms. Use 1.12.2 version 7.2.1. Modded bosses and unusual models need individual testing; do not assume every ability transfers.
   https://www.curseforge.com/minecraft/mc-mods/morph

3. Ice and Fire: Dragons
   Ride and raise fire/ice dragons; discover mythical creatures and dragon equipment. Use 1.9.1 for 1.12.2. This replaces the Berk dragon theme, not the exact HTTYD species.
   https://www.curseforge.com/minecraft/mc-mods/ice-and-fire-dragons

4. Inventory Pets
   Collect living inventory pets that grant ridiculous powers and useful abilities.
   https://www.curseforge.com/minecraft/mc-mods/inventory-pets

5. Chance Cubes
   Random rewards, traps, encounters and disasters. Open them far from your home.
   https://www.curseforge.com/minecraft/mc-mods/chance-cubes

6. Portal Gun
   Portal-style teleportation nonsense. Use 7.1.0 for 1.12.2.
   https://www.curseforge.com/minecraft/mc-mods/portal-gun

7. Heroic Armory
   Over 280 crossover-inspired loot weapons, including Zelda, Adventure Time, Kingdom Hearts and more. Use 1.2.0. These are collectible weapons, not full franchise worlds or official Disney collaborations.
   https://www.curseforge.com/minecraft/mc-mods/heroic-armory

8. Rats
   Tameable, upgradeable rats, cheese and absurd rat adventures. Use the legacy 1.12.2 release; automation features are optional.
   https://www.curseforge.com/minecraft/mc-mods/rats

9. Mutant Beasts
   Giant mutant versions of familiar monsters.
   https://www.curseforge.com/minecraft/mc-mods/mutant-beasts

10. Mowzie's Mobs
   Distinctive animated enemies and boss encounters with special rewards.
   https://www.curseforge.com/minecraft/mc-mods/mowzies-mobs

11. Lycanites Mobs
   Weird monsters, tamable creatures, summons, bosses and dangerous events.
   https://www.curseforge.com/minecraft/mc-mods/lycanites-mobs

12. Grimoire of Gaia
   A large roster of fantasy monsters. The 1.12.2 branch is Grimoire of Gaia 3.
   https://www.curseforge.com/minecraft/mc-mods/grimoire-of-gaia

13. Fossils and Archeology: Revival
   Dinosaurs, fossils and prehistoric creatures. Has a small DNA revival workflow; included for dinosaurs, not a factory progression.
   https://www.curseforge.com/minecraft/mc-mods/fossils

DIMENSIONS AND STRANGE WORLDS
=============================

14. Advent of Ascension (Nevermine)
   The main mountain of content: many dimensions, creatures, bosses, guns, weapons and skills. Select its 1.12.2 branch, not a modern rewrite.
   https://www.curseforge.com/minecraft/mc-mods/advent-of-ascension-nevermine

15. DivineRPG
   Another huge stack of dimensions, bosses, unusual ores, weapons and armor. Use DivineRPG classic 1.7.1 for Minecraft 1.12.2.
   https://www.curseforge.com/minecraft/mc-mods/official-divinerpg

16. The Twilight Forest
   A forest adventure dimension with labyrinths, castles and boss progression.
   https://www.curseforge.com/minecraft/mc-mods/the-twilight-forest

17. The Betweenlands
   A fully developed swamp-horror adventure with its own creatures, materials and survival rules. Follow the author's release/download links for 1.12.2.
   https://github.com/Angry-Pixel/The-Betweenlands

18. The Aether
   Floating islands, flying mounts, strange ores and dungeon bosses. Use The Aether v1.12.2-1.5.4.1, not Aether II.
   https://www.curseforge.com/minecraft/mc-mods/aether

19. The Erebus
   A giant-insect dimension with distinctive materials and enemies. 1.0.32 is a published 1.12.2 beta.
   https://www.curseforge.com/minecraft/mc-mods/the-erebus

20. Atum 2: Return to the Sands
   An Egyptian desert dimension with tombs, pyramids and artifacts. Use 1.12.2-2.0.20.
   https://www.curseforge.com/minecraft/mc-mods/atum

21. Candy World
   An edible-looking candy dimension to make the pack aggressively unserious. Use 1.1.5.
   https://www.curseforge.com/minecraft/mc-mods/candy-world

22. DimensionalDoors
   Pocket dimensions, strange doors, traps and Limbo. Choose the legacy Forge 1.12.2 files.
   https://www.curseforge.com/minecraft/mc-mods/dimensionaldoors

23. AbyssalCraft
   Lovecraft-inspired dimensions, rituals, monsters and dangerous materials. Prefer the final stable 1.12.2 1.x line for this build over the newer 2.0 betas.
   https://www.curseforge.com/minecraft/mc-mods/abyssalcraft

24. NetherEx
   Adds variety, biomes and creatures to the Nether. Use its legacy 1.12.2 release.
   https://www.curseforge.com/minecraft/mc-mods/netherex

25. Biomes O' Plenty
   An expansive Overworld to explore between portals. Choose the Biomes O' Plenty world type when making the world.
   https://www.curseforge.com/minecraft/mc-mods/biomes-o-plenty

MAGIC
=====

26. Electroblob's Wizardry
   The primary spellcasting system: discover spells, upgrade wands and fight wizards. Combat and exploration are central.
   https://www.curseforge.com/minecraft/mc-mods/electroblobs-wizardry

27. Ancient Spellcraft
   More Wizardry spells, artifacts, classes and structures. Match its file requirements to your Wizardry version.
   https://www.curseforge.com/minecraft/mc-mods/ancient-spellcraft

28. Thaumcraft 6
   Research, casting foci, alchemy, magical equipment and dangerous experiments. Use 6.1.BETA26 for 1.12.2; its research/crafting is a longer optional progression path.
   https://www.curseforge.com/minecraft/mc-mods/thaumcraft

29. Thaumic Augmentation
   Expands Thaumcraft's equipment and eldritch adventure content. Requires Thaumcraft.
   https://www.curseforge.com/minecraft/mc-mods/thaumic-augmentation

30. Astral Sorcery
   Constellation magic, rituals, personal powers and magical exploration.
   https://www.curseforge.com/minecraft/mc-mods/astral-sorcery

31. Bewitchment (Legacy)
   Witchcraft, occult rituals and supernatural content. Use the explicitly named Legacy project.
   https://www.curseforge.com/minecraft/mc-mods/bewitchment-legacy

32. Roots 3
   Nature spells, staffs and rituals. Select Roots-1.12.2-3.1.9.2; the project now displays the name Roots 4.
   https://www.curseforge.com/minecraft/mc-mods/roots

33. Extra Alchemy
   Extra potion effects for more magical experimentation. Use the old Forge 1.12.2 release.
   https://www.curseforge.com/minecraft/mc-mods/extra-alchemy

STRUCTURES, TREASURE, ORES AND WEAPONS
======================================

34. Roguelike Dungeons
   Large underground dungeon networks packed with rooms, enemies and loot. Use 1.12.2-1.8.0.
   https://www.curseforge.com/minecraft/mc-mods/roguelike-dungeons

35. AtomicStryker's Battle Towers
   Loot towers with dangerous golem guardians and collapsing finales. Choose AtomicStryker's original project.
   https://www.curseforge.com/minecraft/mc-mods/atomicstrykers-battle-towers

36. Recurrent Complex
   A much busier world full of generated structures and exploration targets.
   https://www.curseforge.com/minecraft/mc-mods/recurrent-complex

37. Treasure2
   Rare treasure chests, locks and matching keys for a dedicated treasure hunt.
   https://www.curseforge.com/minecraft/mc-mods/treasure2

38. Spartan Weaponry
   Spears, halberds, throwing weapons and a much broader melee/ranged arsenal.
   https://www.curseforge.com/minecraft/mc-mods/spartan-weaponry

39. SimpleOres
   Additional ores and equipment such as mythril, adamantium and onyx.
   https://www.curseforge.com/minecraft/mc-mods/simpleores

40. Metallurgy 4: Reforged
   Many fantasy metals, alloys and equipment effects. Some alloy processing exists; it is not intended as the pack's progression gate.
   https://www.curseforge.com/minecraft/mc-mods/metallurgy-4-reforged

SUPPORT MODS
============

- Just Enough Items (JEI): Recipe lookup.
  https://www.curseforge.com/minecraft/mc-mods/jei
- JourneyMap: Map and waypoints.
  https://www.curseforge.com/minecraft/mc-mods/journeymap
- Controlling: Find and resolve conflicting keybinds.
  https://www.curseforge.com/minecraft/mc-mods/controlling
- Mouse Tweaks: Faster inventory handling.
  https://www.curseforge.com/minecraft/mc-mods/mouse-tweaks
- Waystones: Convenient return travel between discoveries.
  https://www.curseforge.com/minecraft/mc-mods/waystones
- Comforts: Sleeping bags for exploration.
  https://www.curseforge.com/minecraft/mc-mods/comforts
- Iron Chests: Room for the absurd amount of loot.
  https://www.curseforge.com/minecraft/mc-mods/iron-chests
- Quark: Small exploration/building conveniences; features are configurable.
  https://www.curseforge.com/minecraft/mc-mods/quark
- FoamFix: Optional memory/performance optimization. Add after the content baseline launches.
  https://www.curseforge.com/minecraft/mc-mods/foamfix-optimization-mod

DEPENDENCY CHECKLIST
====================
Install each library only once. All must be appropriate for Forge 1.12.2.
Use the individual FILE's requirements, not a project's modern main-page
dependency list: those can describe a completely different Minecraft release.
A launcher can resolve declared required dependencies, but old metadata is
sometimes incomplete; Forge's missing-dependency report must also be checked.

- iChunUtil: Hats, Morph and Portal Gun.
  https://www.curseforge.com/minecraft/mc-mods/ichunutil
- LLibrary 1.7.20: legacy Ice and Fire, Mowzie's Mobs and Fossils.
  https://www.curseforge.com/minecraft/mc-mods/llibrary
- Baubles: Thaumcraft, Bewitchment Legacy and Ancient Spellcraft.
  https://www.curseforge.com/minecraft/mc-mods/baubles
- Patchouli: Bewitchment Legacy and the guidebook ecosystem used by Roots 3.
  https://www.curseforge.com/minecraft/mc-mods/patchouli
- WizardryUtils: required by current Ancient Spellcraft releases.
  https://www.curseforge.com/minecraft/mc-mods/wizardryutils
- MixinBooter: required by current Ancient Spellcraft releases.
  https://www.curseforge.com/minecraft/mc-mods/mixin-booter
- IvToolkit: Recurrent Complex.
  https://www.curseforge.com/minecraft/mc-mods/ivtoolkit
- GottschCore: Treasure2.
  https://www.curseforge.com/minecraft/mc-mods/gottschcore
- LibraryEx: legacy NetherEx.
  https://www.curseforge.com/minecraft/mc-mods/libraryex
- SimpleCore API: legacy SimpleOres.
  https://www.curseforge.com/minecraft/mc-mods/simplecore-api
- AutoRegLib: Quark for 1.12.2.
  https://www.curseforge.com/minecraft/mc-mods/autoreglib
- MysticalLib and Mystical World: include with the Roots 3 ecosystem;
  check the selected legacy files' requirements because project metadata
  currently describes Roots 4 and does not reliably document the old branch.
  https://www.curseforge.com/minecraft/mc-mods/mysticallib
  https://www.curseforge.com/minecraft/mc-mods/mystical-world
- Shadowfacts' Forgelin: check the selected Metallurgy 4: Reforged file
  for its Kotlin runtime requirement; keep this on the legacy dependency checklist.
  https://www.curseforge.com/minecraft/mc-mods/shadowfacts-forgelin
- Mixin 0.7-0.8 Compatibility: conditional compatibility helper for
  Spartan Weaponry's legacy Mixin and newer Mixin-using mods.
  Its author recommends it for this version conflict; test the combination.
  https://www.curseforge.com/minecraft/mc-mods/mixin-0-7-0-8-compatibility

Do not install modern Curios, Citadel, Balm, GlitchCore, Zeta or Fabric API
just because a current project page mentions them. These are not blanket
dependencies for the selected legacy versions. Do not install all optional
relations automatically. Ancient Spellcraft also requires Electroblob's
Wizardry itself; Thaumic Augmentation also requires Thaumcraft itself.

SUGGESTED SETTINGS: CHAOTIC, BUT WORTH LIVING IN
=============================================
These are proposed settings to apply after generating configs, not changes
already made to a Minecraft installation.

1. Keep hat collection survival-based and Morph acquisition tied to kills.
   Test several ordinary and modded mobs. Blacklist problematic boss forms
   rather than assuming every complex animated mob works perfectly.
2. Enable flight from eligible Morph forms if you want maximum freedom,
   where the selected version's config permits it.
3. Leave powerful loot powerful. Avoid global expert-mode recipe changes.
4. Keep dragon encounters frequent enough to find. Reduce dragon terrain
   destruction around settled areas using the mod's available config.
5. Keep Chance Cubes dangerous, but make an opening arena away from home.
6. Start Lycanites events disabled while testing; enable them after checking
   their frequency and block-damage behavior. Its normal monsters remain.
7. Do not multiply every mod's spawn rate. AoA, DivineRPG, Lycanites and Gaia
   already compete for the world. Tune to get variety without a spawn siege.
8. Keep multiple dungeon mods, but reduce density if structures overlap or
   exploration causes long freezes. Start with default generation settings.
9. Check dimension-ID collisions before creating your permanent world.
   Assign unique IDs in affected configs if Forge reports collisions.
   Do not change dimension IDs in an established save.
10. Biomes O' Plenty can change where other mods' mobs/structures appear.
    Check that important dragon nests and progression structures generate.
11. Thaumcraft research, Astral progression and Betweenlands survival rules
    are deliberate side adventures. None should gate the rest of the pack.
12. Use keepInventory if lost gear is frustrating; it is optional.
13. Keep a fresh-world backup before changing world-generation mods.
14. Allocate roughly 6-8 GB initially if the computer has enough spare RAM;
    adjust from actual usage. This is a starting estimate, not a benchmark.
    Do not allocate nearly all system RAM. Start without shaders.

INSTALL ORDER / ACCEPTANCE CHECK
================================
1. Make a separate Minecraft 1.12.2 Forge profile with 64-bit Java 8.
2. Add content in the four groups above, accepting their matching required
   dependencies. Launch between groups to isolate errors.
3. Add support mods. Add FoamFix after the baseline works.
4. Resolve any missing library or version messages before making a world.
5. Generate configs, apply the desired settings and create a NEW test world.
6. Confirm: hats appear and unlock; kills unlock morphs; dragons spawn and
   can be ridden; representative spells cast; loot and structures generate.
7. Enter and leave every installed dimension, then save, quit and reload.
8. Test morphs of the most unusual creatures individually.
9. If multiplayer is wanted, repeat on a Forge server with matching content
   mods/configs. Leave client-only UI mods off the dedicated server.
10. Once working, export the profile with the exact file versions and configs.
    That export, not this untested blueprint, becomes the reproducible pack.

BERK-SPECIFIC ALTERNATIVE -- SEPARATE PROFILE ONLY
=================================================
If Toothless/HTTYD species matter more than the original Hats and Morph:
- Minecraft Java 1.18.2 + Forge + Java 17.
- Isle of Berk plus its required matching Forge GeckoLib dependency.
- Official author listing: https://modrinth.com/mod/isle-of-berk
- Select the exact GeckoLib version required by the chosen Berk file.
- Do NOT copy the 1.12.2 list or its libraries into this profile.
- Original iChun Hats and Morph do not have 1.18.2 releases on their
  project pages. This alternative therefore sacrifices those exact mods.
This is an alternative dragon foundation, not a second complete pack.

CROSSOVER EXPECTATIONS
======================
Heroic Armory provides Kingdom Hearts, Adventure Time, Zelda and other
recognizable weapon references. These are fan-made additions, not official
Disney collaborations or a promise that Disney characters/worlds are present.
The user's 'Dragons of Berk' is interpreted here as Isle of Berk; if it refers
to a different specific project, its exact release may change the version choice.

Do not add original OreSpawn from another Minecraft version to this pack.
The huge AoA/DivineRPG roster supplies the overstuffed adventure role here.

RESEARCH / LIMITS
=================
The links alongside entries are the authors' distribution or source pages.
Important version checks include:
https://www.curseforge.com/minecraft/mc-mods/hats
https://www.curseforge.com/minecraft/mc-mods/morph
https://www.curseforge.com/minecraft/mc-mods/ice-and-fire-dragons/files/all?version=1.12.2
https://www.curseforge.com/minecraft/mc-mods/official-divinerpg/files/all?version=1.12.2
https://www.curseforge.com/minecraft/mc-mods/aether/files/all?version=1.12.2
https://www.curseforge.com/minecraft/mc-mods/ancient-spellcraft/relations/dependencies
https://www.curseforge.com/minecraft/mc-mods/bewitchment-legacy/relations/dependencies
https://modrinth.com/mod/isle-of-berk

Not every jar version or transitive dependency has been locked and tested.
This checklist includes the known legacy support stack and conditional
helpers; it is not a certification that arbitrary latest files will work.
```
