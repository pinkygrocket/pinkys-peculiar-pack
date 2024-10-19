/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

import crafttweaker.util.NameUtil;

/* Objects */

public class poisoningRecipeExtended {
	
	public var name as string : get, set;
	
	public var input as IIngredient[] : get, set;
	public var output as IItemStack : get, set;
	
	public var replace as bool : get, set;
	
	public registerRecipe() as void {
		
		this.name = NameUtil.fixing("ct_poisoning_" + this.output.registryName);
		
	}
	
}

/* Variables */

/* Main script */