/* Imports */

import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.AbstractCookingRecipe;
import crafttweaker.api.recipe.type.SmeltingRecipe;
import crafttweaker.api.item.IItemStack;

/* Variables */

val standardSmeltingRecipes as IItemStack[IItemStack] = {

	# QOL - Allow burning away moss from stone blocks to obtain the normal version
	
	<item:minecraft:mossy_stone_bricks> : <item:minecraft:stone_bricks>,
	<item:minecraft:mossy_cobblestone> : <item:minecraft:cobblestone>,
	<item:minecraft:mossy_cobblestone_stairs> : <item:minecraft:cobblestone_stairs>,
	<item:minecraft:mossy_cobblestone_slab> : <item:minecraft:cobblestone_slab>,
	<item:minecraft:mossy_cobblestone_wall> : <item:minecraft:cobblestone_wall>,
	<item:minecraft:mossy_stone_brick_stairs> : <item:minecraft:stone_brick_stairs>,
	<item:minecraft:mossy_stone_brick_slab> : <item:minecraft:stone_brick_slab>,
	<item:minecraft:mossy_stone_brick_wall> : <item:minecraft:stone_brick_wall>,
	<item:minecraft:infested_mossy_stone_bricks> : <item:minecraft:infested_stone_bricks>,
	<item:quark:mossy_stone_brick_vertical_slab> : <item:quark:stone_brick_vertical_slab>,
	<item:twilightforest:mossy_underbrick> : <item:twilightforest:underbrick>,
	<item:twilightforest:mossy_castle_brick> : <item:twilightforest:castle_brick>,
	<item:twilightforest:mossy_castle_brick_stairs> : <item:twilightforest:castle_brick_stairs>,
	<item:quark:mossy_cobblestone_vertical_slab> : <item:quark:cobblestone_vertical_slab>,
	<item:quark:mossy_cobblestone_bricks> : <item:quark:cobblestone_bricks>,
	<item:quark:mossy_cobblestone_bricks_stairs> : <item:quark:cobblestone_bricks_stairs>,
	<item:quark:mossy_cobblestone_bricks_slab> : <item:quark:cobblestone_bricks_slab>,
	<item:quark:mossy_cobblestone_bricks_vertical_slab> : <item:quark:cobblestone_bricks_vertical_slab>,
	<item:quark:mossy_cobblestone_bricks_wall> : <item:quark:cobblestone_bricks_wall>,
	<item:aether:mossy_holystone> : <item:aether:holystone>,
	<item:aether:mossy_holystone_stairs> : <item:aether:holystone_stairs>,
	<item:aether:mossy_holystone_slab> : <item:aether:holystone_slab>,
	<item:aether:mossy_holystone_wall> : <item:aether:holystone_wall>,
	<item:twilightforest:mossy_etched_nagastone> : <item:twilightforest:etched_nagastone>,
	<item:twilightforest:mossy_nagastone_pillar> : <item:twilightforest:nagastone_pillar>,
	<item:twilightforest:mossy_nagastone_stairs_left> : <item:twilightforest:nagastone_stairs_left>,
	<item:twilightforest:mossy_nagastone_stairs_right> : <item:twilightforest:nagastone_stairs_right>,
	<item:twilightforest:mossy_mazestone> : <item:twilightforest:mazestone_brick>,
	<item:v_slab_compat:tflostblocks/mossy_stone_tile_vertical_slab> : <item:v_slab_compat:tflostblocks/stone_tile_vertical_slab>,
	<item:v_slab_compat:deep_aether/mossy_holystone_brick_vertical_slab> : <item:ascended_quark:holystone_brick_vertical_slab>,
	<item:v_slab_compat:deep_aether/mossy_holystone_tile_vertical_slab> : <item:v_slab_compat:deep_aether/holystone_tile_vertical_slab>,
	<item:tflostblocks:mossy_castle_brick_wall> : <item:tflostblocks:castle_brick_wall>,
	<item:tflostblocks:mossy_castle_brick_slab> : <item:tflostblocks:castle_brick_slab>,
	
	# QOL - Allow iron, ironwood and golden equipment to be broken down into nuggets
	
	<item:minecraft:rail> : <item:minecraft:iron_nugget>,
	<item:minecraft:powered_rail> : <item:minecraft:gold_nugget>,
	<item:minecraft:detector_rail> : <item:minecraft:iron_nugget>,
	<item:minecraft:activator_rail> : <item:minecraft:iron_nugget>,
	<item:create:controller_rail> : <item:minecraft:gold_nugget>,
	<item:chimes:iron_chimes> : <item:minecraft:iron_nugget>,
	<item:chimes:copper_chimes> : <item:create:copper_nugget>,
	<item:create:copper_backtank> : <item:create:copper_nugget>,
	<item:create:copper_valve_handle> : <item:create:copper_nugget>,
	<item:create:copper_diving_helmet> : <item:create:copper_nugget>,
	<item:create:copper_diving_boots> : <item:create:copper_nugget>,
	<item:create:copper_ladder> : <item:create:copper_nugget>,
	<item:create:copper_bars> : <item:create:copper_nugget>,
	<item:create:copper_scaffolding> : <item:create:copper_nugget>,
	<item:create:copper_door> : <item:create:copper_nugget>,
	<item:bellsandwhistles:copper_bogie_steps> : <item:create:copper_nugget>,
	<item:bellsandwhistles:copper_grab_rails> : <item:create:copper_nugget>,
	<item:bellsandwhistles:copper_door_step> : <item:create:copper_nugget>,
	<item:friendsandfoes:copper_button> : <item:create:copper_nugget>,
	<item:modernminecarts:copper_rail> : <item:create:copper_nugget>,
	<item:modernminecarts:exposed_copper_rail> : <item:create:copper_nugget>,
	<item:modernminecarts:weathered_copper_rail> : <item:create:copper_nugget>,
	<item:modernminecarts:oxidized_copper_rail> : <item:create:copper_nugget>,
	<item:modernminecarts:waxed_copper_rail> : <item:create:copper_nugget>,
	<item:modernminecarts:waxed_exposed_copper_rail> : <item:create:copper_nugget>,
	<item:modernminecarts:waxed_weathered_copper_rail> : <item:create:copper_nugget>,
	<item:modernminecarts:waxed_oxidized_copper_rail> : <item:create:copper_nugget>,
	<item:sootychimneys:copper_chimney> : <item:create:copper_nugget>,
	<item:sootychimneys:dirty_copper_chimney> : <item:create:copper_nugget>,
	<item:crystal_clear:copper_clear_glass_scaffolding> : <item:create:copper_nugget>,
	<item:crystal_clear:copper_glass_scaffolding> : <item:create:copper_nugget>,
	<item:crystal_clear:copper_glass_casing> : <item:create:copper_nugget>,
	<item:crystal_clear:copper_clear_glass_casing> : <item:create:copper_nugget>,
	<item:create:netherite_diving_helmet> : <item:create:copper_nugget>,
	<item:twilightforest:ironwood_sword> : <item:cogsofcarminite:ironwood_nugget>,
	<item:twilightforest:ironwood_shovel> : <item:cogsofcarminite:ironwood_nugget>,
	<item:twilightforest:ironwood_pickaxe> : <item:cogsofcarminite:ironwood_nugget>,
	<item:twilightforest:ironwood_axe> : <item:cogsofcarminite:ironwood_nugget>,
	<item:twilightforest:ironwood_hoe> : <item:cogsofcarminite:ironwood_nugget>,
	<item:umbral_skies:ironwood_gloves> : <item:cogsofcarminite:ironwood_nugget>,
	<item:twilightdelight:ironwood_knife> : <item:cogsofcarminite:ironwood_nugget>,
	<item:twilightforest:ironwood_helmet> : <item:cogsofcarminite:ironwood_nugget>,
	<item:twilightforest:ironwood_chestplate> : <item:cogsofcarminite:ironwood_nugget>,
	<item:twilightforest:ironwood_boots> : <item:cogsofcarminite:ironwood_nugget>,
	<item:twilightforest:ironwood_leggings> : <item:cogsofcarminite:ironwood_nugget>
};

/* Main script */

for input, output in standardSmeltingRecipes {
	
	furnace.addRecipe("crafttweaker_" + input.registryName.namespace + "_" + input.registryName.path + "_furnace", output, input, 0.1, 200);
	
}