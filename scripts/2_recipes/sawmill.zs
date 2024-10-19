/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredientWithAmount;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

import crafttweaker.util.NameUtil;

/* Objects */

public class sawmillRecipeExtended {
	
	public var name as string : get, set;
	
	public var input as IIngredient : get, set;
	public var output as IItemStack[] : get, set;
	
	public var replace as bool : get, set;
	
	public this(setOutput as IItemStack[], setInput as IIngredient, setReplace as bool) {
		
		this.input = setInput;
		this.output = setOutput;
		this.replace = setReplace;
		
	}
	
	public registerRecipe() as void {
		
		if (this.replace) {
			
			for outputItem in this.output {
				
				recipes.remove(outputItem);
				
			}
			
		}
		
		this.name = NameUtil.fixing("ct_sawmill_" + this.input.items[0].registryName);
		
		for outputItem in this.output {
			
			<recipetype:sawmill:woodcutting>.addJsonRecipe(this.name, {
				"type": "sawmill:woodcutting", 
				"count": outputItem.amount,
				"ingredient" : this.input as IData,
				"result" : outputItem.registryName
			});
		
		}
		
	}
	
}

/* Variables */

val SAWMILL_RECIPES as sawmillRecipeExtended[] = [
	new sawmillRecipeExtended([<item:minecraft:oak_stairs> * 8], <tag:items:minecraft:oak_logs>, true)
];

/* Main script */

for entry in SAWMILL_RECIPES {
	entry.registerRecipe();
}