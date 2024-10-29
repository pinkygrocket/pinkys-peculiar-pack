/* Imports */

import crafttweaker.api.recipe.StoneCutterManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredientWithAmount;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

import crafttweaker.util.NameUtil;

/* Objects */

public class stonecutterRecipeExtended {
	
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
		
	}
}

/* Variables */

/* val stonecutterRecipes as IItemStack[][IItemStack] = {
	<item:twilightforest:spiral_bricks> : [<item:minecraft:stone_bricks>, <item:minecraft:stone>]
}; */