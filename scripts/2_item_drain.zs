/* Imports */

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.fluid.IFluidStack;
import crafttweaker.api.resource.ResourceLocation;

import mods.create.EmptyingManager;
import mods.createtweaker.EmptyingRecipe;

/* Variables */

val AETHER_BUCKETS as IFluidStack[IItemStack] = {
	<item:aether:skyroot_water_bucket> : <fluid:minecraft:water>,
	<item:aether:skyroot_milk_bucket> : <fluid:minecraft:milk>,
	<item:aether:skyroot_poison_bucket> : <fluid:deep_aether:poison_fluid>
};

/* Main script*/

for filledBucketItem, outputFluid in AETHER_BUCKETS {
	<recipetype:create:emptying>.removeByInput(filledBucketItem);
	<recipetype:create:emptying>.addRecipe("extract_" + outputFluid.registryName.path + "_skyroot", <item:aether:skyroot_bucket>, outputFluid * 1000, filledBucketItem);
}

<recipetype:create:emptying>.addRecipe("extract_fiery_blood", <item:minecraft:glass_bottle>, <fluid:ppp_packtweaks:fiery_blood> * 100, <tag:items:twilightforest:fiery_vial>);