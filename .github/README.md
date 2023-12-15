![banner](https://cdn.discordapp.com/attachments/740999436876120127/1168057693907460136/banner2.png?ex=6550617f&is=653dec7f&hm=94411fcc08408464d7c1276c97f7246c965550efa86291ccef073e796d8691f6&)
Trial of Strength (ToS) is an AzerothCore module that adds a test of strength arena to test players skills in combat.

## Features
- [x] A Trial mode
  - [x] Rewards at the end of every wave.
  - [x] Curses and Affixes to add difficulty and increase rewards.
  - [ ] Proper reward scaling for curses
- [x] An Endless mode of increasing difficulty
  - [ ] Better rewards at the end based on how many waves you survived
  - [ ] Curses and Affixes to add difficulty and increase rewards.
  - [ ] Curses stacking for Endless mode for MOAR rewards
- [ ] A key mode where Trial rewards a key you can use for Endless Mode
- [ ] Endless mode skip x waves feature ( with a cost )
- [ ] Better reward implementation and calculation
- [ ] Mythic style affixes
- [ ] MORE
- [x] Made for group play.

## Setup
1. Clone the module into your AzerothCore modules directory.
2. Enable the module.
3. Spawn the arena entry (entry: 441250) NPC anywhere you want.

## Note
This module is a work in progress, so expect bugs and crashes as the module is not heavily tested.  
Based on Trial Of Strength by [AnchyDev](https://github.com/AnchyDev).

## Additional info
If you want to change the mobs or waves:
1. Modify the `tos_wave_groups` table with your created creatures.
2. Setup the `tos_reward_template` with your rewards for each wave.
3. Create wave entries in `tos_wave_template` which links to your `tos_wave_groups` and `tos_reward_template` entries.

You can also create new creature template using  one of the new [CombatAI types](https://gist.github.com/AnchyDev/7d8847fd696e42c94efcfdc5baf88e7f) for each of the creatures you create.
