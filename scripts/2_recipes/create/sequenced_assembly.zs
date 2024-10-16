/* Imports */

import crafttweaker.api.item.IItemStack;

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.IRecipeManager;

import mods.create.SequencedAssemblyManager;
import mods.create.DeployerApplicationManager;

import mods.createtweaker.PressingRecipe;
import mods.createtweaker.IAssemblyRecipe;
import mods.createtweaker.DeployerApplicationRecipe;
import mods.createtweaker.SequencedAssemblyRecipeBuilder;

/* Objects */

/* Variables */

/* Main script */

// Intergration - Add custom recipe for the Formidibomb

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("seq_formidibomb")
 .transitionTo(<item:ppp_packtweaks:incomplete_formidibomb>)
 .require(<item:witherstormmod:super_tnt>)
 .addOutput(<item:witherstormmod:formidibomb>, 900.0)
 .addOutput(<item:witherstormmod:command_block_book>, 80.0)
 .addOutput(<item:create:precision_mechanism>, 3.75)
 .addOutput(<item:cogsofcarminite:knightmetal_sheet>, 3.75)
 .addOutput(<item:create:golden_sheet>, 3.75)
 .addOutput(<item:minecraft:tnt>, 3.75)
 .addOutput(<item:minecraft:redstone>, 1.0)
 .addOutput(<item:minecraft:blaze_powder>, 1.0)
 .addOutput(<item:minecraft:gunpowder>, 1.0)
 .addOutput(<item:minecraft:sand>, 1.0)
 .addOutput(<item:minecraft:gold_nugget>, 1.0)
 .addOutput(<item:create:andesite_alloy>, 1.0)
 .loops(4)
 .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:gunpowder>))
 .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:blaze_powder>))
 .addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(50))
 .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:cogsofcarminite:knightmetal_sheet>))
 .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:redstone>))
 .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:precision_mechanism>)));
 