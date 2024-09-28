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
	
	public this(setOutput as IItemStack, setInput as IIngredient[]) {
		
		this.output = setOutput;
		this.input = setInput;
	}
	
	public registerRecipe() as void {
		
		this.name = "crafttweaker_fletching_" + this.output.registryName.namespace + "_" + this.output.registryName.path;
		val outputData as IData = this.output as IData;
		
		<recipetype:apotheosis:fletching>.addJsonRecipe(this.name, {
			"type": "apotheosis:fletching", 
			"ingredients" : this.input as IData,
			"result": outputData
		});
		
	}
	
}

val fletchingRecipes as fletchingTableRecipeExtended[] = [
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_ender_arrow>, [<item:minecraft:ender_pearl>, <tag:items:forge:rods/wooden>, <tag:items:forge:feathers>]),
	/* new fletchingTableRecipeExtended9<item:xtraarrows:flint_atlantean_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_explosive_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_slime_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_lightning_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_vexing_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_tracking_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_freezing_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:padded_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:breeding_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:cupids_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:apple_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:notch_apple_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_gravity_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:extinguishing_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:incendiary_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:leashing_arrow>, []),
	new fletchingTableRecipeExtended(<item:xtraarrows:flint_magnetic_arrow>, []),
	new fletchingTableRecipeExtended(<item:ascended_quark:ambrosium_torch_arrow>, []),
	new fletchingTableRecipeExtended(<item:quark:torch_arrow>, []),
	new fletchingTableRecipeExtended(<item:supplementaries:rope_arrow>, []), */
];

for recipe in fletchingRecipes {

	recipe.registerRecipe();
	
}