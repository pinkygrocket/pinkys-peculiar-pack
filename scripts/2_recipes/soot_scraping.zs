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

public class sootScrapingRecipeExtended {
	
	public var name as string : get, set;
	public var output as IItemStack : get, set;
	public var chimney as IItemStack : get, set;
	public var outputChance as float : get, set;
	
	public this(setOutput as IItemStack, setChimney as IItemStack, setChance as float) {
		
		this.output = setOutput;
		this.chimney = setChimney;
		this.outputChance = setChance;
		
	}
	
	public registerRecipe() as void {
		
		this.name = NameUtil.fixing("ct_soot_scraping_" + this.chimney.registryName);
		
		<recipetype:sootychimneys:soot_scraping>.addJsonRecipe(this.name, {
			
			"type": "sootychimneys:soot_scraping",
			"chimney": this.chimney as IData,
			"results": [
				{
					"chance": this.outputChance as IData,
					"item": this.output.registryName
				}
			],
			"tool": {
				"type": "sootychimneys:tool_action",
				"action": "axe_scrape"
			}
		});
		
	}
}

/* Variables */

val ASH_CHANCE = 0.75;
val ASH_ITEM = <item:supplementaries:ash>;
val DIRTY_CHIMNIES as IItemStack[] = [
	<item:sootychimneys:dirty_brick_chimney>,
	<item:sootychimneys:dirty_stone_brick_chimney>,
	<item:sootychimneys:dirty_mud_brick_chimney>,
	<item:sootychimneys:dirty_iron_chimney>,
	<item:sootychimneys:dirty_copper_chimney>,
	<item:sootychimneys:dirty_terracotta_chimney>
];

/* Main script */

<recipetype:sootychimneys:soot_scraping>.removeAll();

for item in DIRTY_CHIMNIES {
	
	val recipe = new sootScrapingRecipeExtended(ASH_ITEM, item, ASH_CHANCE);
	recipe.registerRecipe();
	
}