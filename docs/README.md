# CML: Common Macro Library

**Note:** See the [Wiki] for a set of tutorial and more information.

### CML is:

1.  A **library** of macromod scripts that perform basic functions robustly.
2.  A **hosting station** for me to write scripts when people ask for them.

Some scripts are intended to be used independently, while others are simply **building blocks**. These building blocks allow for progressively more sophisticated behavior, until we have a highly nested structure that gives rise to **complex and robust automation**.

As well, CML includes some other utilities that are external to macromod itself, but still potentially useful, such as **automatic code generators**, **compilers**, and **auto-restart scripts**.

## Installation

The \*.txt scripts should be placed in **%appdata%\.minecraft\liteconfig\common\macros**

After that, the scripts may be bounded to either keys or events using the macromod GUI. For specifics, consult on of the resources of the [Introductory Resources](https://github.com/poteat/CML/wiki/Introductory-Macromod-Learning-Resources) page.

## CML Standard Library

These scripts are intended to be building blocks for other scripts, modular functions that make complex behavior easier to manage.

| Script                  | Description                                                                                                              |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| CML_centerSelf          | Novel script that centers a bot exactly on the left/right center of the current block by simulating floating point math. |
| CML_close               | Closes an openable block (e.g. chest, furace...) robustly.                                                               |
| CML_countInventoryItems | Given a set of items, returns the total number of each item in the inventory and hotbar as an array.                     |
| CML_eatFood             | If hunger is below a threshold, eat any food on hand based on a priority list.                                           |
| CML_fightMobs           | Scan for nearby mobs and fight them using a bow or a sword depending on what is available.                               |
| CML_floor               | Mathematical floor function that takes in standard-formatted float values.                                               |
| CML_isAxeBlock          | Returns whether &block is optimally mined with an axe or not.                                                            |
| CML_isPickBlock         | Returns whether &block is optimally mined with an pick or not.                                                           |
| CML_isShovelBlock       | Returns whether &block is optimally mined with an shovel or not.                                                         |
| CML_multiply            | Multiplies two standard-formmated float values into a new float value.                                                   |
| CML_onChat              | Sets a global flag on snitch events less than a specified distance away, and logs all snitch events to a file.           |
| CML_onJoinGame          | Handler than runs pre-specified scripts on game join, unless manual user control is detected within 10 seconds.          |
| CML_open                | Opens an "openable" block (e.g. chest), waiting until a GUI is detected before returning.                                |
| CML_pickBestTool        | Given &block, picks optimal tool with durability above #min_durability_limit.                                            |
| CML_refineCrosshair     | If currently looking at a mob, will attempt to look at the center of the mob via a local search algorithm.               |
| CML_retreat             | Turns around and sprint-jumps for #time ticks, then turns back in the original direction. Used to avoid danger.          |
| CML_scanForMobs         | Performs a coarse scan for any mobs nearby, returning yaw and pitch if detected.                                         |
| CML_snapYaw             | Snaps yaw towards the nearest cardinal direction.                                                                        |
| CML_snapYawDiagonal     | Snaps yaw towards the nearest of the eight compass directions.                                                           |
| CML_sqrt                | Given an integer, computes real-valued square root to three decimal places.                                              |

## Scripts

These are example scripts that showcase the functionality of CML, and how it can be used to write robust, sophisticated scripts.

| Script              | Description                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| addToCoordinateList | Meta-automation script for recording block locations as well as yaw/pitch combinations, which are later compiled into a large, macromod-accessible array (i.e. a **coordinate list**).                                                                                                                                                                                                        |
| craftLadders        | A small script that will **craft as many ladders as possible**. Should be run while looking at a crafting table.                                                                                                                                                                                                                                                                              |
| digBot              | An [infamous digging script](https://www.youtube.com/watch?v=mHzHMrgVhH0) that mines a 7x7 slice ahead while walking and using appropriate tools. Will also **place blocks underneath** in the case of air gaps (i.e. holes, chasms, etc).                                                                                                                                                    |
| fastCraft           | **Optimally efficient crafting method** on servers with anti-cheat, using binary division of item stacks to minimize the number of inventory movements needed. The user supplies the recipe, so in general will handle modded recipes as well.                                                                                                                                                |
| iceRun              | Designed to run optimally fast on iceroads, but usually needs to be tuned on servers to prevent rubberbanding. Will read contextual environment to **automatically turn** at any forks in the iceroad, including diagonal ones.                                                                                                                                                               |
| itemLogger          | Reads chests (specified by a coordinate file) and records their contents to a file.                                                                                                                                                                                                                                                                                                           |
| kalingradBirch      | A nice example of a **robust tree-botting** script that only uses coordinates rather than GETID. Showcases using "**modulo conditions**" to represent actions instead of floor blocks.                                                                                                                                                                                                        |
| melonBot            | A simple example of a robust melon-farming bot that is designed via the **floor-reading approach**. The bot inspects blocks in the floor and bases its next action on their type, effectively encoding part of the program into the structure of the farm itself.                                                                                                                             |
| overwriteLava       | Very useful tool that, if enabled, will **automatically overwrite lava** by placing cobblestone, while you mine, without getting in the way.                                                                                                                                                                                                                                                  |  |
| zombieSlayer        | A state-of-the-art script to remotely and automatically administrate a zombie grinding station. Will **slay zombies** using looting swords, **categorize loot** into three categories, and place rotten flesh in up to 9 double chests. If combined with logsend, will post events to **Discord**, and post performance logs to **Google Sheets** to facilitate an **interactive dashboard**. |

## Utilities

| Utility              | Description                                                                                                                                                                                                                                           |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| coordinate_parser    | A C++ program that compiles a coordinate list (from addToCoordinateList) to a macromod data script that is used to specify **bulk relative coordinates** and **yaw/pitch vectors** that are independent with respect to the bot's cardinal direction. |
| remote_hosting_tools | Various programs, batch files, and instructions on how to create persistent, **graphics-enabled sessions** on either other user accounts, or a remote Windows machine.                                                                                |
| restart_mc           | An **autohotkey** script that will restart the Minecraft client and autojoin a specified server.                                                                                                                                                      |
| logsend              | A Discord / Google Sheets integration program in NodeJS that watches files and broadcasts them depending on configuration                                                                                                                             |
| macrocompile         | A NodeJS program that inlines scripts to remove nested dependencies, with optional obfuscation features                                                                                                                                               |
