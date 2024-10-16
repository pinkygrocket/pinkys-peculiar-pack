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

import crafttweaker.util.NameUtil;

/* Objects */

public class spoutRecipeExtended {
	
	public var name as string : get, set;
	public var inputItem as IItemStack : get, set;
	public var inputFluid as IFluidStack : get, set;
	public var output as IItemStack : get, set;
	public var replace as bool : get, set;
	
	public this(setInput as IItemStack, setFluid as IFluidStack, setOutput as IItemStack) as spoutItemExtended {
		
		this.inputItem = setInput;
		this.inputFluid = setFluid;
		this.output = setOutput;
		
	}
	
	public registerRecipe() as void {
		
		if(this.replace) {
			
			<recipetype:create:filling>.remove(this.output);
			
		}
		
		this.name = NameUtil.fixing("ct_spout_" + this.output.registryName);
		<recipetype:create:filling>.addRecipe(this.name, this.output, this.inputItem, this.inputFluid);
		return;
		
	}
	
}

/* Variables */

val SPOUT_ITEMS as spoutRecipeExtended[] = [
	
	// Intergration - Make Poison Darts craftable
	
	new spoutRecipeExtended(<item:aether:golden_dart>, <fluid:deep_aether:poison_fluid> * 125, <item:aether:poison_dart>),
	
	// Intergration
	
	new spoutRecipeExtended(<item:minecraft:iron_ingot>, <fluid:ppp_packtweaks:fiery_blood> * 100, <item:twilightforest:fiery_ingot>),
	new spoutRecipeExtended(<item:minecraft:iron_block>, <fluid:ppp_packtweaks:fiery_blood> * 900, <item:twilightforest:fiery_block>),
	new spoutRecipeExtended(<item:minecraft:iron_helmet>, <fluid:ppp_packtweaks:fiery_blood> * 500, <item:twilightforest:fiery_helmet>),
	new spoutRecipeExtended(<item:minecraft:iron_chestplate>, <fluid:ppp_packtweaks:fiery_blood> * 800, <item:twilightforest:fiery_chestplate>),
	new spoutRecipeExtended(<item:minecraft:iron_leggings>, <fluid:ppp_packtweaks:fiery_blood> * 700, <item:twilightforest:fiery_leggings>),
	new spoutRecipeExtended(<item:minecraft:iron_boots>, <fluid:ppp_packtweaks:fiery_blood> * 400, <item:twilightforest:fiery_boots>),
	new spoutRecipeExtended(<item:create:iron_sheet>, <fluid:ppp_packtweaks:fiery_blood> * 100, <item:cogsofcarminite:fiery_sheet>),
	new spoutRecipeExtended(<item:farmersdelight:iron_knife>, <fluid:ppp_packtweaks:fiery_blood> * 100,  <item:delightful:fiery_knife>),
	new spoutRecipeExtended(<item:aether:iron_gloves>, <fluid:ppp_packtweaks:fiery_blood> * 200, <item:umbral_skies:fiery_gloves>),
	
	// Integration
	
	new spoutRecipeExtended(<item:aether:skyroot_bucket>, <fluid:deep_aether:poison_fluid> * 1000, <item:aether:skyroot_poison_bucket>),
	
	// Moving a Create DD recipe	
	
	new spoutRecipeExtended(<item:minecraft:netherrack>, <fluid:minecraft:lava> * 100, <item:minecraft:magma_block>),
	
	// Intergration
	
	new spoutRecipeExtended(<item:aether:aether_dirt>, <fluid:minecraft:lava> * 100, <item:aether:aether_grass_block>)
];

// Remove Potion Bundles from Spout as it results in exploits

val SPOUT_ITEMS_TO_REMOVE as IItemStack[] = [
	<item:potionbundles:potion_bundle>,
	<item:potionbundles:splash_potion_bundle>,
	<item:potionbundles:lingering_potion_bundle>
];

/* Main script */

for item in SPOUT_ITEMS_TO_REMOVE {
	<recipetype:create:filling>.remove(item);
}

for recipe in SPOUT_ITEMS {
	recipe.registerRecipe();
}