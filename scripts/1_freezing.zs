/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

/* Objects */

public class freezingRecipeExtended {
	
	public var name as string : get, set;
	
	public var input as IIngredient : get, set;
	public var output as IItemStack : get, set;
	public var duration as int : get, set;
	public var experience as float : get, set;
	public var replace as bool : get, set;
	
	/* Functions */
	
	public this(setOutput as IItemStack, setInput as IIngredient, setDuration as int, setExperience as float, setReplace as bool) {
		
		this.input = setInput;
		this.output = setOutput;
		this.duration = setDuration;
		this.experience = setExperience;
		
	}
	
	public registerRecipe() as void {
	
		if(this.replace) {
		
			craftingTable.remove(this.output);
			<recipetype:create_dd:freezing>.remove(this.output);
			<recipetype:aether:freezing>.remove(this.output);
			
		}
		
		this.name = "crafttweaker_freezing_" + this.output.registryName.namespace + "_" + this.output.registryName.path;
		val outputData as IData = this.output as IData;
		
		<recipetype:create_dd:freezing>.addJsonRecipe(this.name + "_create_dd", {
			"type" : "create_dd:freezing",
			"ingredients" : [
				this.input as IData,
			],
			"results" : [
				outputData as IData
			]
		});
		
		<recipetype:aether:freezing>.addJsonRecipe(this.name + "_aether",  {
			"type" : "aether:freezing",
			"category": "freezable_misc",
			"cookingtime" : this.duration,
			"experience" : this.experience,
			"ingredient" : this.input as IData,
			"result" : outputData
		});
		
	}
	
	public removeRecipe() as void {
		
		<recipetype:create_dd:freezing>.remove(output);
		<recipetype:aether:freezing>.remove(output);
	
	} 
	
}

/* Variables */

val freezingRecipes as freezingRecipeExtended[] = [
	new freezingRecipeExtended(<item:torchmaster:frozen_pearl>, <item:minecraft:ender_pearl>, 800, 1.0, true),
	new freezingRecipeExtended(<item:aether:blue_aercloud>, <item:aether:cold_aercloud>, 400, 0.1, true),
	new freezingRecipeExtended(<item:aether:ice_pendant>, <tag:items:aether:freezable_pendants>, 800, 1.0, true)
];

for recipe in freezingRecipes {

	recipe.registerRecipe();
	
}

/* Main script */

