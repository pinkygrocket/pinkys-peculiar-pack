/* Imports */

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.type.UnknownTag;
import crafttweaker.api.tag.manager.ITagManager;

import crafttweaker.api.world.biome.Biome;
import crafttweaker.api.resource.ResourceLocation;

import stdlib.List;

/* Variables */

val worldgenTagEntries as ResourceLocation[][KnownTag<Worldgen>] = {
	# Aether - Add support for Mystic's Biomes
	<tag:worldgen/biome:aether:has_ruined_portal_standard> : [  <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:lavender_meadow> ],
	
	# Creeper Overhaul - Add Twilight Forest support
	<tag:worldgen/biome:creeperoverhaul:is_mushroom> : [ <resource:twilightforest:dense_mushroom_forest>, <resource:twilightforest:mushroom_forest> ],
	<tag:worldgen/biome:creeperoverhaul:where_creepers_spawn> : [],
	
	# Enderman Overhaul - Add Mystic's Biomes support
	# Don't add Twilight Forest support - due to the Twilight Forest's low light level, they spawn en masse
	<tag:worldgen/biome:endermanoverhaul:dark_oak_spawns> : [ <resource:twilightforest:dark_forest>, <resource:twilightforest:dark_forest_center> ],
	<tag:worldgen/biome:endermanoverhaul:flower_fields_spawns> : [ <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:endermanoverhaul:savanna_spawns> : [ <resource:twilightforest:oak_savannah> ],
	<tag:worldgen/biome:endermanoverhaul:snowy_spawns> : [ <resource:twilightforest:mountains>, <resource:twilightforest:snowy_forest> ],
	<tag:worldgen/biome:endermanoverhaul:swamp_spawns> : [ <resource:twilightforest:swamp>, <resource:twilightforest:fire_swamp> ],
	
	# Dracovita Farmlife - Add Aether support
	<tag:worldgen/biome:farmlife:has_structure/tribull_ranch> : [ <resource:aether:skyroot_meadow>, <resource:deep_aether:aerlavender_fields> ],
	<tag:worldgen/biome:farmlife:has_structure/greenhouse> : [ <resource:aether:skyroot_forest>, <resource:aether:skyroot_grove>, <resource:deep_aether:aerglow_forest>, <resource:deep_aether:blue_aerglow_forest> ],
	
	# Fishermen's Trap - Add Twilight Forest support
	<tag:worldgen/biome:fishermens_trap:can_fishtrap_fish> : [ <resource:twilightforest:swamp>, <resource:twilightforest:fire_swamp> ],
	
	# Friends and Foes - Add Twilight Forest support
	<tag:worldgen/biome:friendsandfoes:has_moobloom/any> : [ <resource:twilightforest:enchanted_forest> ],
	<tag:worldgen/biome:friendsandfoes:has_moobloom/buttercup> : [ <resource:twilightforest:enchanted_forest> ],
	<tag:worldgen/biome:friendsandfoes:has_savanna_mauler> : [ <resource:twilightforest:oak_savannah> ],
	<tag:worldgen/biome:minecraft:spawns_warm_variant_frogs> : [],
	
	# When Dungeons Arise - Add Aether and Twilight Forest support
	<tag:worldgen/biome:dungeons_arise:has_structure/lighthouse_biomes> : [ <resource:minecraft:beach>, <resource:minecraft:snowy_beach> ],
	<tag:worldgen/biome:dungeons_arise:has_structure/giant_mushroom_biomes> : [ <resource:twilightforest:dense_mushroom_forest>, <resource:twilightforest:mushroom_forest>,  <resource:twilightforest:mushroom_forest_hills>, <resource:twilightforest:dense_mushroom_forest_hills> ],
	<tag:worldgen/biome:dungeons_arise:has_structure/mushroom_house_biomes> : [ <resource:twilightforest:dense_mushroom_forest>, <resource:twilightforest:mushroom_forest>,  <resource:twilightforest:mushroom_forest_hills>, <resource:twilightforest:dense_mushroom_forest_hills> ],
	<tag:worldgen/biome:dungeons_arise:has_structure/mushroom_mines_biomes> : [ <resource:twilightforest:dense_mushroom_forest>, <resource:twilightforest:mushroom_forest>,  <resource:twilightforest:mushroom_forest_hills>, <resource:twilightforest:dense_mushroom_forest_hills> ],
	<tag:worldgen/biome:dungeons_arise:has_structure/mushroom_village_biomes> : [ <resource:twilightforest:dense_mushroom_forest>, <resource:twilightforest:mushroom_forest>,  <resource:twilightforest:mushroom_forest_hills>, <resource:twilightforest:dense_mushroom_forest_hills> ],
	<tag:worldgen/biome:dungeons_arise:has_structure/heavenly_challenger_biomes> : [ <resource:deep_aether:aerglow_forest>, <resource:deep_aether:aerlavender_fields>, <resource:deep_aether:blue_aerglow_forest>, <resource:deep_aether:golden_grove>, <resource:deep_aether:golden_heights>, <resource:deep_aether:mystic_aerglow_forest>, <resource:aether:skyroot_forest>, <resource:aether:skyroot_grove>, <resource:aether:skyroot_meadow>, <resource:aether:skyroot_woodland>, <resource:deep_aether:yagroot_swamp> ],
	<tag:worldgen/biome:dungeons_arise:has_structure/heavenly_conqueror_biomes> : [ <resource:deep_aether:aerglow_forest>, <resource:deep_aether:aerlavender_fields>, <resource:deep_aether:blue_aerglow_forest>, <resource:deep_aether:golden_grove>, <resource:deep_aether:golden_heights>, <resource:deep_aether:mystic_aerglow_forest>, <resource:aether:skyroot_forest>, <resource:aether:skyroot_grove>, <resource:aether:skyroot_meadow>, <resource:aether:skyroot_woodland>, <resource:deep_aether:yagroot_swamp> ],
	<tag:worldgen/biome:dungeons_arise:has_structure/heavenly_rider_biomes> : [ <resource:deep_aether:aerglow_forest>, <resource:deep_aether:aerlavender_fields>, <resource:deep_aether:blue_aerglow_forest>, <resource:deep_aether:golden_grove>, <resource:deep_aether:golden_heights>, <resource:deep_aether:mystic_aerglow_forest>, <resource:aether:skyroot_forest>, <resource:aether:skyroot_grove>, <resource:aether:skyroot_meadow>, <resource:aether:skyroot_woodland>, <resource:deep_aether:yagroot_swamp> ],
	<tag:worldgen/biome:dungeons_arise:has_structure/small_blimp_biomes> : [ <resource:deep_aether:aerglow_forest>, <resource:deep_aether:aerlavender_fields>, <resource:deep_aether:blue_aerglow_forest>, <resource:deep_aether:golden_grove>, <resource:deep_aether:golden_heights>, <resource:deep_aether:mystic_aerglow_forest>, <resource:aether:skyroot_forest>, <resource:aether:skyroot_grove>, <resource:aether:skyroot_meadow>, <resource:aether:skyroot_woodland>, <resource:deep_aether:yagroot_swamp> ],
	<tag:worldgen/biome:dungeons_arise:has_structure/mechanical_nest_biomes> : [ <resource:twilightforest:final_plateau> ],
	
	# Observed - Add Twilight Forest support
	<tag:worldgen/biome:observed:land_spawnable> : [ <resource:twilightforest:final_plateau> ],
	
	# Quark - Allow decorations to generate in the Twilight Forest
	<tag:worldgen/biome:quark:has_fallen_spruce> : [ <resource:twilightforest:snowy_forest>, <resource:twilightforest:mountains> ],
	
	# Ribbits - Allow Ribbit Villages to generate in the Twilight Forest
	<tag:worldgen/biome:ribbits:has_structure/ribbit_village> : [ <resource:twilightforest:swamp> ],
	
	# Towers of the Wild - Add support for Nullscape & Mystic's Biomes
	<tag:worldgen/biome:totw_modded:has_structure/end_tower> : [ <resource:nullscape:shadowlands>, <resource:nullscape:void_barrens>, <resource:nullscape:crystal_peaks>],
	<tag:worldgen/biome:totw_modded:has_structure/derelict_grass_tower> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:totw_modded:has_structure/derelict_tower> : [ <resource:mysticsbiomes:lavender_meadow> ],
	<tag:worldgen/biome:totw_modded:has_structure/desert_tower> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:totw_modded:has_structure/regular_tower> :  [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:totw_modded:has_structure/ice_tower> : [ <resource:twilightforest:snowy_forest> ],
	
	# Supplementaries - Add support for Mystic's Biomes
	<tag:worldgen/biome:supplementaries:has_wild_flax> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:supplementaries:has_way_signs> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields>],
	<tag:worldgen/biome:supplementaries:has_cave_urns> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	
	# Paraglider - Add support for Mystic's Biomes
	<tag:worldgen/biome:paraglider:has_structure/underground_horned_statue> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:paraglider:has_structure/tarrey_town_goddess_statue> : [ <resource:mysticsbiomes:lavender_meadow> ],
	
	# Repurposed Structures - Add support for Mystic's Biomes
	<tag:worldgen/biome:repurposed_structures:collections/deserts> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:repurposed_structures:collections/bamboos> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:repurposed_structures:collections/any_forests> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/outposts/desert> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/igloos/grassy> : [ <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:repurposed_structures:collections/floral> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:repurposed_structures:collections/overworld> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/bastions/underground> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/deep> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/wells/forest> : [ <resource:mysticsbiomes:autumnal_grove> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/wells/cherry> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/pyramids/flower_forest> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/villages/cherry> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/wells/mossy_stone> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/villages/bamboo> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	
	# Minecraft
	### Prevent certain Overworld events in the Aether
	<tag:worldgen/biome:minecraft:without_wandering_trader_spawns> : [ <resource:deep_aether:aerglow_forest>, <resource:deep_aether:aerlavender_fields>, <resource:deep_aether:blue_aerglow_forest>, <resource:deep_aether:golden_grove>, <resource:deep_aether:golden_heights>, <resource:deep_aether:mystic_aerglow_forest>, <resource:aether:skyroot_forest>, <resource:aether:skyroot_grove>, <resource:aether:skyroot_meadow>, <resource:aether:skyroot_woodland>, <resource:deep_aether:yagroot_swamp> ],
	<tag:worldgen/biome:minecraft:without_zombie_sieges> : [ <resource:deep_aether:aerglow_forest>, <resource:deep_aether:aerlavender_fields>, <resource:deep_aether:blue_aerglow_forest>, <resource:deep_aether:golden_grove>, <resource:deep_aether:golden_heights>, <resource:deep_aether:mystic_aerglow_forest>, <resource:aether:skyroot_forest>, <resource:aether:skyroot_grove>, <resource:aether:skyroot_meadow>, <resource:aether:skyroot_woodland>, <resource:deep_aether:yagroot_swamp> ],
	<tag:worldgen/biome:minecraft:without_patrol_spawns> : [ <resource:deep_aether:aerglow_forest>, <resource:deep_aether:aerlavender_fields>, <resource:deep_aether:blue_aerglow_forest>, <resource:deep_aether:golden_grove>, <resource:deep_aether:golden_heights>, <resource:deep_aether:mystic_aerglow_forest>, <resource:aether:skyroot_forest>, <resource:aether:skyroot_grove>, <resource:aether:skyroot_meadow>, <resource:aether:skyroot_woodland>, <resource:deep_aether:yagroot_swamp> ],
	### Add worldgen support for Mystic's Biomes
	<tag:worldgen/biome:minecraft:has_structure/ruined_portal_desert> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:minecraft:has_structure/pillager_outpost> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:minecraft:has_structure/mineshaft> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:minecraft:is_overworld> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:minecraft:is_forest> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:minecraft:has_structure/stronghold> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	### Add mob support to the custom Mountains biome for Twilight Forest
	<tag:worldgen/biome:minecraft:spawns_cold_variant_frogs> : [ <resource:twilightforest:mountains> ],
	<tag:worldgen/biome:minecraft:spawns_snow_foxes> : [ <resource:twilightforest:mountains> ],
	
	# Twilight Forest - Add custom biomes
	<tag:worldgen/biome:twilightforest:in_twilight_forest> : [ <resource:twilightforest:mountains>, <resource:twilightforest:forest_hills>, <resource:twilightforest:dense_forest_hills>, <resource:twilightforest:dense_mushroom_forest_hills>, <resource:twilightforest:firefly_forest_hills>, <resource:twilightforest:mushroom_forest_hills> ],
	<tag:worldgen/biome:twilightforest:valid_hollow_hill_biomes> : [ <resource:twilightforest:forest_hills>, <resource:twilightforest:dense_forest_hills>, <resource:twilightforest:dense_mushroom_forest_hills>, <resource:twilightforest:firefly_forest_hills>, <resource:twilightforest:mushroom_forest_hills> ],
	<tag:worldgen/biome:twilightforest:valid_lich_tower_biomes> : [ <resource:twilightforest:forest_hills>, <resource:twilightforest:dense_forest_hills>, <resource:twilightforest:dense_mushroom_forest_hills>, <resource:twilightforest:firefly_forest_hills>, <resource:twilightforest:mushroom_forest_hills> ],
	<tag:worldgen/biome:twilightforest:valid_naga_courtyard_biomes> : [ <resource:twilightforest:forest_hills>, <resource:twilightforest:dense_forest_hills>, <resource:twilightforest:dense_mushroom_forest_hills>, <resource:twilightforest:firefly_forest_hills>, <resource:twilightforest:mushroom_forest_hills> ],
	<tag:worldgen/biome:twilightforest:valid_mushroom_tower_biomes> : [ <resource:twilightforest:dense_mushroom_forest_hills> ],
	
	# YUNG's Bridges - Allow YUNG's Bridges to generate in the Twilight Forest
	<tag:worldgen/biome:yungsbridges:has_structure/bridge> : [ <resource:twilightforest:stream> ],
	
	# YUNG's Extras - Add support for Mystic's Biomes
	<tag:worldgen/biome:yungsextras:has_structure/desert_decorations> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:yungsextras:has_structure/vanilla_desert_well> : [ <resource:mysticsbiomes:lush_oasis> ]
};

val worldgenTagsToClear as KnownTag<Worldgen>[] = [

	/* <tag:items:minecraft:trim_materials>, */
	
	# Repurposed Structures - Disable some structures
	
	<tag:worldgen/biome:repurposed_structures:has_structure/strongholds/nether>,
	<tag:worldgen/biome:repurposed_structures:has_structure/strongholds/end>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/end>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/desert>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/dark_forest>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/crimson>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/birch>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/icy>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/jungle>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/ocean>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/savanna>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/stone>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/swamp>,
	<tag:worldgen/biome:repurposed_structures:has_structure/mineshafts/taiga>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/swamp>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/snow>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/ocean>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/mushroom>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/jungle>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/icy>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/end>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/desert>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/deep>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/dark_forest>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/badlands>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/nether>,
	<tag:worldgen/biome:repurposed_structures:has_structure/bastions/underground>,
	<tag:worldgen/biome:repurposed_structures:has_structure/ancient_cities/ocean>,
	<tag:worldgen/biome:repurposed_structures:has_structure/ancient_cities/nether>,
	<tag:worldgen/biome:repurposed_structures:has_structure/ancient_cities/end>,
	<tag:worldgen/biome:repurposed_structures:has_structure/fortresses/jungle>,
	<tag:worldgen/biome:repurposed_structures:has_structure/igloos/grassy>,
	<tag:worldgen/biome:repurposed_structures:has_structure/igloos/mangrove>,
	<tag:worldgen/biome:repurposed_structures:has_structure/igloos/mushroom>,
	<tag:worldgen/biome:repurposed_structures:has_structure/igloos/stone>,
	<tag:worldgen/biome:repurposed_structures:has_structure/outposts/nether_brick>,
	<tag:worldgen/biome:repurposed_structures:has_structure/outposts/end>,
	<tag:worldgen/biome:repurposed_structures:has_structure/outposts/crimson>,
	<tag:worldgen/biome:repurposed_structures:has_structure/outposts/warped>,
	<tag:worldgen/biome:repurposed_structures:has_structure/villages/warped>,
	<tag:worldgen/biome:repurposed_structures:has_structure/villages/crimson>,
	<tag:worldgen/biome:repurposed_structures:has_structure/pyramids/end>,
	<tag:worldgen/biome:repurposed_structures:has_structure/dungeons/deep>,
	<tag:worldgen/biome:repurposed_structures:has_structure/cities/overworld>,
	<tag:worldgen/biome:repurposed_structures:has_structure/cities/nether>,
	<tag:worldgen/biome:repurposed_structures:has_structure/bastions/underground>,
	<tag:worldgen/biome:repurposed_structures:has_structure/villages/badlands>,
	<tag:worldgen/biome:repurposed_structures:has_structure/villages/oak>,
    <tag:worldgen/biome:repurposed_structures:has_structure/villages/ocean>,
	<tag:worldgen/biome:repurposed_structures:has_structure/villages/swamp>,
	
	# Intergrated Structures
	## Disable some structures
	
	<tag:worldgen/biome:integrated_villages:has_structure/airship_village_biomes>,
	<tag:worldgen/biome:idas:has_structure/ruins_of_the_deep_biomes>,
	<tag:worldgen/biome:idas:has_structure/bazaar_biomes>,
	<tag:worldgen/biome:idas:has_structure/archmages_tower_biomes>,
	<tag:worldgen/biome:idas:has_structure/hauntedhouse_biomes>,
	<tag:worldgen/biome:idas:has_structure/ancient_portal_biomes>,
	<tag:worldgen/biome:idas:has_structure/necromancers_spire_biomes>,
	<tag:worldgen/biome:idas:has_structure/dread_citadel_biomes>,
	<tag:worldgen/biome:idas:has_structure/winter_wagon_biomes>,
	
	# Farmlife - Ensure Farmlife structures and mobs only spawn in the Aether
	
	<tag:worldgen/biome:farmlife:has_structure/tribull_ranch>,
	<tag:worldgen/biome:farmlife:has_structure/greenhouse>,
	
	# Friends and Foes - Ensure Maulers and Mooblooms only spawn in the Twilight Forest
	
	<tag:worldgen/biome:friendsandfoes:has_moobloom/any>,
	<tag:worldgen/biome:friendsandfoes:has_moobloom/buttercup>,
	<tag:worldgen/biome:friendsandfoes:has_desert_mauler>,
	<tag:worldgen/biome:friendsandfoes:has_savanna_mauler>,
	
	# Wither Storm - Remove Wither Storm platform/structure from natural generation so that we can set up custom summoning later
	
	<tag:worldgen/biome:witherstormmod:has_structure/storm_spawn_platform>,
	<tag:worldgen/biome:witherstormmod:has_structure/snowy_storm_spawn_platform>,
	<tag:worldgen/biome:witherstormmod:has_structure/savanna_storm_spawn_platform>,
	<tag:worldgen/biome:witherstormmod:has_structure/ruins_storm_spawn_platform>,
	<tag:worldgen/biome:witherstormmod:has_structure/order_temple_storm_spawn_platform>,
	<tag:worldgen/biome:witherstormmod:has_structure/jungle_storm_spawn_platform>,
	<tag:worldgen/biome:witherstormmod:has_structure/forest_storm_spawn_platform>,
	<tag:worldgen/biome:witherstormmod:has_structure/desert_storm_spawn_platform>,
	<tag:worldgen/biome:witherstormmod:has_structure/taiga_storm_spawn_platform>,
	
	# Ribbits - Ensure Ribbit Villages only spawn in biomes set in the script (i.e. Twilight Forest's Swamp)
	
	<tag:worldgen/biome:ribbits:has_structure/ribbit_village>,
	
	# Observed - Ensure Observers only spawn in biomes set in the script (i.e. Twilight Forest's Final Plateau)
	
	<tag:worldgen/biome:observed:land_spawnable>,
	
	# When Dungeons Arise - Control where structures spawn
	
	### Removing some structures
	
	<tag:worldgen/biome:dungeons_arise:has_structure/bandit_towers_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/bathhouse_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/coliseum_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/aviary_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/giant_mushroom_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/greenwood_pub_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/heavenly_challenger_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/heavenly_conqueror_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/heavenly_rider_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/illager_windmill_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/infested_temple_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/keep_kayra_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/lighthouse_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/monastery_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/mushroom_mines_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/mushroom_house_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/mushroom_village_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/plague_asylum_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/shiraz_palace_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/small_blimp_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/thornborn_towers_biomes>,
	<tag:worldgen/biome:dungeons_arise:has_structure/mechanical_nest_biomes>
];

/* Main script */

for tagEntry in worldgenTagsToClear {

	tagEntry.clear();
	
}

for tagEntry, biomeList in worldgenTagEntries {
	
	for biome in biomeList {
		
		tagEntry.addId(biome);
		
	}
	
}