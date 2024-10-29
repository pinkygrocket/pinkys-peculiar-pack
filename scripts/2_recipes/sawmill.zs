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
				
				//<recipetype:minecraft:crafting_table>.remove(outputItem);
				
			}
			
		}
		
		for outputItem in this.output {
		
			this.name = NameUtil.fixing("ct_sawmill_" + outputItem.registryName + "_from_" + this.input.items[0].registryName);
			
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
	new sawmillRecipeExtended([<item:minecraft:oak_stairs> * 1, <item:minecraft:oak_slab> * 2, <item:minecraft:oak_fence_gate> * 1, <item:minecraft:oak_fence> * 1], <item:minecraft:oak_planks>, false),
	new sawmillRecipeExtended([<item:minecraft:oak_chest_boat>, <item:minecraft:oak_wood>, <item:minecraft:ladder>, <item:quark:oak_post>, <item:quark:stripped_oak_post>, <item:supplementaries:sign_post_oak>, <item:minecraft:oak_button>, <item:minecraft:oak_pressure_plate>, <item:minecraft:oak_trapdoor>, <item:minecraft:oak_door>, <item:quark:vertical_oak_planks>, <item:minecraft:chiseled_bookshelf>, <item:minecraft:oak_sign>, <item:minecraft:oak_hanging_sign>, <item:decorative_blocks:oak_support>, <item:decorative_blocks:oak_seat>, <item:decorative_blocks:oak_beam>, <item:mighty_mail:oak_mail_box>, <item:absentbydesign:wall_stripped_oak_log>, <item:absentbydesign:wall_oak_log>, <item:absentbydesign:wall_oak_planks>, <item:absentbydesign:fence_log_oak>, <item:minecraft:oak_boat>, <item:boatload:large_oak_boat>, <item:woodworks:oak_chest>, <item:twilightforest:hollow_oak_log>, <item:decorative_blocks:oak_palisade> * 4, <item:woodworks:oak_boards> * 4, <item:farmersdelight:oak_cabinet>, <item:minecraft:stripped_oak_log>, <item:quark:hollow_oak_log>, <item:minecraft:oak_slab> * 8, <item:quark:oak_vertical_slab> * 8, <item:minecraft:oak_fence_gate> * 4, <item:minecraft:oak_fence> * 4, <item:minecraft:oak_stairs> * 4, <item:minecraft:oak_planks> * 4], <tag:items:minecraft:oak_logs>, false)
];

/* Main script */

<recipetype:sawmill:woodcutting>.removeAll();

for entry in SAWMILL_RECIPES {
	entry.registerRecipe();
}