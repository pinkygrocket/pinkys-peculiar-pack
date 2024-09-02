/* Imports */

import crafttweaker.api.recipe.IRecipeManager;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.fluid.IFluidStack;
import crafttweaker.api.resource.ResourceLocation;
import crafttweaker.api.text.Component;

import mods.create.FillingManager;
import mods.createtweaker.FillingRecipe;
import mods.create.IProcessingRecipeManager;

/* Objects */

public class spoutRecipeExtended {
	
	public var name as string : get, set;
	public var inputItem as IItemStack : get, set;
	public var inputFluid as IFluidStack : get, set;
	public var output as IItemStack : get, set;
	
	public this(setInput as IItemStack, setFluid as IFluidStack, setOutput as IItemStack) as spoutItemExtended {
		
		this.inputItem = setInput;
		this.inputFluid = setFluid;
		this.output = setOutput;
		
	}
	
	public registerRecipe() as void {
		
		this.name = this.output.registryName.namespace + "_" + this.output.registryName.path;
		<recipetype:create:filling>.addRecipe(this.name, this.output, this.inputItem, this.inputFluid);
		return;
		
	}
	
}

/* Variables */

val SPOUT_ITEMS as spoutRecipeExtended[] = [
	new spoutRecipeExtended(<item:aether:golden_dart>, <fluid:deep_aether:poison_fluid> * 125, <item:aether:poison_dart>),
	new spoutRecipeExtended(<item:minecraft:iron_ingot>, <fluid:kubejs:fiery_blood> * 100, <item:twilightforest:fiery_ingot>),
	new spoutRecipeExtended(<item:minecraft:iron_block>, <fluid:kubejs:fiery_blood> * 900, <item:twilightforest:fiery_block>),
	new spoutRecipeExtended(<item:minecraft:iron_helmet>, <fluid:kubejs:fiery_blood> * 500, <item:twilightforest:fiery_helmet>),
	new spoutRecipeExtended(<item:minecraft:iron_chestplate>, <fluid:kubejs:fiery_blood> * 800, <item:twilightforest:fiery_chestplate>),
	new spoutRecipeExtended(<item:minecraft:iron_leggings>, <fluid:kubejs:fiery_blood> * 700, <item:twilightforest:fiery_leggings>),
	new spoutRecipeExtended(<item:minecraft:iron_boots>, <fluid:kubejs:fiery_blood> * 400, <item:twilightforest:fiery_boots>),
	new spoutRecipeExtended(<item:create:iron_sheet>, <fluid:kubejs:fiery_blood> * 100, <item:cogsofcarminite:fiery_sheet>),
	new spoutRecipeExtended(<item:farmersdelight:iron_knife>, <fluid:kubejs:fiery_blood> * 100,  <item:delightful:fiery_knife>),
	new spoutRecipeExtended(<item:aether:iron_gloves>, <fluid:kubejs:fiery_blood> * 200, <item:umbral_skies:fiery_gloves>),
	new spoutRecipeExtended(<item:aether:skyroot_bucket>, <fluid:deep_aether:poison_fluid> * 1000, <item:aether:skyroot_poison_bucket>)
];

for recipe in SPOUT_ITEMS {
	recipe.registerRecipe();
}