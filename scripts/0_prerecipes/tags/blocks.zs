/* Imports */

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.type.UnknownTag;
import crafttweaker.api.tag.manager.ITagManager;

import crafttweaker.api.block.Block;
import crafttweaker.api.block.BlockState;

import stdlib.List;

/* Variables */

val blockTagEntries as Block[][KnownTag<Block>] = {
	
	// Aether
	/// Add Wither Storm's Hardened Flesh Block to blacklists to prevent Bowels exploits
	
	<tag:blocks:aether:slider_unbreakable> : [ <block:witherstormmod:hardened_flesh_block> ],
	<tag:blocks:aether:valkyrie_queen_unbreakable> : [ <block:witherstormmod:hardened_flesh_block> ],
	<tag:blocks:aether:ruined_portal_ground_replaceable> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_stone>, <block:witherstormmod:tainted_sandstone> ],
	<tag:blocks:aether:gravitite_ability_blacklist> : [ <block:witherstormmod:tainted_fence_gate>, <block:witherstormmod:tainted_button>, <block:witherstormmod:tainted_trapdoor>, <block:witherstormmod:tainted_stone_button> ],
	
	// Chalk
	/// Prevent drawing on some non-solid blocks
	
	<tag:blocks:chalk:chalk_cannot_draw_on> : [ <block:witherstormmod:tainted_leaves> ],
	
	// Create
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:create:fan_transparent> : [ <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:create:ore_override_stone> : [ <block:witherstormmod:tainted_stone> ],
	<tag:blocks:create:safe_nbt> : [ <block:witherstormmod:tainted_sign> ],
	<tag:blocks:create:brittle> : [ <block:witherstormmod:tainted_door> ],
	<tag:blocks:create:wrench_pickup> : [ <block:witherstormmod:tainted_button>, <block:witherstormmod:tainted_stone_button> ],
	<tag:blocks:create:movable_empty_collider> : [ <block:witherstormmod:tainted_fence_gate> ],
	
	// Create Dreams and Desires - Set up custom catalysts for bulk processing
	
	<tag:blocks:create_dd:fan_processing_catalysts/seething> : [ <block:deep_aether:chromatic_aercloud> ],
	<tag:blocks:create_dd:fan_processing_catalysts/freezing> : [ <block:ascended_quark:polished_icestone> ],
	<tag:blocks:create_dd:fan_processing_catalysts/sanding> : [ <block:minecraft:sand>, <block:minecraft:red_sand>, <block:mysticsbiomes:lush_sand> ],
	<tag:blocks:create_dd:industrial_fan_transparent> : [ <block:witherstormmod:tainted_leaves> ],
	
	// CraftTweaker
	
	<tag:blocks:crafttweaker:clouds> : [ <block:aether:cold_aercloud>, <block:aether:blue_aercloud>, <block:aether:golden_aercloud>, <block:twilightforest:wispy_cloud>, <block:twilightforest:fluffy_cloud>, <block:twilightforest:rainy_cloud>, <block:twilightforest:snowy_cloud>, <block:deep_aether:sterling_aercloud>, <block:deep_aether:chromatic_aercloud>],
	<tag:blocks:crafttweaker:mushrooms> : [ <block:minecraft:brown_mushroom_block>, <block:minecraft:red_mushroom_block>, <block:minecraft:mushroom_stem> ],
	
	// Cogs of Carminite 
	/// Allow Deep Aether root blocks to be pulled by the Root Puller
	
	<tag:blocks:cogsofcarminite:roots> : [ <block:deep_aether:yagroot_roots>, <block:deep_aether:muddy_yagroot_roots> ],
	
	// Common 
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:c:stones> : [ <block:witherstormmod:tainted_stone> ],
	<tag:blocks:c:sandstone/blocks> : [ <block:witherstormmod:tainted_chiseled_sandstone>, <block:witherstormmod:tainted_sandstone>, <block:witherstormmod:tainted_cut_sandstone> ],
	<tag:blocks:c:glass_blocks> : [ <block:witherstormmod:tainted_glass> ],
	<tag:blocks:c:glass_panes> : [ <block:witherstormmod:tainted_glass_pane> ],
	
	// Danger Close
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:danger_close:torch_burn_danger> : [ <block:witherstormmod:tainted_torch> ],
	
	// Enderman Overhaul
	
	<tag:blocks:endermanoverhaul:cave_enderman_holdable> : [ <block:witherstormmod:tainted_stone> ],
	
	// Farmer's Delight
	/// Allow Absent by Design wool blocks to be minable with knives
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:farmersdelight:mineable/knife> : [ <block:absentbydesign:stairs_wool_purple>, <block:absentbydesign:stairs_wool_red>, <block:absentbydesign:stairs_wool_silver>, <block:absentbydesign:stairs_wool_white>, <block:absentbydesign:stairs_wool_yellow>, <block:absentbydesign:slab_wool_black>, <block:absentbydesign:slab_wool_blue>, <block:absentbydesign:slab_wool_brown>, <block:absentbydesign:slab_wool_gray>, <block:absentbydesign:slab_wool_cyan>, <block:absentbydesign:slab_wool_green>, <block:absentbydesign:slab_wool_light_blue>, <block:absentbydesign:slab_wool_lime>, <block:absentbydesign:slab_wool_magenta>, <block:absentbydesign:stairs_wool_blue>, <block:absentbydesign:stairs_wool_black>, <block:absentbydesign:slab_wool_yellow>, <block:absentbydesign:slab_wool_white>, <block:absentbydesign:slab_wool_silver>, <block:absentbydesign:slab_wool_red>, <block:absentbydesign:slab_wool_purple>, <block:absentbydesign:slab_wool_pink>, <block:absentbydesign:slab_wool_orange>, <block:absentbydesign:stairs_wool_brown>, <block:absentbydesign:stairs_wool_cyan>, <block:absentbydesign:stairs_wool_gray>, <block:absentbydesign:stairs_wool_green>, <block:absentbydesign:stairs_wool_light_blue>, <block:absentbydesign:stairs_wool_lime>, <block:absentbydesign:stairs_wool_magenta>, <block:absentbydesign:stairs_wool_orange>, <block:absentbydesign:stairs_wool_pink> ],
	<tag:blocks:farmersdelight:compost_activators> : [ <block:witherstormmod:tainted_mushroom> ],
	<tag:blocks:farmersdelight:terrain> : [ <block:witherstormmod:tainted_dirt> ],
	
	// Forge
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:forge:ore_bearing_ground/stone> : [ <block:witherstormmod:tainted_stone> ],
	<tag:blocks:forge:sandstone> : [ <block:witherstormmod:tainted_sandstone>, <block:witherstormmod:tainted_chiseled_sandstone>, <block:witherstormmod:tainted_cut_sandstone> ],
	<tag:blocks:forge:fence_gates> : [ <block:witherstormmod:tainted_fence_gate> ],
	<tag:blocks:forge:fence_gates/wooden> : [ <block:witherstormmod:tainted_fence_gate> ],
	<tag:blocks:forge:glass/silica> : [ <block:witherstormmod:tainted_glass> ],
	<tag:blocks:forge:glass_panes> : [ <block:witherstormmod:tainted_glass_pane> ],
	
	// Friends and Foes
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:friendsandfoes:maulers_spawnable_on> : [ <block:witherstormmod:tainted_dirt> ],
	
	// Gravestone
	
	<tag:blocks:gravestone:grave_replaceable> : [ <block:witherstormmod:tainted_mushroom> ],
	
	// Minecraft
	/// Allow Absent by Design wool blocks to affect vibrations
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:minecraft:all_signs> : [ <block:witherstormmod:tainted_sign> ],
	<tag:blocks:minecraft:wall_post_override> : [ <block:witherstormmod:tainted_sign>, <block:witherstormmod:tainted_torch> ],
	<tag:blocks:minecraft:occludes_vibration_signals> : [<block:absentbydesign:stairs_wool_purple>, <block:absentbydesign:stairs_wool_red>, <block:absentbydesign:stairs_wool_silver>, <block:absentbydesign:stairs_wool_white>, <block:absentbydesign:stairs_wool_yellow>, <block:absentbydesign:slab_wool_black>, <block:absentbydesign:slab_wool_blue>, <block:absentbydesign:slab_wool_brown>, <block:absentbydesign:slab_wool_gray>, <block:absentbydesign:slab_wool_cyan>, <block:absentbydesign:slab_wool_green>, <block:absentbydesign:slab_wool_light_blue>, <block:absentbydesign:slab_wool_lime>, <block:absentbydesign:slab_wool_magenta>, <block:absentbydesign:stairs_wool_blue>, <block:absentbydesign:stairs_wool_black>, <block:absentbydesign:slab_wool_yellow>, <block:absentbydesign:slab_wool_white>, <block:absentbydesign:slab_wool_silver>, <block:absentbydesign:slab_wool_red>, <block:absentbydesign:slab_wool_purple>, <block:absentbydesign:slab_wool_pink>, <block:absentbydesign:slab_wool_orange>, <block:absentbydesign:stairs_wool_brown>, <block:absentbydesign:stairs_wool_cyan>, <block:absentbydesign:stairs_wool_gray>, <block:absentbydesign:stairs_wool_green>, <block:absentbydesign:stairs_wool_light_blue>, <block:absentbydesign:stairs_wool_lime>, <block:absentbydesign:stairs_wool_magenta>, <block:absentbydesign:stairs_wool_orange>, <block:absentbydesign:stairs_wool_pink> ],
	<tag:blocks:minecraft:dampens_vibrations> : [ <block:absentbydesign:stairs_wool_purple>, <block:absentbydesign:stairs_wool_red>, <block:absentbydesign:stairs_wool_silver>, <block:absentbydesign:stairs_wool_white>, <block:absentbydesign:stairs_wool_yellow>, <block:absentbydesign:slab_wool_black>, <block:absentbydesign:slab_wool_blue>, <block:absentbydesign:slab_wool_brown>, <block:absentbydesign:slab_wool_gray>, <block:absentbydesign:slab_wool_cyan>, <block:absentbydesign:slab_wool_green>, <block:absentbydesign:slab_wool_light_blue>, <block:absentbydesign:slab_wool_lime>, <block:absentbydesign:slab_wool_magenta>, <block:absentbydesign:stairs_wool_blue>, <block:absentbydesign:stairs_wool_black>, <block:absentbydesign:slab_wool_yellow>, <block:absentbydesign:slab_wool_white>, <block:absentbydesign:slab_wool_silver>, <block:absentbydesign:slab_wool_red>, <block:absentbydesign:slab_wool_purple>, <block:absentbydesign:slab_wool_pink>, <block:absentbydesign:slab_wool_orange>, <block:absentbydesign:stairs_wool_brown>, <block:absentbydesign:stairs_wool_cyan>, <block:absentbydesign:stairs_wool_gray>, <block:absentbydesign:stairs_wool_green>, <block:absentbydesign:stairs_wool_light_blue>, <block:absentbydesign:stairs_wool_lime>, <block:absentbydesign:stairs_wool_magenta>, <block:absentbydesign:stairs_wool_orange>, <block:absentbydesign:stairs_wool_pink> ],
	<tag:blocks:minecraft:leaves> : [ <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:minecraft:sword_efficient> : [ <block:witherstormmod:tainted_leaves>, <block:witherstormmod:tainted_pumpkin> ],
	<tag:blocks:minecraft:snow_layer_can_survive_on> : [ <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:minecraft:lava_pool_stone_cannot_replace> : [ <block:witherstormmod:tainted_log>, <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:minecraft:replaceable_by_trees> : [ <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:minecraft:parrots_spawnable_on> : [ <block:witherstormmod:tainted_log>, <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:minecraft:bee_growables> : [ <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:minecraft:enderman_holdable> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_mushroom>, <block:witherstormmod:tainted_pumpkin> ],
	<tag:blocks:minecraft:snaps_goat_horn> : [ <block:witherstormmod:tainted_log>, <block:witherstormmod:tainted_stone> ],
	<tag:blocks:minecraft:sculk_replaceable> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_stone>,<block:witherstormmod:tainted_sandstone> ],
	<tag:blocks:minecraft:stone_ore_replaceables> : [ <block:witherstormmod:tainted_stone> ],
	<tag:blocks:minecraft:moss_replaceable> : [ <block:witherstormmod:tainted_stone>, <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:minecraft:overworld_carver_replaceables> : [ <block:witherstormmod:tainted_stone> ],
	<tag:blocks:minecraft:lush_ground_replaceable> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_stone> ],
	<tag:blocks:minecraft:nether_carver_replaceables> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_stone> ],
	<tag:blocks:minecraft:signs> : [ <block:witherstormmod:tainted_sign> ],
	<tag:blocks:minecraft:wooden_doors> : [ <block:witherstormmod:tainted_door> ],
	<tag:blocks:minecraft:doors> : [ <block:witherstormmod:tainted_door> ],
	<tag:blocks:minecraft:standing_signs> : [ <block:witherstormmod:tainted_sign> ],
	<tag:blocks:minecraft:overworld_carver_replaceables> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_stone>, <block:witherstormmod:tainted_sandstone> ],
	<tag:blocks:minecraft:completes_find_tree_tutorial> : [ <block:witherstormmod:tainted_log>, <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:minecraft:replaceable_by_trees> : [ <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:minecraft:wooden_buttons> : [ <block:witherstormmod:tainted_button> ],
	<tag:blocks:minecraft:buttons> : [ <block:witherstormmod:tainted_button>, <block:witherstormmod:tainted_stone_button> ],
	<tag:blocks:minecraft:trapdoors> : [ <block:witherstormmod:tainted_trapdoor> ],
	<tag:blocks:minecraft:wooden_trapdoors> : [ <block:witherstormmod:tainted_trapdoor> ],
	<tag:blocks:minecraft:unstable_bottom_center> : [ <block:witherstormmod:tainted_fence_gate> ],
	<tag:blocks:minecraft:fence_gates> : [ <block:witherstormmod:tainted_fence_gate> ],
	<tag:blocks:minecraft:bamboo_plantable_on> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:minecraft:sniffer_diggable_block> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:minecraft:big_dripleaf_placeable> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:minecraft:azalea_grows_on> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:minecraft:azalea_root_replaceable> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:minecraft:convertable_to_mud> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:minecraft:dirt> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:minecraft:dead_bush_may_place_on> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:minecraft:stone_buttons> : [ <block:witherstormmod:tainted_stone_button> ],
	<tag:blocks:minecraft:logs> : [ <block:witherstormmod:tainted_log> ],
	<tag:blocks:minecraft:logs_that_burn> : [ <block:witherstormmod:tainted_log> ],
	
	// Nullscape
	/// Worldgen intergration with Update Aquatic and Quark
	
	<tag:blocks:nullscape:rift_blocks> : [ <block:quark:myalite> ],
	<tag:blocks:nullscape:crystal_crying> : [ <block:quark:myalite> ],
	<tag:blocks:nullscape:crystal_amethyst> : [ <block:quark:myalite> ],
	<tag:blocks:nullscape:amethyst_dx> : [ <block:quark:myalite> ],
	<tag:blocks:nullscape:dead_corals> : [ <block:upgrade_aquatic:dead_acan_coral>, <block:upgrade_aquatic:dead_finger_coral>, <block:upgrade_aquatic:dead_star_coral>, <block:upgrade_aquatic:dead_moss_coral>, <block:upgrade_aquatic:dead_petal_coral>, <block:upgrade_aquatic:dead_branch_coral>, <block:upgrade_aquatic:dead_rock_coral>, <block:upgrade_aquatic:dead_pillow_coral>, <block:upgrade_aquatic:dead_silk_coral>, <block:upgrade_aquatic:dead_chrome_coral> ],
	<tag:blocks:nullscape:coral> : [ <block:upgrade_aquatic:dead_acan_coral>, <block:upgrade_aquatic:dead_finger_coral>, <block:upgrade_aquatic:dead_star_coral>, <block:upgrade_aquatic:dead_moss_coral>, <block:upgrade_aquatic:dead_petal_coral>, <block:upgrade_aquatic:dead_branch_coral>, <block:upgrade_aquatic:dead_rock_coral>, <block:upgrade_aquatic:dead_pillow_coral>, <block:upgrade_aquatic:dead_silk_coral>, <block:upgrade_aquatic:dead_chrome_coral> ],
	<tag:blocks:nullscape:amethyst_dx> : [ <block:upgrade_aquatic:dead_acan_coral>, <block:upgrade_aquatic:dead_finger_coral>, <block:upgrade_aquatic:dead_star_coral>, <block:upgrade_aquatic:dead_moss_coral>, <block:upgrade_aquatic:dead_petal_coral>, <block:upgrade_aquatic:dead_branch_coral>, <block:upgrade_aquatic:dead_rock_coral>, <block:upgrade_aquatic:dead_pillow_coral>, <block:upgrade_aquatic:dead_silk_coral>, <block:upgrade_aquatic:dead_chrome_coral> ],
	<tag:blocks:nullscape:amethyst_cut> : [ <block:upgrade_aquatic:dead_acan_coral>, <block:upgrade_aquatic:dead_finger_coral>, <block:upgrade_aquatic:dead_star_coral>, <block:upgrade_aquatic:dead_moss_coral>, <block:upgrade_aquatic:dead_petal_coral>, <block:upgrade_aquatic:dead_branch_coral>, <block:upgrade_aquatic:dead_rock_coral>, <block:upgrade_aquatic:dead_pillow_coral>, <block:upgrade_aquatic:dead_silk_coral>, <block:upgrade_aquatic:dead_chrome_coral> ],
	
	// Quark
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:quark:underground_biome_replaceable> : [ <block:witherstormmod:tainted_stone> ],
	<tag:blocks:quark:fallen_log_can_spawn_on> : [ <block:witherstormmod:tainted_dirt> ],
	
	// Repurposed Structures 
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:repurposed_structures:mineshaft_support_replaceables> : [ <block:witherstormmod:tainted_leaves>, <block:witherstormmod:tainted_mushroom> ],
	
	// Snow Real Magic
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:snowrealmagic:not_containables> : [ <block:witherstormmod:tainted_leaves> ],
	
	// Supplementaries
	/// Allow placed gunpowder to light Twilight Forest's skull candles
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:supplementaries:lightable_by_gunpowder> : [ <block:twilightforest:candelabra>, <block:twilightforest:creeper_skull_candle>, <block:twilightforest:creeper_wall_skull_candle>, <block:twilightforest:piglin_skull_candle>, <block:twilightforest:piglin_wall_skull_candle>, <block:twilightforest:player_skull_candle>, <block:twilightforest:player_wall_skull_candle>, <block:twilightforest:skeleton_skull_candle>, <block:twilightforest:skeleton_wall_skull_candle>, <block:twilightforest:wither_skeleton_skull_candle>, <block:twilightforest:wither_skeleton_wall_skull_candle>, <block:twilightforest:zombie_skull_candle>, <block:twilightforest:zombie_wall_skull_candle> ],
	<tag:blocks:supplementaries:lights_gunpowder> : [ <block:twilightforest:fiery_block>, <block:twilightdelight:fiery_cooking_pot> ],
	<tag:blocks:supplementaries:map_tint_generic> : [ <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:supplementaries:hang_from_ropes> : [ <block:witherstormmod:tainted_leaves> ],
	<tag:blocks:supplementaries:brick_breakable_recursive> : [ <block:witherstormmod:tainted_glass_pane> ],
	
	// Swampier Swamps
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:swampier_swamps:mud_puddle_can_replace> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_stone> ],
	<tag:blocks:swampier_swamps:decaying_kelp_can_replace> : [ <block:witherstormmod:tainted_dirt> ],
	
	// Twilight Forest
	/// Make destructive blocks ignore certain CWSM blocks
	/// Compat between the Twilight Forest portal and CWSM blocks
	
	<tag:blocks:twilightforest:antibuilder_ignores> : [ <block:witherstormmod:hardened_flesh_block>, <block:witherstormmod:formidibomb>, <block:witherstormmod:super_tnt> ],
	<tag:blocks:twilightforest:carminite_reactor_immune> : [ <block:witherstormmod:hardened_flesh_block>, <block:witherstormmod:formidibomb> ],
	<tag:blocks:twilightforest:common_protections> : [ <block:witherstormmod:hardened_flesh_block> ],
	<tag:blocks:twilightforest:druid_projectile_replaceable> : [ <block:witherstormmod:tainted_log>, <block:witherstormmod:tainted_leaves>, <block:witherstormmod:tainted_stone>, <block:witherstormmod:tainted_sandstone> ],
	<tag:blocks:twilightforest:plants_hang_on> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:twilightforest:ore_magnet/ore_safe_replace_block> : [ <block:witherstormmod:tainted_stone> ],
	<tag:blocks:twilightforest:portal/decoration> : [ <block:witherstormmod:tainted_leaves>, <block:witherstormmod:tainted_mushroom> ],
	<tag:blocks:twilightforest:portal/edge> : [ <block:witherstormmod:tainted_dirt> ],
	<tag:blocks:twilightforest:tree_roots_skip> : [ <block:witherstormmod:hardened_flesh_block>, <block:witherstormmod:formidibomb>, <block:deep_aether:yagroot_roots>, <block:deep_aether:muddy_yagroot_roots> ],
	<tag:blocks:twilightforest:worldgen_replaceables> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_leaves>, <block:witherstormmod:tainted_stone> ],
	<tag:blocks:twilightforest:ore_magnet/ore_safe_replace_block> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_stone> ],
	<tag:blocks:twilightforest:structure_banned_interactions> : [ <block:witherstormmod:tainted_stone_button>, <block:witherstormmod:tainted_button> ],
	
	// Umbral Skies
	/// Add CWSM blocks to relevant tags
	
	<tag:blocks:umbral_skies:generation_replaceable> : [ <block:witherstormmod:tainted_dirt>, <block:witherstormmod:tainted_leaves>, <block:witherstormmod:tainted_stone>, <block:witherstormmod:tainted_sandstone> ]
};

val blockTagsToClear as KnownTag<Block>[] = [
	
	# Create Dreams and Desires - Ensure only specified blocks can perform seething, freezing and sanding
	<tag:blocks:create_dd:fan_processing_catalysts/seething>,
	<tag:blocks:create_dd:fan_processing_catalysts/freezing>,
	<tag:blocks:create_dd:fan_processing_catalysts/sanding>
	
];

/* Main script */

for tagEntry in blockTagsToClear {

	tagEntry.clear();
	
}

for tagEntry, blockList in blockTagEntries {
	
	tagEntry.add(blockList);
	
}