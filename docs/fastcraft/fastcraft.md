# fastCraft.txt
FastCraft is a parameterized script in the CML family that, given a recipe, crafts any requested amount of any item in a crafting table.  It is robust and will log when errors occur, e.g. when not enough materials were provided.

FastCraft is intended to be used by other scripts, particularly those in the CML library.  Unlike similar solutions by e.g. Sanwi, this script uses the "halven" right click operation users tend to naturally use when crafting items.

## Installation
FastCraft should be placed in the ".minecraft/liteconfig/common/macros/" folder, along with any required scripts as specified below.  To bind to a key, consult a tutorial on basic macro usage.

## Required Scripts
Properly running CML_fastCraft.txt will also require **openCraftingTable.txt**, **closeCraftingTable.txt**, and **LOOP_INPUTS.txt**.  These are, respectively, scripts that protect against lag situations when opening crafting tables, and a utility to loop through inputs specified.

These additional scripts are provided for convenience. Alternatively, [installing CML itself](https://github.com/poteat/CML) will provide these needed library scripts.

## Recipe and Parameter Syntax
To invoke FastCraft from another script, the following syntax is used:

    // Craft 4 pickaxes fast
    UNSET(@fastcraft)
    EXEC("fastCraft.txt", "fastCraft", "4 cobblestone cobblestone cobblestone N stick N N stick N")
    DO
        WAIT(1t)
    UNTIL(@fastcraft)
This calling syntax is common to CML programs: It emulates a synchronous (linear) call to a function, by specifying a global variable which represents if the function has halted or not.

What is notable about this function is the string parameter which represents the **amount to create** and **block recipe** respectively.  The recipe is indexed as thus:

![Crafting grid with numbered indices 1-9 overlaid](https://i.imgur.com/y4TE0xn.png)

In this way, a recipe for 4 *fishing rods* would be the following, such that "N" denotes an empty slot:

`4 N N stick N stick string stick N string`

To craft an unlimited amount of a recipe, bounded by the amount of resources available, specify "0" (zero) as the first parameter.  The amount of items specified controls the amount of product crafted, i.e. `4 plank N N plank` results in 4 sticks, rather than eight.


## Crafting Speed Option
By default, the "crafting speed" on the script is set to 5 ticks.  This means a "slot click operation" is performed every 5/20 of a second.  This is a conservative number and should work fine in most environments.

However, the speed may be easily changed to run faster or slower depending on user needs.  At the top of the file, `#wait_ticks = 5` may be defined as any other natural number (>0).

## Video Example
For a visual demonstration of the operation of FastCraft, see the following video:

> https://www.youtube.com/foobar.video

## Code Graph

The following is a flowchart view of FastCraft's behavior.  Because of the focus on efficiency and the fact that there's many cases to handle, the logic is nested.  However, I've done my best to describe the code behavior in an intuitive way:

### fastCraft.txt
![enter image description here](https://raw.githubusercontent.com/poteat/CML/master/docs/fastcraft/fastcraft.mmd.png)
### fastCraft_placeCraftingMaterials.txt
![enter image description here](https://raw.githubusercontent.com/poteat/CML/master/docs/fastcraft/fastcraft_placeCraftingMaterials.mmd.png)

## Contribution
If you find a bug or issue, please post it on [the repository](https://github.com/poteat/CML).  As well, if you wish to contribute, feel free to fork the project or submit a pull request.  This code and documentation is licensed under the MIT License.