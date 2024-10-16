/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

import crafttweaker.util.NameUtil;

/* Objects */

public class mystifyingRecipeExtended {
	
	public var name as string : get, set;
	public var category as string : get, set;
	
	public var input as IIngredient : get, set;
	public var output as IItemStack : get, set;
	
	public var experience as float : get, set;
	public var cookTime as float : get, set;
	public var replace as bool : get, set;
	
	public this(setCategory as string, setOutput as IItemStack) {
	
	}
	
	public registerRecipe() as void {
		
		this.name = NameUtil.fixing("ct_mystifying_" + this.output.registryName);
		
		if (this.replace) {
			
			craftingTable.remove(this.output);
			<recipetype:create_dd:seething>.remove(this.output);
			<recipetype:aether:enchanting>.remove(this.output);
			
		}
		
		<recipetype:create_dd:seething>.addJsonRecipe(this.name + "_create_dd", {
			"type" : "create_dd:seething",
			"ingredients" : [
				this.input as IData
			],
			"results": [
				this.output as IData
			]
		});
		
		<recipetype:aether:enchanting>.addJsonRecipe(this.name + "_aether", {
			"type" : "aether:enchanting",
			"category": this.category,
			"cookingtime": this.cookTime,
			"experience": this.experience,
			"ingredient": this.input as IData,
			"result": this.output as IData
		});
		
	}
	
}

/* Variables */

/* Main script */