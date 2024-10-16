/****************************************************************************
*** Script for removing items from the game and hiding them from JEI/EMI. ***
****************************************************************************/

/* Imports */

import crafttweaker.api.game.Game;

import crafttweaker.api.recipe.IRecipeManager;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;

import crafttweaker.api.ingredient.IIngredient;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.ItemDefinition;

import mods.jeitweaker.Jei;
import mods.jeitweaker.ingredient.JeiIngredient;

/* Variables */

/* 	We use a plain array for removing items, and no regexs, for a couple of compatability reasons with EMI.
	First, EMI does not listen/pay attention to JEITweaker's regex functions.
	Second, items needs to be removed from tags as EMI will list tag contents even if some entries are hidden.
	Removing items from tags is weird in CraftTweaker and isn't compatible with regex.
*/

val completeItemRemovalByItem as IItemStack[] = [

	// Absent by Design - Some overlap with other compat mods
	
	<item:absentbydesign:wall_tuff>,
	<item:absentbydesign:slab_calcite>,
	<item:absentbydesign:wall_calcite>,
	<item:absentbydesign:stairs_calcite>,
	<item:absentbydesign:stairs_tuff>,
	<item:absentbydesign:gate_nether_bricks>,
	<item:absentbydesign:slab_dripstone>,
	<item:absentbydesign:stairs_mud>,
	<item:absentbydesign:slab_mud>,
	<item:absentbydesign:wall_dripstone>,
	<item:absentbydesign:trapdoor_gold>,
	<item:absentbydesign:stairs_dripstone>,

	// Supplementaries - Redundancy with Farmer's Delight and Monobank
	
	<item:supplementaries:rope>,
	<item:supplementaries:safe>,
	
	// Wooden Shears - Content bloat, one universal wooden shear is good enough
	
	<item:woodenshears:wshears_acacia>,
	<item:woodenshears:wshears_birch>,
	<item:woodenshears:wshears_jungle>,
	<item:woodenshears:wshears_spruce>,
	<item:woodenshears:wshears_big_oak>,
	<item:woodenshears:wshears_charred>,
	<item:woodenshears:wshears_crimson>,
	<item:woodenshears:wshears_warped>,
	<item:woodenshears:wshears_mangrove>,
	<item:woodenshears:wshears_bamboo>,
	<item:woodenshears:wshears_cherry>,
	
	// Arifacts - Don't like the concept of infinite food
	
	<item:artifacts:everlasting_beef>,
	<item:artifacts:eternal_steak>,
	
	// Vertical Slab Compat - Some overlap with other compat mods
	
	<item:v_slab_compat:aether/aerogel_vertical_slab>,
	<item:v_slab_compat:aether/mossy_holystone_vertical_slab>,
	<item:v_slab_compat:aether/holystone_vertical_slab>,
	<item:v_slab_compat:aether/skyroot_vertical_slab>,
	<item:v_slab_compat:aether/holystone_brick_vertical_slab>,
	<item:v_slab_compat:aether/icestone_vertical_slab>,
	
	// Berry Good - Some overlap with other compat mods
	
	<item:berry_good:sweet_berry_basket>,
	<item:berry_good:glow_berry_basket>,
	
	<item:cookingforblockheads:heating_unit>,
	
	// Baby Fat - Ranchu don't spawn in the Overworld so this is useless
	
	<item:babyfat:water_lettuce>,
	
	// Create DD - Most of Create DD is random undocumented things that I don't want and doesn't fit this pack/game
	
	<item:create_dd:hazard_block>,
	<item:create_dd:industrial_fan>,
	<item:create_dd:item_stockpile>,
	<item:create_dd:fluid_reservoir>,
	<item:create_dd:deforester_saw>,
	<item:create_dd:music_disc_waltz_of_the_flowers>,
	<item:create_dd:furnace_engine>,
	<item:create_dd:kinetic_motor>,
	<item:create_dd:inverse_box>,
	<item:create_dd:hydraulic_press>,
	<item:create_dd:bore_block>,
	<item:create_dd:multimeter>,
	<item:create_dd:redstone_divider>,
	<item:create_dd:giant_gear>,
	<item:create_dd:integrated_circuit>,
	<item:create_dd:cog_crank>,
	<item:create_dd:magnet>,
	<item:create_dd:bury_blend>,
	<item:create_dd:coal_piece>,
	<item:create_dd:diamond_shard>,
	<item:create_dd:lapis_lazuli_shard>,
	<item:create_dd:incomplete_integrated_circuit>,
	
	// Mystic's Biomes - Duplication between other mods and some content bloat
	
	<item:mysticsbiomes:strawberry_cow_spawn_egg>,
	<item:mysticsbiomes:rainbow_chicken_spawn_egg>,
	<item:mysticsbiomes:red_panda_spawn_egg>,
	<item:mysticsbiomes:sea_otter_spawn_egg>,
	<item:mysticsbiomes:pink_egg>,
	<item:mysticsbiomes:orange_egg>,
	<item:mysticsbiomes:yellow_egg>,
	<item:mysticsbiomes:lime_egg>,
	<item:mysticsbiomes:cyan_egg>,
	<item:mysticsbiomes:purple_egg>,
	<item:mysticsbiomes:strawberry_milk_bucket>,
	
	// Just Hammers - I don't want to make hammers for every tool class but still want the functionality
	
	<item:justhammers:iron_hammer>,
	
	// Every Compat - Some overlap with other crosscompat mods
	
	<item:everycomp:q/aether/skyroot_chest>,
	<item:everycomp:q/aether/skyroot_trapped_chest>,
	<item:everycomp:q/aether/vertical_skyroot_planks>,
	<item:everycomp:tf/aether/skyroot_banister>,
	
	// Mystic's Biomes - Overlap with vanilla (why) and Autumnity
	
	<item:supplementaries:mysticsbiomes/sign_post_cherry>,
	<item:supplementaries:mysticsbiomes/sign_post_maple>,
	
	// Minecraft - Better Beekeeping as an Oak Hive that replaces the vanilla one
	
	<item:minecraft:beehive>,
	
	// Xtra Arrows - Hide disabled arrow types and some unused ingredients
	// Xtra Arrows - Has a lot of bloat, we only want the base level of Arrows
	
	<item:xtraarrows:flint_soul_torch_arrow>,
	<item:xtraarrows:flint_torch_arrow>,
	<item:xtraarrows:flint_life_steal_arrow>,
	<item:xtraarrows:flint_lantern_arrow>,
	<item:xtraarrows:flint_soul_lantern_arrow>,
	<item:xtraarrows:flint_gravity_arrow>,
	<item:xtraarrows:bat_skin>,
	<item:xtraarrows:compressed_snow>,
	<item:xtraarrows:arrow_padding>,
	<item:xtraarrows:cupids_arrow>,
	<item:xtraarrows:breeding_arrow>,
	<item:xtraarrows:breeding_ointment>,
	<item:xtraarrows:gravity_controller>,
	<item:xtraarrows:empty_ointment_bottle>,
	<item:xtraarrows:magnet_kit>,
	<item:xtraarrows:tnt_arrow_lining>,
	<item:xtraarrows:copper_arrow_lining>,
	<item:xtraarrows:headless_arrow>,
	<item:xtraarrows:diamond_soul_lantern_arrow>,
	<item:xtraarrows:diamond_magnetic_arrow>,
	<item:xtraarrows:diamond_lantern_arrow>,
	<item:xtraarrows:diamond_gravity_arrow>,
	<item:xtraarrows:diamond_life_steal_arrow>,
	<item:xtraarrows:diamond_freezing_arrow>,
	<item:xtraarrows:diamond_soul_torch_arrow>,
	<item:xtraarrows:diamond_redstone_torch_arrow>,
	<item:xtraarrows:diamond_arrow>,
	<item:xtraarrows:diamond_atlantean_arrow>,
	<item:xtraarrows:diamond_ender_arrow>,
	<item:xtraarrows:diamond_explosive_arrow>,
	<item:xtraarrows:diamond_slime_arrow>,
	<item:xtraarrows:diamond_lightning_arrow>,
	<item:xtraarrows:diamond_vexing_arrow>,
	<item:xtraarrows:diamond_tracking_arrow>,
	<item:xtraarrows:diamond_torch_arrow>,
	<item:xtraarrows:golden_redstone_torch_arrow>,
	<item:xtraarrows:golden_soul_torch_arrow>,
	<item:xtraarrows:golden_freezing_arrow>,
	<item:xtraarrows:golden_life_steal_arrow>,
	<item:xtraarrows:golden_magnetic_arrow>,
	<item:xtraarrows:golden_soul_lantern_arrow>,
	<item:xtraarrows:golden_lantern_arrow>,
	<item:xtraarrows:golden_gravity_arrow>,
	<item:xtraarrows:golden_torch_arrow>,
	<item:xtraarrows:golden_tracking_arrow>,
	<item:xtraarrows:golden_vexing_arrow>,
	<item:xtraarrows:golden_lightning_arrow>,
	<item:xtraarrows:golden_slime_arrow>,
	<item:xtraarrows:golden_explosive_arrow>,
	<item:xtraarrows:golden_ender_arrow>,
	<item:xtraarrows:golden_atlantean_arrow>,
	<item:xtraarrows:golden_arrow>,
	<item:xtraarrows:netherite_arrow>,
	<item:xtraarrows:netherite_atlantean_arrow>,
	<item:xtraarrows:netherite_ender_arrow>,
	<item:xtraarrows:netherite_explosive_arrow>,
	<item:xtraarrows:netherite_slime_arrow>,
	<item:xtraarrows:netherite_lightning_arrow>,
	<item:xtraarrows:netherite_vexing_arrow>,
	<item:xtraarrows:netherite_tracking_arrow>,
	<item:xtraarrows:netherite_torch_arrow>,
	<item:xtraarrows:netherite_redstone_torch_arrow>,
	<item:xtraarrows:netherite_soul_torch_arrow>,
	<item:xtraarrows:netherite_freezing_arrow>,
	<item:xtraarrows:netherite_life_steal_arrow>,
	<item:xtraarrows:netherite_gravity_arrow>,
	<item:xtraarrows:netherite_lantern_arrow>,
	<item:xtraarrows:netherite_magnetic_arrow>,
	<item:xtraarrows:netherite_soul_lantern_arrow>,
	<item:xtraarrows:iron_arrow>,
	<item:xtraarrows:iron_atlantean_arrow>,
	<item:xtraarrows:iron_ender_arrow>,
	<item:xtraarrows:iron_explosive_arrow>,
	<item:xtraarrows:iron_slime_arrow>,
	<item:xtraarrows:iron_lightning_arrow>,
	<item:xtraarrows:iron_vexing_arrow>,
	<item:xtraarrows:iron_tracking_arrow>,
	<item:xtraarrows:iron_torch_arrow>,
	<item:xtraarrows:iron_redstone_torch_arrow>,
	<item:xtraarrows:iron_soul_torch_arrow>,
	<item:xtraarrows:iron_freezing_arrow>,
	<item:xtraarrows:iron_life_steal_arrow>,
	<item:xtraarrows:iron_gravity_arrow>,
	<item:xtraarrows:iron_lantern_arrow>,
	<item:xtraarrows:iron_soul_lantern_arrow>,
	<item:xtraarrows:iron_magnetic_arrow>,

	<item:berry_good:music_disc_fox>,
	<item:apotheosis:obsidian_arrow>,
	<item:apotheosis:explosive_arrow>,
	<item:apotheosis:diamond_mining_arrow>,
	<item:apotheosis:iron_mining_arrow>,
	
	// Sully's Mod - Unimplemented item
	
	<item:sullysmod:glass_vial>,
	
	// Twilight Forest - Unimplemented items
	
	<item:twilightforest:brittle_potion_flask>,
	<item:twilightforest:greater_potion_flask>,
	<item:twilightforest:naga_courtyard_miniature_structure>,
	<item:twilightforest:twilight_portal_miniature_structure>,
	<item:twilightforest:cinder_log>,
	<item:twilightforest:lich_tower_miniature_structure>,
	<item:twilightforest:cinder_furnace>,
	<item:twilightforest:ore_meter>,
	<item:twilightforest:slider>,
	<item:twilightforest:cinder_wood>,
	
	// Create Conntected - Control Chips and "high tech" don't fit this pack/game; we've replaced what it's used in with a clock item
	
	<item:create_connected:incomplete_control_chip>,
	
	// Sully's Mod - Some overlap with Friends & Foes
	
	<item:sullysmod:copper_button>,
	<item:sullysmod:exposed_copper_button>,
	<item:sullysmod:weathered_copper_button>,
	<item:sullysmod:oxidized_copper_button>,
	<item:sullysmod:waxed_copper_button>,
	<item:sullysmod:waxed_exposed_copper_button>,
	<item:sullysmod:waxed_weathered_copper_button>,
	<item:sullysmod:waxed_oxidized_copper_button>,
	
	// Create Bells and Whistles - Don't like the look of the pilots, may bring them back later
	
	<item:bellsandwhistles:polished_asurine_pilot>,
	<item:bellsandwhistles:polished_veridium_pilot>,
	<item:bellsandwhistles:polished_ochrum_pilot>,
	<item:bellsandwhistles:polished_crimsite_pilot>,
	<item:bellsandwhistles:polished_scorchia_pilot>,
	<item:bellsandwhistles:polished_scoria_pilot>,
	<item:bellsandwhistles:polished_limestone_pilot>,
	<item:bellsandwhistles:polished_calcite_pilot>,
	<item:bellsandwhistles:polished_tuff_pilot>,
	<item:bellsandwhistles:andesite_pilot>,
	<item:bellsandwhistles:brass_pilot>,
	<item:bellsandwhistles:copper_pilot>,
	<item:bellsandwhistles:metal_pilot>,
	<item:bellsandwhistles:polished_andesite_pilot>,
	<item:bellsandwhistles:polished_granite_pilot>,
	<item:bellsandwhistles:polished_diorite_pilot>,
	<item:bellsandwhistles:polished_deepslate_pilot>,
	<item:bellsandwhistles:polished_dripstone_pilot>,
	
	// Wither Storm Mod - Having command block versions of every tool in every class is bloat
	
	<item:witherstormmod:wooden_command_block_sword>,
	<item:witherstormmod:wooden_command_block_pickaxe>,
	<item:witherstormmod:wooden_command_block_axe>,
	<item:witherstormmod:wooden_command_block_shovel>,
	<item:witherstormmod:wooden_command_block_hoe>,
	<item:witherstormmod:stone_command_block_sword>,
	<item:witherstormmod:stone_command_block_pickaxe>,
	<item:witherstormmod:stone_command_block_axe>,
	<item:witherstormmod:stone_command_block_shovel>,
	<item:witherstormmod:stone_command_block_hoe>,
	<item:witherstormmod:iron_command_block_sword>,
	<item:witherstormmod:iron_command_block_pickaxe>,
	<item:witherstormmod:iron_command_block_axe>,
	<item:witherstormmod:iron_command_block_shovel>,
	<item:witherstormmod:iron_command_block_hoe>,
	<item:witherstormmod:gold_command_block_sword>,
	<item:witherstormmod:gold_command_block_pickaxe>,
	<item:witherstormmod:gold_command_block_axe>,
	<item:witherstormmod:gold_command_block_shovel>,
	<item:witherstormmod:gold_command_block_hoe>,
	
	// Just Hammers - I don't want to make hammers for every tool class but still want the functionality
	
	<item:justhammers:stone_hammer>,
	<item:justhammers:gold_hammer>,
	<item:justhammers:diamond_hammer>,
	<item:justhammers:netherite_hammer>,
	<item:justhammers:stone_impact_hammer>,
	<item:justhammers:gold_impact_hammer>,
	<item:justhammers:diamond_impact_hammer>,
	<item:justhammers:netherite_impact_hammer>,
	<item:justhammers:stone_reinforced_hammer>,
	<item:justhammers:iron_reinforced_hammer>,
	<item:justhammers:gold_reinforced_hammer>,
	<item:justhammers:diamond_reinforced_hammer>,
	<item:justhammers:netherite_reinforced_hammer>,
	<item:justhammers:stone_reinforced_impact_hammer>,
	<item:justhammers:stone_destructor_hammer>,
	<item:justhammers:netherite_reinforced_impact_hammer>,
	<item:justhammers:diamond_reinforced_impact_hammer>,
	<item:justhammers:gold_reinforced_impact_hammer>,
	<item:justhammers:iron_reinforced_impact_hammer>,
	<item:justhammers:iron_destructor_hammer>,
	<item:justhammers:gold_destructor_hammer>,
	<item:justhammers:diamond_destructor_hammer>,
	<item:justhammers:netherite_destructor_hammer>,
	<item:justhammers:impact_core>,
	<item:justhammers:destructor_core>,
	<item:justhammers:reinforced_impact_core>,
	<item:justhammers:reinforced_core>,
	
	// Friends and Foes - Overlap with Better Beekeeping
	
	<item:friendsandfoes:spruce_beehive>,
	<item:friendsandfoes:dark_oak_beehive>,
	<item:friendsandfoes:dark_oak_beehive>,
	<item:friendsandfoes:warped_beehive>,
	<item:friendsandfoes:jungle_beehive>,
	<item:friendsandfoes:acacia_beehive>,
	<item:friendsandfoes:birch_beehive>,
	<item:friendsandfoes:bamboo_beehive>,
	
	// Citadel - Debug/not real items
	
	<item:citadel:debug>,
	<item:citadel:citadel_book>,
	<item:citadel:effect_item>,
	<item:citadel:fancy_item>,
	<item:citadel:icon_item>,
	
	// Create DD - Most of Create DD is random undocumented things that I don't want and doesn't fit this pack/game
	
	<item:create_dd:gilded_rose_sword>,
	<item:create_dd:gilded_rose_pickaxe>,
	<item:create_dd:gilded_rose_axe>,
	<item:create_dd:gilded_rose_shovel>,
	<item:create_dd:gilded_rose_hoe>,
	<item:create_dd:splashing_sail>,
	<item:create_dd:haunting_sail>,
	<item:create_dd:smoking_sail>,
	<item:create_dd:blasting_sail>,
	<item:create_dd:seething_sail>,
	<item:create_dd:freezing_sail>,
	<item:create_dd:sanding_sail>,
	<item:create_dd:black_asphalt_block>,
	<item:create_dd:white_asphalt_block>,
	<item:create_dd:blue_asphalt_block>,
	<item:create_dd:light_blue_asphalt_block>,
	<item:create_dd:red_asphalt_block>,
	<item:create_dd:green_asphalt_block>,
	<item:create_dd:light_gray_asphalt_block>,
	<item:create_dd:gray_asphalt_block>,
	<item:create_dd:yellow_asphalt_block>,
	<item:create_dd:magenta_asphalt_block>,
	<item:create_dd:pink_asphalt_block>,
	<item:create_dd:lime_asphalt_block>,
	<item:create_dd:brown_asphalt_block>,
	<item:create_dd:orange_asphalt_block>,
	<item:create_dd:cyan_asphalt_block>,
	<item:create_dd:purple_asphalt_block>,
	<item:create_dd:raw_rubber_block>,
	<item:create_dd:rubber_block>,
	<item:create_dd:raw_rubber>,
	<item:create_dd:rubber>,
	<item:create_dd:padded_rubber>,
	<item:create_dd:padded_tiled_rubber>,
	<item:create_dd:padded_mosaic_rubber>,
	<item:create_dd:padded_rubber_slab>,
	<item:create_dd:padded_rubber_stairs>,
	<item:create_dd:raw_padded_rubber>,
	<item:create_dd:raw_padded_tiled_rubber>,
	<item:create_dd:raw_padded_mosaic_rubber>,
	<item:create_dd:raw_padded_rubber_slab>,
	<item:create_dd:raw_padded_rubber_stairs>,
	<item:create_dd:black_padded_tiled_rubber>,
	<item:create_dd:black_padded_rubber>,
	<item:create_dd:black_padded_rubber_stairs>,
	<item:create_dd:black_padded_rubber_slab>,
	<item:create_dd:black_padded_mosaic_rubber>,
	<item:create_dd:white_padded_tiled_rubber>,
	<item:create_dd:white_padded_rubber>,
	<item:create_dd:white_padded_rubber_stairs>,
	<item:create_dd:white_padded_rubber_slab>,
	<item:create_dd:white_padded_mosaic_rubber>,
	<item:create_dd:blue_padded_tiled_rubber>,
	<item:create_dd:blue_padded_rubber>,
	<item:create_dd:blue_padded_rubber_stairs>,
	<item:create_dd:blue_padded_rubber_slab>,
	<item:create_dd:blue_padded_mosaic_rubber>,
	<item:create_dd:light_blue_padded_tiled_rubber>,
	<item:create_dd:light_blue_padded_rubber>,
	<item:create_dd:light_blue_padded_rubber_stairs>,
	<item:create_dd:light_blue_padded_rubber_slab>,
	<item:create_dd:light_blue_padded_mosaic_rubber>,
	<item:create_dd:red_padded_tiled_rubber>,
	<item:create_dd:red_padded_rubber>,
	<item:create_dd:red_padded_rubber_stairs>,
	<item:create_dd:red_padded_rubber_slab>,
	<item:create_dd:red_padded_mosaic_rubber>,
	<item:create_dd:green_padded_tiled_rubber>,
	<item:create_dd:green_padded_rubber>,
	<item:create_dd:green_padded_rubber_stairs>,
	<item:create_dd:green_padded_rubber_slab>,
	<item:create_dd:green_padded_mosaic_rubber>,
	<item:create_dd:lime_padded_tiled_rubber>,
	<item:create_dd:lime_padded_rubber>,
	<item:create_dd:lime_padded_rubber_stairs>,
	<item:create_dd:lime_padded_rubber_slab>,
	<item:create_dd:lime_padded_mosaic_rubber>,
	<item:create_dd:pink_padded_tiled_rubber>,
	<item:create_dd:pink_padded_rubber>,
	<item:create_dd:pink_padded_rubber_stairs>,
	<item:create_dd:pink_padded_rubber_slab>,
	<item:create_dd:pink_padded_mosaic_rubber>,
	<item:create_dd:magenta_padded_tiled_rubber>,
	<item:create_dd:magenta_padded_rubber>,
	<item:create_dd:magenta_padded_rubber_stairs>,
	<item:create_dd:magenta_padded_rubber_slab>,
	<item:create_dd:magenta_padded_mosaic_rubber>,
	<item:create_dd:yellow_padded_tiled_rubber>,
	<item:create_dd:yellow_padded_rubber>,
	<item:create_dd:yellow_padded_rubber_stairs>,
	<item:create_dd:yellow_padded_rubber_slab>,
	<item:create_dd:yellow_padded_mosaic_rubber>,
	<item:create_dd:gray_padded_tiled_rubber>,
	<item:create_dd:gray_padded_rubber>,
	<item:create_dd:gray_padded_rubber_stairs>,
	<item:create_dd:gray_padded_rubber_slab>,
	<item:create_dd:gray_padded_mosaic_rubber>,
	<item:create_dd:brown_padded_tiled_rubber>,
	<item:create_dd:brown_padded_rubber>,
	<item:create_dd:brown_padded_rubber_stairs>,
	<item:create_dd:brown_padded_rubber_slab>,
	<item:create_dd:brown_padded_mosaic_rubber>,
	<item:create_dd:cyan_padded_tiled_rubber>,
	<item:create_dd:cyan_padded_rubber>,
	<item:create_dd:cyan_padded_rubber_stairs>,
	<item:create_dd:cyan_padded_rubber_slab>,
	<item:create_dd:cyan_padded_mosaic_rubber>,
	<item:create_dd:purple_padded_tiled_rubber>,
	<item:create_dd:purple_padded_rubber>,
	<item:create_dd:purple_padded_rubber_stairs>,
	<item:create_dd:purple_padded_rubber_slab>,
	<item:create_dd:purple_padded_mosaic_rubber>,
	<item:create_dd:orange_padded_tiled_rubber>,
	<item:create_dd:orange_padded_rubber>,
	<item:create_dd:orange_padded_rubber_stairs>,
	<item:create_dd:orange_padded_rubber_slab>,
	<item:create_dd:orange_padded_mosaic_rubber>,
	<item:create_dd:cut_dolomite>,
	<item:create_dd:polished_cut_dolomite>,
	<item:create_dd:cut_dolomite_bricks>,
	<item:create_dd:small_dolomite_bricks>,
	<item:create_dd:layered_dolomite>,
	<item:create_dd:dolomite_pillar>,
	<item:create_dd:dolomite>,
	<item:create_dd:cut_dolomite_stairs>,
	<item:create_dd:cut_dolomite_slab>,
	<item:create_dd:cut_dolomite_wall>,
	<item:create_dd:polished_cut_dolomite_stairs>,
	<item:create_dd:polished_cut_dolomite_slab>,
	<item:create_dd:polished_cut_dolomite_wall>,
	<item:create_dd:cut_dolomite_brick_stairs>,
	<item:create_dd:cut_dolomite_brick_slab>,
	<item:create_dd:cut_dolomite_brick_wall>,
	<item:create_dd:small_dolomite_brick_stairs>,
	<item:create_dd:small_dolomite_brick_slab>,
	<item:create_dd:small_dolomite_brick_wall>,
	<item:create_dd:cut_gabbro>,
	<item:create_dd:polished_cut_gabbro>,
	<item:create_dd:cut_gabbro_bricks>,
	<item:create_dd:small_gabbro_bricks>,
	<item:create_dd:layered_gabbro>,
	<item:create_dd:gabbro_pillar>,
	<item:create_dd:gabbro>,
	<item:create_dd:cut_gabbro_stairs>,
	<item:create_dd:cut_gabbro_slab>,
	<item:create_dd:cut_gabbro_wall>,
	<item:create_dd:polished_cut_gabbro_stairs>,
	<item:create_dd:polished_cut_gabbro_slab>,
	<item:create_dd:polished_cut_gabbro_wall>,
	<item:create_dd:cut_gabbro_brick_stairs>,
	<item:create_dd:cut_gabbro_brick_slab>,
	<item:create_dd:cut_gabbro_brick_wall>,
	<item:create_dd:small_gabbro_brick_stairs>,
	<item:create_dd:small_gabbro_brick_slab>,
	<item:create_dd:small_gabbro_brick_wall>,
	<item:create_dd:kinetic_mechanism>,
	<item:create_dd:integrated_mechanism>,
	<item:create_dd:calculation_mechanism>,
	<item:create_dd:infernal_mechanism>,
	<item:create_dd:sealed_mechanism>,
	<item:create_dd:abstruse_mechanism>,
	<item:create_dd:incomplete_kinetic_mechanism>,
	<item:create_dd:incomplete_integrated_mechanism>,
	<item:create_dd:incomplete_abstruse_mechanism>,
	<item:create_dd:incomplete_calculation_mechanism>,
	<item:create_dd:incomplete_infernal_mechanism>,
	<item:create_dd:incomplete_sealed_mechanism>,
	<item:v_slab_compat:create_dd/yellow_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/pink_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/raw_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/cyan_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/red_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/blue_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/lime_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/orange_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/black_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/purple_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/brown_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/gray_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/light_blue_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/magenta_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/white_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/green_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/light_gray_padded_rubber_vertical_slab>,
	<item:v_slab_compat:create_dd/cut_gabbro_brick_vertical_slab>,
	<item:v_slab_compat:create_dd/polished_cut_gabbro_vertical_slab>,
	<item:v_slab_compat:create_dd/cut_gabbro_vertical_slab>,
	<item:v_slab_compat:create_dd/small_gabbro_brick_vertical_slab>,
	<item:v_slab_compat:create_dd/cut_dolomite_vertical_slab>,
	<item:v_slab_compat:create_dd/cut_dolomite_brick_vertical_slab>,
	<item:v_slab_compat:create_dd/small_dolomite_brick_vertical_slab>,
	<item:v_slab_compat:create_dd/polished_cut_dolomite_vertical_slab>,
	
	// Every Comp - Some overlap
	
	<item:everycomp:fd/twilightforest/twilight_oak_cabinet>,
	<item:everycomp:fd/twilightforest/canopy_cabinet>,
	<item:everycomp:fd/twilightforest/mangrove_cabinet>,
	<item:everycomp:fd/twilightforest/dark_cabinet>,
	<item:everycomp:fd/twilightforest/time_cabinet>,
	<item:everycomp:fd/twilightforest/transformation_cabinet>,
	<item:everycomp:fd/twilightforest/mining_cabinet>,
	<item:everycomp:fd/twilightforest/sorting_cabinet>,
	
	// Nether's Delight - Don't like the Machetes because they have no compat
	
	<item:nethersdelight:iron_machete>,
	<item:nethersdelight:golden_machete>,
	<item:nethersdelight:diamond_machete>,
	<item:nethersdelight:netherite_machete>,
	
	// Mystic's Biomes - Overlap with vanilla (why) and Autumnity, plus some bloat
	
	<item:mysticsbiomes:maple_leaves>,
	<item:mysticsbiomes:maple_leaf_pile>,
	<item:mysticsbiomes:maple_sapling>,
	<item:mysticsbiomes:orange_maple_leaves>,
	<item:mysticsbiomes:orange_maple_leaf_pile>,
	<item:mysticsbiomes:orange_maple_sapling>,
	<item:mysticsbiomes:yellow_maple_leaves>,
	<item:mysticsbiomes:yellow_maple_leaf_pile>,
	<item:mysticsbiomes:yellow_maple_sapling>,
	<item:mysticsbiomes:maple_log>,
	<item:mysticsbiomes:white_maple_log>,
	<item:mysticsbiomes:stripped_maple_log>,
	<item:mysticsbiomes:maple_wood>,
	<item:mysticsbiomes:white_maple_wood>,
	<item:mysticsbiomes:stripped_maple_wood>,
	<item:mysticsbiomes:maple_planks>,
	<item:mysticsbiomes:maple_stairs>,
	<item:mysticsbiomes:maple_slab>,
	<item:mysticsbiomes:maple_fence>,
	<item:mysticsbiomes:maple_fence_gate>,
	<item:mysticsbiomes:maple_button>,
	<item:mysticsbiomes:maple_pressure_plate>,
	<item:mysticsbiomes:maple_trapdoor>,
	<item:mysticsbiomes:maple_door>,
	<item:mysticsbiomes:maple_sign>,
	<item:mysticsbiomes:maple_hanging_sign>,
	<item:mysticsbiomes:maple_boat>,
	<item:mysticsbiomes:maple_chest_boat>,
	<item:mysticsbiomes:pink_cherry_blossoms>,
	<item:mysticsbiomes:pink_cherry_blossom_sapling>,
	<item:mysticsbiomes:white_cherry_blossoms>,
	<item:mysticsbiomes:white_cherry_blossom_sapling>,
	<item:mysticsbiomes:white_cherry_blossom_sapling>,
	<item:mysticsbiomes:cherry_log>,
	<item:mysticsbiomes:stripped_cherry_log>,
	<item:mysticsbiomes:cherry_wood>,
	<item:mysticsbiomes:stripped_cherry_wood>,
	<item:mysticsbiomes:cherry_planks>,
	<item:mysticsbiomes:cherry_stairs>,
	<item:mysticsbiomes:cherry_slab>,
	<item:mysticsbiomes:cherry_planks>,
	<item:mysticsbiomes:cherry_stairs>,
	<item:mysticsbiomes:cherry_slab>,
	<item:mysticsbiomes:cherry_fence>,
	<item:mysticsbiomes:cherry_fence_gate>,
	<item:mysticsbiomes:cherry_button>,
	<item:mysticsbiomes:cherry_pressure_plate>,
	<item:mysticsbiomes:cherry_trapdoor>,
	<item:mysticsbiomes:cherry_door>,
	<item:mysticsbiomes:cherry_sign>,
	<item:mysticsbiomes:cherry_hanging_sign>,
	<item:mysticsbiomes:cherry_boat>,
	<item:mysticsbiomes:cherry_chest_boat>,
	<item:mysticsbiomes:pink_frosted_cake>,
	<item:mysticsbiomes:orange_frosted_cake>,
	<item:mysticsbiomes:yellow_frosted_cake>,
	<item:mysticsbiomes:lime_frosted_cake>,
	<item:mysticsbiomes:cyan_frosted_cake>,
	<item:mysticsbiomes:purple_frosted_cake>,
	
	// Create Mechanical Spawner - We are only using the mechanical spawner for the Wither Storm
	
	<item:create_mechanical_spawner:spawn_fluid_random_bucket>,
	<item:create_mechanical_spawner:spawn_fluid_blaze_bucket>,
	<item:create_mechanical_spawner:spawn_fluid_creeper_bucket>,
	<item:create_mechanical_spawner:spawn_fluid_enderman_bucket>,
	<item:create_mechanical_spawner:spawn_fluid_magma_cube_bucket>,
	<item:create_mechanical_spawner:spawn_fluid_skeleton_bucket>,
	<item:create_mechanical_spawner:spawn_fluid_slime_bucket>,
	<item:create_mechanical_spawner:spawn_fluid_spider_bucket>,
	<item:create_mechanical_spawner:spawn_fluid_zombie_bucket>,
	
	// Create Connected - Just don't want the discs
	
	<item:create_connected:music_disc_elevator>,
	<item:create_connected:music_disc_interlude>,
	
	<item:moonlight:placeable_item>
];

for input in completeItemRemovalByItem {

	recipes.remove(input);
	Jei.hideIngredient(input);
	
	for managerEntry in <tagmanager:items>.tags {
		
		if (managerEntry.contains(input.registryName)) {
			
			managerEntry.removeId(input.registryName);
			
		}
		
	}
	
	
	<tag:items:c:hidden_from_recipe_viewers>.add(input);
	
}

//<recipetype:witherstormmod:anvil>.removeAll();
