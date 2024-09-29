/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

/* Objects */

public class fletchingTableRecipeExtended {
	
	public var name as string : get, set;
	public var input as IIngredient[] : get, set;
	public var output as IItemStack : get, set;
	public var replace as bool : get, set;
	
	public this(setOutput as IItemStack, setInput as IIngredient[], setReplace as bool) {
		
		this.output = setOutput;
		this.input = setInput;
		this.replace = setReplace;
		
	}
	
	public registerRecipe() as void {
		
		if(this.replace) {
			
			recipes.remove(this.output);
			
		}
		
		this.name = "crafttweaker_fletching_" + this.output.registryName.namespace + "_" + this.output.registryName.path;
		val outputData as IData = this.output as IData;
		
		<recipetype:apotheosis:fletching>.addJsonRecipe(this.name, {
			"type": "apotheosis:fletching", 
			"ingredients" : this.input as IData,
			"result": outputData
		});
		
	}
	
}

/* Variables */

// Note here that Supplementaries' Rope Arrows are left out, as they use a "repair" esc-function and I want to avoid weirdness

val fletchingRecipes as fletchingTableRecipeExtended[] = [
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_ender_arrow>, [<item:minecraft:ender_pearl>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_atlantean_arrow>, [<item:upgrade_aquatic:thrasher_tooth>, <tag:items:forge:rods/prismarine>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_explosive_arrow>, [<item:minecraft:tnt>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_slime_arrow>, [<tag:items:forge:slimeballs>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_lightning_arrow>, [<item:minecraft:flint>, <item:minecraft:lightning_rod>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_vexing_arrow>, [<item:minecraft:flint>, <tag:items:forge:rods/wooden>, <item:xtraarrows:vex_wing>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_freezing_arrow>, [<item:minecraft:blue_ice>, <tag:items:forge:rods/wooden>, <item:ecologics:penguin_feather>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:padded_arrow>, [<tag:items:minecraft:wool>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:apple_arrow>, [<tag:items:forge:fruits/apple>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:notch_apple_arrow>, [<item:minecraft:enchanted_golden_apple>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:extinguishing_arrow>, [<item:minecraft:potion>.withTag({Potion: "minecraft:water"}), <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:incendiary_arrow>, [<tag:items:forge:rods/blaze>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:leashing_arrow>, [<item:minecraft:lead>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_magnetic_arrow>, [<item:ring_of_attraction:ring_of_attraction>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:ascended_quark:ambrosium_torch_arrow>, [<item:aether:ambrosium_shard>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true),
	new fletchingTableRecipeExtended(<item:quark:torch_arrow>, [<item:minecraft:coal>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>], true)
];

/* Main script */

for recipe in fletchingRecipes {

	recipe.registerRecipe();
	
}