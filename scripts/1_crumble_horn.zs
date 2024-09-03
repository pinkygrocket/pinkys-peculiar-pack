/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

public class crumbleHornRecipeExtended {
	
	public var name as string : get, set;
	public var input as IItemStack : get, set;
	public var output as IItemStack : get, set;
	
	public this(setOutput as IItemStack, setInput as IItemStack) {
			
		this.input = setInput;
		this.output = setOutput;
		
	}
		
	public registerRecipe() as void {
		
		this.name = "crafttweaker_crumble_horn_" + this.input.registryName.path + "_to_" + this.output.registryName.path;
		
		<recipetype:twilightforest:crumble_horn>.addJsonRecipe(this.name, {
			"type" : "twilightforest:crumble_horn",
			"from" : this.input.registryName,
			"to" : this.output.registryName
		});
		
	}
	
}

val crumbleHornRecipes as crumbleHornRecipeExtended[] = [
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_underbrick_wall>, <item:tflostblocks:cracked_underbrick_wall>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_deadrock_stairs>, <item:tflostblocks:weathered_deadrock_stairs>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_deadrock_slab>, <item:tflostblocks:weathered_deadrock_slab>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_castle_brick_slab>, <item:tflostblocks:castle_brick_slab>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_castle_brick_wall>, <item:tflostblocks:castle_brick_wall>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:absentbydesign/bricks_cracked_vertical_slab>, <item:quark:stone_brick_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:absentbydesign/cracked_deepslate_tiles_vertical_slab>, <item:quark:deepslate_tile_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:absentbydesign/cracked_nether_bricks_vertical_slab>, <item:quark:nether_brick_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:absentbydesign/cracked_deepslate_bricks_vertical_slab>, <item:quark:deepslate_brick_vertical_slab>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_underbrick_stairs>, <item:tflostblocks:underbrick_stairs>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_underbrick_slab>, <item:tflostblocks:underbrick_slab>),
	new crumbleHornRecipeExtended(<item:minecraft:soul_sand>, <item:quark:soul_sandstone>),
	new crumbleHornRecipeExtended(<item:mysticsbiomes:lush_sand>, <item:mysticsbiomes:lush_sandstone>),
	new crumbleHornRecipeExtended(<item:witherstormmod:tainted_sand>, <item:witherstormmod:tainted_sandstone>),
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:witherstormmod:tainted_sand>),
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:mysticsbiomes:lush_sand>),
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:minecraft:soul_sand>),
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:aether:aether_dirt_path>),
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:deep_aether:aether_coarse_dirt>),
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:aether:aether_dirt>),
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:witherstormmod:tainted_dirt>),
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:aether:aether_grass_block>),
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:deep_aether:golden_heights_grass_block>),
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:aether:enchanted_aether_grass_block>),
	new crumbleHornRecipeExtended(<item:minecraft:dirt>, <item:decorative_blocks:rocky_dirt>)
	/* <item:absentbydesign:wall_stonebrick_cracked>
		<item:absentbydesign:wall_cracked_nether_bricks>
		<item:absentbydesign:slab_bricks_cracked>
		<item:absentbydesign:slab_cracked_deepslate_bricks>
		<item:absentbydesign:slab_cracked_deepslate_tiles>
		<item:absentbydesign:stairs_bricks_cracked>
		<item:absentbydesign:stairs_cracked_nether_bricks>
		<item:absentbydesign:stairs_cracked_deepslate_bricks>
		<item:absentbydesign:stairs_cracked_deepslate_tiles>
		<item:absentbydesign:wall_cracked_deepslate_bricks>
		<item:absentbydesign:wall_cracked_deepslate_tiles>
		<item:twilightforest:cracked_nagastone_stairs_left>
		<item:twilightforest:cracked_nagastone_stairs_right>
		<item:absentbydesign:wall_cracked_deepslate_tiles>
		<item:absentbydesign:wall_cracked_deepslate_bricks>
		<item:minecraft:exposed_cut_copper_stairs>
		<item:minecraft:exposed_cut_copper_slab>
		<item:create:exposed_copper_shingles>
		<item:create:exposed_copper_shingle_stairs>
		<item:create:exposed_copper_shingle_slab>
		<item:create:exposed_copper_tiles>
		<item:create:exposed_copper_tile_slab>
		<item:create:exposed_copper_tile_stairs>
		<item:friendsandfoes:exposed_lightning_rod>
		<item:modernminecarts:exposed_copper_rail>
		<item:quark:exposed_cut_copper_vertical_slab>
		<item:v_slab_compat:create/exposed_copper_tile_vertical_slab>
		<item:v_slab_compat:create/exposed_copper_shingle_vertical_slab> */
];

for recipe in crumbleHornRecipes {

	recipe.registerRecipe();
	
}