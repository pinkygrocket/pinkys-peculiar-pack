/* Imports */

import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.AbstractCookingRecipe;
import crafttweaker.api.recipe.type.SmeltingRecipe;
import crafttweaker.api.item.IItemStack;

/* Variables */

val standardSmeltingRecipes as IItemStack[IItemStack] = {
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
	<item:chimes:iron_chimes> : <item:minecraft:iron_nugget>,
	<item:minecraft:rail> : <item:minecraft:iron_nugget>,
	<item:minecraft:powered_rail> : <item:minecraft:gold_nugget>,
	<item:minecraft:detector_rail> : <item:minecraft:iron_nugget>,
	<item:minecraft:activator_rail> : <item:minecraft:iron_nugget>,
	<item:create:controller_rail> : <item:minecraft:gold_nugget>
};

for input, output in standardSmeltingRecipes {
	
	furnace.addRecipe("crafttweaker_" + input.registryName.namespace + "_" + input.registryName.path + "_furnace", output, input, 0.1, 200);
	
}