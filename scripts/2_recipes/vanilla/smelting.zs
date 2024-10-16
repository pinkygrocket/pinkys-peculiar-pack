/****************************************************************************
*** Script for managing smelting recipes 
*** Smoking (Smoker), Blasting (Blast Furnace) and Baking (Kiln) is also managed here
****************************************************************************/

/* Imports */

import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.BlastFurnaceRecipeManager;
import crafttweaker.api.recipe.SmokerRecipeManager;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.AbstractCookingRecipe;
import crafttweaker.api.recipe.type.SmeltingRecipe;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;

import crafttweaker.api.data.IData;
import crafttweaker.util.NameUtil;

/* Objects */

val STANDARD_COOK_TIME as int = 200;
val STANDARD_EXP_REWARD as float = 0.1;

public class smeltingRecipeExtended {
	
	public var name as string : get, set;
	
	// valid types are SMOKING, BLASTING, KILN, NONE
	
	public var type as string : get, set;
	
	public var output as IItemStack : get, set;
	public var input as IIngredient : get, set;
	public var duration as int : get, set;
	public var experience as float : get, set;
	
	public var replace as bool : get, set;
	
	public this(setType as string, setOutput as IItemStack, setInput as IIngredient, setReplace as bool) {
		
		this.type = setType;
		this.output = setOutput;
		this.input = setInput;
		this.duration = 200;
		this.experience = 0.1;
		this.replace = setReplace;
		
	}
	
	public this(setType as string, setOutput as IItemStack, setInput as IIngredient, setDuration as int, setExperience as float, setReplace as bool) {
		
		this.type = setType;
		this.output = setOutput;
		this.input = setInput;
		this.duration = setDuration;
		this.experience = setExperience;
		this.replace = setReplace;
		
	}
	
	public registerRecipe() as void {
		
		this.name = NameUtil.fixing("ct_smelting_" + this.input.items[0].registryName);
		
		// wip 
		/* if (this.replace) {
			
		} */
		
		furnace.addRecipe(this.name + "_furnace", this.output, this.input, this.experience, this.duration);
		
		switch (this.type) {
			case "SMOKING" : smoker.addRecipe(this.name + "_smoker", this.output, this.input, this.experience, this.duration / 2); break;
			case "BLASTING" : blastFurnace.addRecipe(this.name + "_blast_furnace", this.output, this.input, this.experience, this.duration / 2); break;
			case "KILN" : <recipetype:clayworks:baking>.addJsonRecipe(this.name + "_kiln", {
				"type": "clayworks:baking",
				"cookingtime": this.duration / 2,
				"experience": this.experience,
				"ingredient": this.input as IData,
				"result": this.output as IData
			}); break;
		}
		
	}
	
}

/* Variables */

val SMELTING_RECIPES as smeltingRecipeExtended[] = [

	# QOL - Allow burning away moss from stone blocks to obtain the normal version
	
	new smeltingRecipeExtended("KILN", <item:minecraft:stone_bricks>, <item:minecraft:mossy_stone_bricks>, false),
	new smeltingRecipeExtended("KILN", <item:minecraft:cobblestone>, <item:minecraft:mossy_cobblestone>, false),
	new smeltingRecipeExtended("KILN", <item:minecraft:cobblestone_stairs>, <item:minecraft:mossy_cobblestone_stairs>, false),
	new smeltingRecipeExtended("KILN", <item:minecraft:cobblestone_slab>, <item:minecraft:mossy_cobblestone_slab>, false),
	new smeltingRecipeExtended("KILN", <item:minecraft:cobblestone_wall>, <item:minecraft:mossy_cobblestone_wall>, false),
	new smeltingRecipeExtended("KILN", <item:minecraft:stone_brick_stairs>, <item:minecraft:mossy_stone_brick_stairs>, false),
	new smeltingRecipeExtended("KILN", <item:minecraft:stone_brick_slab>, <item:minecraft:mossy_stone_brick_slab>, false),
	new smeltingRecipeExtended("KILN", <item:minecraft:stone_brick_wall>, <item:minecraft:mossy_stone_brick_wall>, false),
	new smeltingRecipeExtended("KILN", <item:minecraft:infested_stone_bricks>, <item:minecraft:infested_mossy_stone_bricks>, false),
	new smeltingRecipeExtended("KILN", <item:quark:stone_brick_vertical_slab>, <item:quark:mossy_stone_brick_vertical_slab>, false),
	new smeltingRecipeExtended("KILN", <item:twilightforest:underbrick>, <item:twilightforest:mossy_underbrick>, false),
	new smeltingRecipeExtended("KILN", <item:twilightforest:castle_brick>, <item:twilightforest:mossy_castle_brick>, false),
	new smeltingRecipeExtended("KILN", <item:twilightforest:castle_brick_stairs>, <item:twilightforest:mossy_castle_brick_stairs>, false),
	new smeltingRecipeExtended("KILN", <item:quark:cobblestone_vertical_slab>, <item:quark:mossy_cobblestone_vertical_slab>, false),
	new smeltingRecipeExtended("KILN", <item:quark:cobblestone_bricks>, <item:quark:mossy_cobblestone_bricks>, false),
	new smeltingRecipeExtended("KILN", <item:quark:cobblestone_bricks_stairs>, <item:quark:mossy_cobblestone_bricks_stairs>, false),
	new smeltingRecipeExtended("KILN", <item:quark:cobblestone_bricks_slab>, <item:quark:mossy_cobblestone_bricks_slab>, false),
	new smeltingRecipeExtended("KILN", <item:quark:cobblestone_bricks_vertical_slab>, <item:quark:mossy_cobblestone_bricks_vertical_slab>, false),
	new smeltingRecipeExtended("KILN", <item:quark:cobblestone_bricks_wall>, <item:quark:mossy_cobblestone_bricks_wall>, false),
	new smeltingRecipeExtended("KILN", <item:aether:holystone>, <item:aether:mossy_holystone>, false),
	new smeltingRecipeExtended("KILN", <item:aether:holystone_stairs>, <item:aether:mossy_holystone_stairs>, false),
	new smeltingRecipeExtended("KILN", <item:aether:holystone_slab>, <item:aether:mossy_holystone_slab>, false),
	new smeltingRecipeExtended("KILN", <item:aether:holystone_wall>, <item:aether:mossy_holystone_wall>, false),
	new smeltingRecipeExtended("KILN", <item:twilightforest:etched_nagastone>, <item:twilightforest:mossy_etched_nagastone>, false),
	new smeltingRecipeExtended("KILN", <item:twilightforest:nagastone_pillar>, <item:twilightforest:mossy_nagastone_pillar>, false),
	new smeltingRecipeExtended("KILN", <item:twilightforest:nagastone_stairs_left>, <item:twilightforest:mossy_nagastone_stairs_left>, false),
	new smeltingRecipeExtended("KILN", <item:twilightforest:nagastone_stairs_right>, <item:twilightforest:mossy_nagastone_stairs_right>, false),
	new smeltingRecipeExtended("KILN", <item:twilightforest:mazestone_brick>, <item:twilightforest:mossy_mazestone>, false),
	new smeltingRecipeExtended("KILN", <item:v_slab_compat:tflostblocks/stone_tile_vertical_slab>, <item:v_slab_compat:tflostblocks/mossy_stone_tile_vertical_slab>, false),
	new smeltingRecipeExtended("KILN", <item:ascended_quark:holystone_brick_vertical_slab>, <item:v_slab_compat:deep_aether/mossy_holystone_brick_vertical_slab>, false),
	new smeltingRecipeExtended("KILN", <item:v_slab_compat:deep_aether/holystone_tile_vertical_slab>, <item:v_slab_compat:deep_aether/mossy_holystone_tile_vertical_slab>, false),
	new smeltingRecipeExtended("KILN", <item:tflostblocks:castle_brick_wall>, <item:tflostblocks:mossy_castle_brick_wall>, false),
	new smeltingRecipeExtended("KILN", <item:tflostblocks:castle_brick_slab>, <item:tflostblocks:mossy_castle_brick_slab>, false),
	
	# QOL - Allow iron, ironwood, copper and golden equipment to be broken down into nuggets
	
	new smeltingRecipeExtended("BLASTING", <item:minecraft:iron_nugget>, <item:minecraft:rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:minecraft:iron_nugget>, <item:minecraft:detector_rail> , false),
	new smeltingRecipeExtended("BLASTING", <item:minecraft:iron_nugget>, <item:minecraft:activator_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:minecraft:iron_nugget>, <item:chimes:iron_chimes>, false),
	new smeltingRecipeExtended("BLASTING", <item:minecraft:gold_nugget>, <item:minecraft:powered_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:minecraft:gold_nugget>, <item:create:controller_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:chimes:copper_chimes>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:create:copper_backtank>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:create:copper_valve_handle>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:create:copper_diving_boots>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:create:copper_ladder>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:create:copper_bars>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:create:copper_scaffolding>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:create:copper_door>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:bellsandwhistles:copper_bogie_steps>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:bellsandwhistles:copper_grab_rails>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:bellsandwhistles:copper_door_step>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:friendsandfoes:copper_button>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:modernminecarts:copper_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:modernminecarts:exposed_copper_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:modernminecarts:weathered_copper_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:modernminecarts:oxidized_copper_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:modernminecarts:waxed_copper_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:modernminecarts:waxed_exposed_copper_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:modernminecarts:waxed_weathered_copper_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:modernminecarts:waxed_oxidized_copper_rail>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:sootychimneys:copper_chimney>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:sootychimneys:dirty_copper_chimney>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:crystal_clear:copper_clear_glass_scaffolding>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:crystal_clear:copper_glass_scaffolding>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:crystal_clear:copper_glass_casing>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:crystal_clear:copper_clear_glass_casing>, false),
	new smeltingRecipeExtended("BLASTING", <item:create:copper_nugget>, <item:create:copper_diving_helmet>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightforest:ironwood_sword>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightforest:ironwood_shovel>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightforest:ironwood_pickaxe>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightforest:ironwood_axe>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightforest:ironwood_hoe>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:umbral_skies:ironwood_gloves>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightdelight:ironwood_knife>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightforest:ironwood_helmet>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightforest:ironwood_chestplate>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightforest:ironwood_boots>, false),
	new smeltingRecipeExtended("BLASTING", <item:cogsofcarminite:ironwood_nugget>, <item:twilightforest:ironwood_leggings>, false)
];

/* Main script */

for recipe in SMELTING_RECIPES {
	
	recipe.registerRecipe();
	
}