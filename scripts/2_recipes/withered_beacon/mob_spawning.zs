/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;

import crafttweaker.util.NameUtil;
import crafttweaker.api.resource.ResourceLocation;

import crafttweaker.api.data.IData;
import crafttweaker.api.data.ListData;

/* Objects */

public class witheredBeaconMobSummoningExtended {
	
	public var name as string : get, set;
	
	public var condition as string : get, set;
	public var mob as EntityType<Entity> : get, set;
	public var input as IIngredient[] : get, set;
	
	public this(setMob as EntityType<Entity> , setCondition as string, setInput as IIngredient[]) {
		
		this.condition = setCondition;
		this.mob = setMob;
		this.input = setInput;
		
	}
	
	public registerRecipe() as void {
		
		this.name = NameUtil.fixing("ct_withered_beacon_spawning_" + this.mob.registryName);
		var inputJson = new ListData();
	
		for ingredient in this.input {
			
			inputJson.add(ingredient as IData);
			
		}
		
		<recipetype:witherstormmod:super_beacon_resummon>.addJsonRecipe(this.name, {
			
			"type": "witherstormmod:resummon_super_beacon",
			"condition": this.condition as IData,
			"entity": this.mob.registryName as IData,
			"ingredients": inputJson as IData
			
		});
		
	}
	
}

/* Variables */

val WITHERED_BEACON_SUMMONING_RECIPES as witheredBeaconMobSummoningExtended[] = [
	new witheredBeaconMobSummoningExtended(<entitytype:twilightforest:hydra>, "all_supports", [<item:twilightforest:hydra_trophy>, <item:minecraft:lava_bucket>, <item:minecraft:fire_charge>, <item:upgrade_aquatic:thrasher_tooth>, <item:upgrade_aquatic:thrasher_tooth>, <item:upgrade_aquatic:thrasher_tooth>]),
	new witheredBeaconMobSummoningExtended(<entitytype:twilightforest:naga>, "all_supports", [<item:twilightforest:naga_trophy>, <item:minecraft:spider_eye>, <item:minecraft:spider_eye>, <item:minecraft:moss_block>, <item:minecraft:moss_block>, <item:minecraft:moss_block>]),
	new witheredBeaconMobSummoningExtended(<entitytype:twilightforest:lich>, "all_supports", [<item:twilightforest:lich_trophy>, <item:minecraft:gold_ingot>, <item:minecraft:ender_pearl>, <item:minecraft:bone>, <item:minecraft:bone>, <item:minecraft:bone>]),
	new witheredBeaconMobSummoningExtended(<entitytype:twilightforest:ur_ghast>, "all_supports", [<item:twilightforest:ur_ghast_trophy>, <item:minecraft:feather>, <item:twilightforest:carminite>, <item:minecraft:ghast_tear>, <item:minecraft:ghast_tear>, <item:minecraft:ghast_tear>]),
	new witheredBeaconMobSummoningExtended(<entitytype:twilightforest:snow_queen>, "all_supports", [<item:twilightforest:snow_queen_trophy>, <item:minecraft:gold_ingot>, <item:ecologics:penguin_feather>, <item:minecraft:blue_ice>, <item:minecraft:blue_ice>, <item:minecraft:blue_ice>]),
	new witheredBeaconMobSummoningExtended(<entitytype:twilightforest:alpha_yeti>, "all_supports", [<item:twilightforest:alpha_yeti_trophy>, <item:minecraft:snowball>, <item:minecraft:snowball>, <item:twilightforest:arctic_fur>, <item:twilightforest:arctic_fur>, <item:twilightforest:arctic_fur>]),
	new witheredBeaconMobSummoningExtended(<entitytype:twilightforest:minoshroom>, "all_supports", [<item:twilightforest:minoshroom_trophy>, <item:minecraft:iron_axe>, <item:minecraft:beef>, <tag:items:forge:mushrooms>, <tag:items:forge:mushrooms>, <tag:items:forge:mushrooms>])
];

/* Main script */

for recipe in WITHERED_BEACON_SUMMONING_RECIPES {
	recipe.registerRecipe();
}