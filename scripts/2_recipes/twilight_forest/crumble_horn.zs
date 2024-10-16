/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

/* Objects */

public class crumbleHornRecipeExtended {
	
	public var name as string : get, set;
	public var input as IItemStack : get, set;
	public var output as IItemStack : get, set;
	
	public this(setOutput as IItemStack, setInput as IItemStack) {
			
		this.input = setInput;
		this.output = setOutput;
		
	}
		
	public registerRecipe() as void {
		
		this.name = "ct_crumble_horn_" + this.input.registryName.path + "_to_" + this.output.registryName.path;
		
		<recipetype:twilightforest:crumble_horn>.addJsonRecipe(this.name, {
			"type" : "twilightforest:crumble_horn",
			"from" : this.input.registryName,
			"to" : this.output.registryName
		});
		
	}
	
}

/* Variables */

val crumbleHornRecipes as crumbleHornRecipeExtended[] = [

	// Twilight Forest: The Lost Blocks
	
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_underbrick_wall>, <item:tflostblocks:cracked_underbrick_wall>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_deadrock_stairs>, <item:tflostblocks:weathered_deadrock_stairs>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_deadrock_slab>, <item:tflostblocks:weathered_deadrock_slab>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_castle_brick_slab>, <item:tflostblocks:castle_brick_slab>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_castle_brick_wall>, <item:tflostblocks:castle_brick_wall>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_underbrick_stairs>, <item:tflostblocks:underbrick_stairs>),
	new crumbleHornRecipeExtended(<item:tflostblocks:cracked_underbrick_slab>, <item:tflostblocks:underbrick_slab>),
	
	// Quark/Vertical Slab Compat/Absent By Design
	
	new crumbleHornRecipeExtended(<item:v_slab_compat:absentbydesign/bricks_cracked_vertical_slab>, <item:quark:stone_brick_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:absentbydesign/cracked_deepslate_tiles_vertical_slab>, <item:quark:deepslate_tile_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:absentbydesign/cracked_nether_bricks_vertical_slab>, <item:quark:nether_brick_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:absentbydesign/cracked_deepslate_bricks_vertical_slab>, <item:quark:deepslate_brick_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:absentbydesign/cracked_polished_blackstone_bricks_vertical_slab>, <item:quark:polished_blackstone_brick_vertical_slab>),
	
	// Cracker's Wither Storm Mod 
	
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:witherstormmod:tainted_sand>),
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:witherstormmod:tainted_dirt>),
	new crumbleHornRecipeExtended(<item:witherstormmod:tainted_sand>, <item:witherstormmod:tainted_sandstone>),
	
	// Aether 
	
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:aether:aether_dirt_path>),
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:deep_aether:aether_coarse_dirt>),
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:aether:aether_dirt>),
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:aether:aether_grass_block>),
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:deep_aether:golden_heights_grass_block>),
	new crumbleHornRecipeExtended(<item:aether:aether_dirt>, <item:aether:enchanted_aether_grass_block>),
	
	// Mystic's Biomes
	
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:mysticsbiomes:lush_sand>),
	new crumbleHornRecipeExtended(<item:mysticsbiomes:lush_sand>, <item:mysticsbiomes:lush_sandstone>),
	
	// Minecraft
	
	new crumbleHornRecipeExtended(<item:minecraft:air>, <item:minecraft:soul_sand>),
	new crumbleHornRecipeExtended(<item:minecraft:cut_copper_stairs>, <item:minecraft:exposed_cut_copper_stairs>),
	new crumbleHornRecipeExtended(<item:minecraft:cut_copper_slab>, <item:minecraft:exposed_cut_copper_slab>),
	
	// Twilight Forest
	
	new crumbleHornRecipeExtended(<item:twilightforest:cracked_nagastone_stairs_left>, <item:twilightforest:nagastone_stairs_left>),
	new crumbleHornRecipeExtended(<item:twilightforest:cracked_nagastone_stairs_right>, <item:twilightforest:nagastone_stairs_right>),
	new crumbleHornRecipeExtended(<item:twilightforest:cracked_castle_brick_stairs>, <item:twilightforest:castle_brick_stairs>),
	
	// Decorative Blocks
	
	new crumbleHornRecipeExtended(<item:minecraft:dirt>, <item:decorative_blocks:rocky_dirt>),
	
	// Absent By Design
	
	new crumbleHornRecipeExtended(<item:absentbydesign:wall_stonebrick_cracked>, <item:minecraft:stone_brick_wall>),
	new crumbleHornRecipeExtended(<item:absentbydesign:wall_cracked_nether_bricks>, <item:minecraft:nether_brick_wall>),
	new crumbleHornRecipeExtended(<item:absentbydesign:slab_bricks_cracked>, <item:minecraft:stone_brick_slab>),
	new crumbleHornRecipeExtended(<item:absentbydesign:slab_cracked_deepslate_bricks>, <item:minecraft:deepslate_brick_slab>),
	new crumbleHornRecipeExtended(<item:absentbydesign:slab_cracked_deepslate_tiles>, <item:minecraft:deepslate_tile_slab>),
	new crumbleHornRecipeExtended(<item:absentbydesign:stairs_bricks_cracked>, <item:minecraft:stone_brick_stairs>),
	new crumbleHornRecipeExtended(<item:absentbydesign:stairs_cracked_nether_bricks>, <item:minecraft:nether_brick_stairs>),
	new crumbleHornRecipeExtended(<item:absentbydesign:stairs_cracked_deepslate_bricks>, <item:minecraft:deepslate_brick_stairs>),
	new crumbleHornRecipeExtended(<item:absentbydesign:stairs_cracked_deepslate_tiles>, <item:minecraft:deepslate_tile_stairs>),
	new crumbleHornRecipeExtended(<item:absentbydesign:wall_cracked_deepslate_bricks>, <item:minecraft:deepslate_brick_wall>),
	new crumbleHornRecipeExtended(<item:absentbydesign:wall_cracked_deepslate_tiles>, <item:absentbydesign:wall_deepslate>),
	new crumbleHornRecipeExtended(<item:absentbydesign:slab_cracked_nether_bricks>, <item:minecraft:nether_brick_slab>),
	new crumbleHornRecipeExtended(<item:absentbydesign:slab_cracked_polished_blackstone_bricks>, <item:minecraft:polished_blackstone_brick_slab>),
	new crumbleHornRecipeExtended(<item:absentbydesign:stairs_cracked_polished_blackstone_bricks>, <item:minecraft:polished_blackstone_brick_stairs>),
	new crumbleHornRecipeExtended(<item:absentbydesign:wall_cracked_polished_blackstone_bricks>, <item:minecraft:polished_blackstone_brick_wall>),
		
	// Quark 
	
	new crumbleHornRecipeExtended(<item:minecraft:soul_sand>, <item:quark:soul_sandstone>),
	new crumbleHornRecipeExtended(<item:quark:cut_copper_vertical_slab>, <item:quark:exposed_cut_copper_vertical_slab>),
	new crumbleHornRecipeExtended(<item:quark:exposed_cut_copper_vertical_slab>, <item:quark:weathered_cut_copper_vertical_slab>),
	new crumbleHornRecipeExtended(<item:quark:weathered_cut_copper_vertical_slab>, <item:quark:oxidized_cut_copper_vertical_slab>),
	
	// Create
	
	new crumbleHornRecipeExtended(<item:create:copper_shingles>, <item:create:exposed_copper_shingles>),
	new crumbleHornRecipeExtended(<item:create:copper_shingle_stairs>, <item:create:exposed_copper_shingle_stairs>),
	new crumbleHornRecipeExtended(<item:create:copper_shingle_slab>, <item:create:exposed_copper_shingle_slab>),
	new crumbleHornRecipeExtended(<item:create:copper_tiles>, <item:create:exposed_copper_tiles>),
	new crumbleHornRecipeExtended(<item:create:copper_tile_slab>, <item:create:exposed_copper_tile_slab>),
	new crumbleHornRecipeExtended(<item:create:copper_tile_stairs>, <item:create:exposed_copper_tile_stairs>),
	new crumbleHornRecipeExtended(<item:create:exposed_copper_shingles>, <item:create:weathered_copper_shingles>),
	new crumbleHornRecipeExtended(<item:create:exposed_copper_shingle_stairs>, <item:create:weathered_copper_shingle_stairs>),
	new crumbleHornRecipeExtended(<item:create:exposed_copper_shingle_slab>, <item:create:weathered_copper_shingle_slab>),
	new crumbleHornRecipeExtended(<item:create:exposed_copper_tiles>, <item:create:weathered_copper_tiles>),
	new crumbleHornRecipeExtended(<item:create:exposed_copper_tile_slab>, <item:create:weathered_copper_tile_slab>),
	new crumbleHornRecipeExtended(<item:create:exposed_copper_tile_stairs>, <item:create:weathered_copper_tile_stairs>),
	new crumbleHornRecipeExtended(<item:create:weathered_copper_shingles>, <item:create:oxidized_copper_shingles>),
	new crumbleHornRecipeExtended(<item:create:weathered_copper_shingle_stairs>, <item:create:oxidized_copper_shingle_slab>),
	new crumbleHornRecipeExtended(<item:create:weathered_copper_shingle_slab>, <item:create:oxidized_copper_shingle_stairs>),
	new crumbleHornRecipeExtended(<item:create:weathered_copper_tiles>, <item:create:oxidized_copper_tiles>),
	new crumbleHornRecipeExtended(<item:create:weathered_copper_tile_slab>, <item:create:oxidized_copper_tile_slab>),
	new crumbleHornRecipeExtended(<item:create:weathered_copper_tile_stairs>, <item:create:oxidized_copper_tile_stairs>),
	
	// Friends and Foes
	
	new crumbleHornRecipeExtended(<item:minecraft:lightning_rod>, <item:friendsandfoes:exposed_lightning_rod>),
	new crumbleHornRecipeExtended(<item:friendsandfoes:exposed_lightning_rod>, <item:friendsandfoes:weathered_lightning_rod>),
	new crumbleHornRecipeExtended(<item:friendsandfoes:weathered_lightning_rod>, <item:friendsandfoes:oxidized_lightning_rod>),
	
	// Vertical Slab Compat
	
	new crumbleHornRecipeExtended(<item:v_slab_compat:create/copper_tile_vertical_slab>, <item:v_slab_compat:create/exposed_copper_tile_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:create/exposed_copper_tile_vertical_slab>, <item:v_slab_compat:create/weathered_copper_tile_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:create/weathered_copper_tile_vertical_slab>, <item:v_slab_compat:create/oxidized_copper_tile_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:create/copper_shingle_vertical_slab>, <item:v_slab_compat:create/exposed_copper_shingle_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:create/exposed_copper_shingle_vertical_slab>, <item:v_slab_compat:create/weathered_copper_shingle_vertical_slab>),
	new crumbleHornRecipeExtended(<item:v_slab_compat:create/weathered_copper_shingle_vertical_slab>, <item:v_slab_compat:create/oxidized_copper_shingle_vertical_slab>),
		
	// Modern Minecarts
	
	new crumbleHornRecipeExtended(<item:modernminecarts:copper_rail>, <item:modernminecarts:exposed_copper_rail>),
	new crumbleHornRecipeExtended(<item:modernminecarts:exposed_copper_rail>, <item:modernminecarts:weathered_copper_rail>),
	new crumbleHornRecipeExtended(<item:modernminecarts:weathered_copper_rail>, <item:modernminecarts:oxidized_copper_rail>)
	
];

/* Main script */

for recipe in crumbleHornRecipes {

	recipe.registerRecipe();
	
}