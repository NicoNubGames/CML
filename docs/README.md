# CML: Common Macro Library

### CML is:

1.  A **library** of macromod scripts that perform basic functions robustly.
2.  A **hosting station** for me to write scripts when people ask for them.

Some scripts are intended to be used independently, while others are simply **building blocks**. These building blocks allow for progressively more sophisticated behavior, until we have a highly nested structure that gives rise to **complex and robust automation**.

As well, CML includes some other utilities that are external to macromod itself, but still potentially useful.

## Installation

The \*.txt scripts should be placed in **%appdata%\.minecraft\liteconfig\common\macros**

After that, the scripts may be bounded to either keys or events using the macromod GUI. For specifics, please the [set of tutorials](http://mkb.gorlem.ml/tutorial).

## Curated Scripts

| Script              | Description                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| addToCoordinateList | Meta-automation script for recording block locations as well as yaw/pitch combinations, which are later compiled into a large, macromod-accessible array (i.e. a **coordinate list**).                                                                                                                                                                                                        |
| CML_centerSelf      | Novel script that centers a bot exactly on the left/right center of the current block by simulating floating point math.                                                                                                                                                                                                                                                                      |
| CML_close           | Closes an openable block (e.g. chest, furace...) robustly.                                                                                                                                                                                                                                                                                                                                    |
| CML_onChat          | Notifies global state when a snitch notification is detected, and logs the event to a file. When combined with **logsend**, this is effectively a Discord snitchbot.                                                                                                                                                                                                                          |
| CML_onJoinGame      | **Automatically starts** a user-specified script if no human input is detected for 10 seconds.                                                                                                                                                                                                                                                                                                |
| CML_open            | Opens an "openable" block (e.g. chest). Will check if the block currently seen is opennable or not before attempting, and will wait until a GUI is open before returning.                                                                                                                                                                                                                     |
| craftLadders        | A small script that will **craft as many ladders as possible**. Should be run while looking at a crafting table.                                                                                                                                                                                                                                                                              |
| digBot              | An [infamous digging script](https://www.youtube.com/watch?v=mHzHMrgVhH0) that mines a 7x7 slice ahead while walking and using appropriate tools. Will also **place blocks underneath** in the case of air gaps (i.e. holes, chasms, etc).                                                                                                                                                    |
| eatFood             | Eat any food from a list, if hunger is below a certain threshold.                                                                                                                                                                                                                                                                                                                             |
| fastCraft           | **Optimally efficient crafting method** on servers with anti-cheat, using binary division of item stacks to minimize the number of inventory movements needed. The user supplies the recipe, so in general will handle modded recipes as well.                                                                                                                                                |
| iceRun              | Designed to run optimally fast on iceroads, but usually needs to be tuned on servers to prevent rubberbanding. Will read contextual environment to **automatically turn** at any forks in the iceroad, including diagonal ones.                                                                                                                                                               |
| itemLogger          | Reads chests (specified by a coordinate file) and records their contents to a file.                                                                                                                                                                                                                                                                                                           |
| kalingradBirch      | A nice example of a **robust tree-botting** script that only uses coordinates rather than GETID. Showcases using "**modulo conditions**" to represent actions instead of floor blocks.                                                                                                                                                                                                        |
| melonBot            | A simple example of a robust melon-farming bot that is designed via the **floor-reading approach**. The bot inspects blocks in the floor and bases its next action on their type, effectively encoding part of the program into the structure of the farm itself.                                                                                                                             |
| overwriteLava       | Very useful tool that, if enabled, will **automatically overwrite lava** by placing cobblestone, while you mine, without getting in the way.                                                                                                                                                                                                                                                  |
| CML_snapYaw         | Snaps yaw to the closest cardinal.                                                                                                                                                                                                                                                                                                                                                            |
| CML_snapYawDiagonal | Snaps yaw to the closest of the eight compass directions.                                                                                                                                                                                                                                                                                                                                     |
| zombieSlayer        | A state-of-the-art script to remotely and automatically administrate a zombie grinding station. Will **slay zombies** using looting swords, **categorize loot** into three categories, and place rotten flesh in up to 9 double chests. If combined with logsend, will post events to **Discord**, and post performance logs to **Google Sheets** to facilitate an **interactive dashboard**. |

## Utilities

| Utility              | Description                                                                                                                                                                                                                                           |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| coordinate_parser    | A C++ program that compiles a coordinate list (from addToCoordinateList) to a macromod data script that is used to specify **bulk relative coordinates** and **yaw/pitch vectors** that are independent with respect to the bot's cardinal direction. |
| remote_hosting_tools | Various programs, batch files, and instructions on how to create persistent, **graphics-enabled sessions** on either other user accounts, or a remote Windows machine.                                                                                |
| restart_mc           | An **autohotkey** script that will restart the Minecraft client and autojoin a specified server.                                                                                                                                                      |

## Q & A

**Why are some scripts marked with CML\_ and others aren't?**

The "CML\_" marker is only afforded to the scripts that are modular and useful enough to get library status. Especially scripts which are meant to be building blocks.

## Deprecation Notice

To clean this repository up, a large number of scripts were moved into the "deprecated" folder under macros. Many of these were 1-off, or designed with an out-dated philosophy that doesn't mesh well with the current generation of scripts.

They are still available as I hate to delete anything, as there is still a dearth of good publicly-available macromod code. However, they might be difficult to get working.
