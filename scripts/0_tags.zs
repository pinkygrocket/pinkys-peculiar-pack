/* Imports */

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.block.Block;
import crafttweaker.api.block.BlockState;
import crafttweaker.api.world.biome.Biome;
import crafttweaker.api.resource.ResourceLocation;

import crafttweaker.api.item.ItemDefinition;
import stdlib.List;

val itemTagEntries as IItemStack[][KnownTag<ItemDefinition>] = {
	<tag:items:forge:milk> : [ <item:aether:skyroot_milk_bucket> ],
	<tag:items:farmersdelight:serving_containers>: [<item:ecologics:coconut_husk>],
	<tag:items:crafttweaker:maps> : [ <item:minecraft:map>, <item:minecraft:filled_map>],
	<tag:items:crafttweaker:adhesives> : [<item:minecraft:slime_ball>, <item:minecraft:honey_bottle>, <item:aether:swet_ball>],
	<tag:items:crafttweaker:cyan_eggs> : [ <item:mysticsbiomes:cyan_egg>, <item:quark:egg_parrot_yellow_blue> ],
	<tag:items:crafttweaker:green_eggs> : [ <item:quark:egg_parrot_green> ],
	<tag:items:crafttweaker:lime_eggs> : [ <item:mysticsbiomes:lime_egg> ],
	<tag:items:crafttweaker:yellow_eggs> : [ <item:mysticsbiomes:yellow_egg> ],
	<tag:items:crafttweaker:orange_eggs> : [ <item:mysticsbiomes:orange_egg> ],
	<tag:items:crafttweaker:red_eggs> : [ <item:quark:egg_parrot_red_blue> ],
	<tag:items:crafttweaker:pink_eggs> : [ <item:mysticsbiomes:pink_egg> ],
	<tag:items:crafttweaker:purple_eggs> : [ <item:mysticsbiomes:purple_egg> ],
	<tag:items:crafttweaker:clouds> : [ <item:aether:cold_aercloud>, <item:aether:blue_aercloud>, <item:aether:golden_aercloud>, <item:twilightforest:wispy_cloud>, <item:twilightforest:fluffy_cloud>, <item:twilightforest:rainy_cloud>, <item:twilightforest:snowy_cloud>, <item:deep_aether:sterling_aercloud>, <item:deep_aether:chromatic_aercloud>],
	<tag:items:crafttweaker:azalea_planks> : [ <item:quark:azalea_planks>, <item:ecologics:azalea_planks> ],
	<tag:items:crafttweaker:torches> : [ <item:minecraft:torch>, <item:bambooeverything:dry_bamboo_torch>, <item:bambooeverything:bamboo_torch>, <item:bonetorch:bonetorch> ],
	<tag:items:crafttweaker:colorless_eggs> : [ <item:minecraft:turtle_egg>, <item:minecraft:egg>, <item:aether:white_moa_egg>, <item:aether:black_moa_egg> ],
	<tag:items:crafttweaker:hammers> : [ <item:easy_hammers:wooden_hammer>, <item:easy_hammers:stone_hammer>, <item:easy_hammers:golden_hammer>, <item:easy_hammers:iron_hammer>, <item:easy_hammers:diamond_hammer>, <item:easy_hammers:netherite_hammaer>, <item:aether:hammer_of_kingbdogz> ],
	<tag:items:minecraft:dampens_vibrations> : [<item:absentbydesign:stairs_wool_purple>, <item:absentbydesign:stairs_wool_red>, <item:absentbydesign:stairs_wool_silver>, <item:absentbydesign:stairs_wool_white>, <item:absentbydesign:stairs_wool_yellow>, <item:absentbydesign:slab_wool_black>, <item:absentbydesign:slab_wool_blue>, <item:absentbydesign:slab_wool_brown>, <item:absentbydesign:slab_wool_gray>, <item:absentbydesign:slab_wool_cyan>, <item:absentbydesign:slab_wool_green>, <item:absentbydesign:slab_wool_light_blue>, <item:absentbydesign:slab_wool_lime>, <item:absentbydesign:slab_wool_magenta>, <item:absentbydesign:stairs_wool_blue>, <item:absentbydesign:stairs_wool_black>, <item:absentbydesign:slab_wool_yellow>, <item:absentbydesign:slab_wool_white>, <item:absentbydesign:slab_wool_silver>, <item:absentbydesign:slab_wool_red>, <item:absentbydesign:slab_wool_purple>, <item:absentbydesign:slab_wool_pink>, <item:absentbydesign:slab_wool_orange>, <item:absentbydesign:stairs_wool_brown>, <item:absentbydesign:stairs_wool_cyan>, <item:absentbydesign:stairs_wool_gray>, <item:absentbydesign:stairs_wool_green>, <item:absentbydesign:stairs_wool_light_blue>, <item:absentbydesign:stairs_wool_lime>, <item:absentbydesign:stairs_wool_magenta>, <item:absentbydesign:stairs_wool_orange>, <item:absentbydesign:stairs_wool_pink> ],
};

val blockTagEntries as Block[][KnownTag<Block>] = {
	<tag:blocks:crafttweaker:clouds> : [ <block:aether:cold_aercloud>, <block:aether:blue_aercloud>, <block:aether:golden_aercloud>, <block:twilightforest:wispy_cloud>, <block:twilightforest:fluffy_cloud>, <block:twilightforest:rainy_cloud>, <block:twilightforest:snowy_cloud>, <block:deep_aether:sterling_aercloud>, <block:deep_aether:chromatic_aercloud>],
	<tag:blocks:crafttweaker:mushrooms> : [ <block:minecraft:brown_mushroom_block>, <block:minecraft:red_mushroom_block>, <block:minecraft:mushroom_stem> ],
	<tag:blocks:farmersdelight:mineable/knife> : [<block:absentbydesign:stairs_wool_purple>, <block:absentbydesign:stairs_wool_red>, <block:absentbydesign:stairs_wool_silver>, <block:absentbydesign:stairs_wool_white>, <block:absentbydesign:stairs_wool_yellow>, <block:absentbydesign:slab_wool_black>, <block:absentbydesign:slab_wool_blue>, <block:absentbydesign:slab_wool_brown>, <block:absentbydesign:slab_wool_gray>, <block:absentbydesign:slab_wool_cyan>, <block:absentbydesign:slab_wool_green>, <block:absentbydesign:slab_wool_light_blue>, <block:absentbydesign:slab_wool_lime>, <block:absentbydesign:slab_wool_magenta>, <block:absentbydesign:stairs_wool_blue>, <block:absentbydesign:stairs_wool_black>, <block:absentbydesign:slab_wool_yellow>, <block:absentbydesign:slab_wool_white>, <block:absentbydesign:slab_wool_silver>, <block:absentbydesign:slab_wool_red>, <block:absentbydesign:slab_wool_purple>, <block:absentbydesign:slab_wool_pink>, <block:absentbydesign:slab_wool_orange>, <block:absentbydesign:stairs_wool_brown>, <block:absentbydesign:stairs_wool_cyan>, <block:absentbydesign:stairs_wool_gray>, <block:absentbydesign:stairs_wool_green>, <block:absentbydesign:stairs_wool_light_blue>, <block:absentbydesign:stairs_wool_lime>, <block:absentbydesign:stairs_wool_magenta>, <block:absentbydesign:stairs_wool_orange>, <block:absentbydesign:stairs_wool_pink> ],
	<tag:blocks:minecraft:occludes_vibration_signals> : [<block:absentbydesign:stairs_wool_purple>, <block:absentbydesign:stairs_wool_red>, <block:absentbydesign:stairs_wool_silver>, <block:absentbydesign:stairs_wool_white>, <block:absentbydesign:stairs_wool_yellow>, <block:absentbydesign:slab_wool_black>, <block:absentbydesign:slab_wool_blue>, <block:absentbydesign:slab_wool_brown>, <block:absentbydesign:slab_wool_gray>, <block:absentbydesign:slab_wool_cyan>, <block:absentbydesign:slab_wool_green>, <block:absentbydesign:slab_wool_light_blue>, <block:absentbydesign:slab_wool_lime>, <block:absentbydesign:slab_wool_magenta>, <block:absentbydesign:stairs_wool_blue>, <block:absentbydesign:stairs_wool_black>, <block:absentbydesign:slab_wool_yellow>, <block:absentbydesign:slab_wool_white>, <block:absentbydesign:slab_wool_silver>, <block:absentbydesign:slab_wool_red>, <block:absentbydesign:slab_wool_purple>, <block:absentbydesign:slab_wool_pink>, <block:absentbydesign:slab_wool_orange>, <block:absentbydesign:stairs_wool_brown>, <block:absentbydesign:stairs_wool_cyan>, <block:absentbydesign:stairs_wool_gray>, <block:absentbydesign:stairs_wool_green>, <block:absentbydesign:stairs_wool_light_blue>, <block:absentbydesign:stairs_wool_lime>, <block:absentbydesign:stairs_wool_magenta>, <block:absentbydesign:stairs_wool_orange>, <block:absentbydesign:stairs_wool_pink> ],
	<tag:blocks:minecraft:dampens_vibrations> : [<block:absentbydesign:stairs_wool_purple>, <block:absentbydesign:stairs_wool_red>, <block:absentbydesign:stairs_wool_silver>, <block:absentbydesign:stairs_wool_white>, <block:absentbydesign:stairs_wool_yellow>, <block:absentbydesign:slab_wool_black>, <block:absentbydesign:slab_wool_blue>, <block:absentbydesign:slab_wool_brown>, <block:absentbydesign:slab_wool_gray>, <block:absentbydesign:slab_wool_cyan>, <block:absentbydesign:slab_wool_green>, <block:absentbydesign:slab_wool_light_blue>, <block:absentbydesign:slab_wool_lime>, <block:absentbydesign:slab_wool_magenta>, <block:absentbydesign:stairs_wool_blue>, <block:absentbydesign:stairs_wool_black>, <block:absentbydesign:slab_wool_yellow>, <block:absentbydesign:slab_wool_white>, <block:absentbydesign:slab_wool_silver>, <block:absentbydesign:slab_wool_red>, <block:absentbydesign:slab_wool_purple>, <block:absentbydesign:slab_wool_pink>, <block:absentbydesign:slab_wool_orange>, <block:absentbydesign:stairs_wool_brown>, <block:absentbydesign:stairs_wool_cyan>, <block:absentbydesign:stairs_wool_gray>, <block:absentbydesign:stairs_wool_green>, <block:absentbydesign:stairs_wool_light_blue>, <block:absentbydesign:stairs_wool_lime>, <block:absentbydesign:stairs_wool_magenta>, <block:absentbydesign:stairs_wool_orange>, <block:absentbydesign:stairs_wool_pink> ],
	<tag:blocks:weeping_angels:no_breaking> : [<block:twilightforest:deadrock>, <block:twilightforest:thick_castle_brick>, <block:twilightforest:cracked_deadrock>, <block:twilightforest:blue_castle_rune_brick>, <block:twilightforest:castle_brick>,<block:twilightforest:cracked_castle_brick>, <block:twilightforest:brown_thorns>, <block:twilightforest:green_thorns>, <block:twilightforest:yellow_castle_rune_brick>, <block:twilightforest:bold_castle_brick_pillar>, <block:twilightforest:yellow_castle_door>, <block:twilightforest:weathered_deadrock>, <block:twilightforest:blue_castle_door>, <block:twilightforest:blue_force_field>, <block:twilightforest:castle_roof_tile>, <block:twilightforest:violet_castle_door>, <block:twilightforest:violet_castle_rune_brick>, <block:minecraft:oak_fence>, <block:twilightforest:pink_castle_door>, <block:twilightforest:pink_force_field>, <block:minecraft:quartz_stairs>, <block:twilightforest:pink_castle_rune_brick>, <block:twilightforest:green_force_field>, <block:minecraft:chiseled_quartz_block>]
};

val worldgenTagEntries as ResourceLocation[][KnownTag<Worldgen>] = {
	<tag:worldgen/biome:yungsbridges:has_structure/bridge> : [ <resource:twilightforest:stream> ],
	<tag:worldgen/biome:totw_modded:has_structure/end_tower> : [ <resource:nullscape:shadowlands>, <resource:nullscape:void_barrens>, <resource:nullscape:crystal_peaks>],
	<tag:worldgen/biome:supplementaries:has_wild_flax> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:supplementaries:has_way_signs> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields>],
	<tag:worldgen/biome:supplementaries:has_cave_urns> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:paraglider:has_structure/underground_horned_statue> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:paraglider:has_structure/tarrey_town_goddess_statue> : [ <resource:mysticsbiomes:lavender_meadow> ],
	<tag:worldgen/biome:totw_modded:has_structure/derelict_grass_tower> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:totw_modded:has_structure/derelict_tower> : [ <resource:mysticsbiomes:lavender_meadow> ],
	<tag:worldgen/biome:totw_modded:has_structure/desert_tower> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:totw_modded:has_structure/regular_tower> :  [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:waystones:is_desert> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:yungsextras:has_structure/desert_decorations> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:yungsextras:has_structure/vanilla_desert_well> : [ <resource:mysticsbiomes:lush_oasis> ],
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
	<tag:worldgen/biome:minecraft:has_structure/ruined_portal_desert> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:minecraft:has_structure/pillager_outpost> : [ <resource:mysticsbiomes:lush_oasis> ],
	<tag:worldgen/biome:minecraft:has_structure/mineshaft> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/villages/cherry> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/wells/mossy_stone> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:repurposed_structures:has_structure/villages/bamboo> : [ <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:minecraft:is_overworld> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ],
	<tag:worldgen/biome:minecraft:is_forest> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest> ],
	<tag:worldgen/biome:minecraft:has_structure/stronghold> : [ <resource:mysticsbiomes:autumnal_grove>, <resource:mysticsbiomes:bamboo_blossom_forest>, <resource:mysticsbiomes:lavender_meadow>, <resource:mysticsbiomes:lush_oasis>, <resource:mysticsbiomes:strawberry_fields> ]
};

val tagsToClear as KnownTag<Worldgen>[] = [
	<tag:worldgen/biome:weeping_angels:has_structure/catacombs>,
	<tag:worldgen/biome:weeping_angels:spawns/weeping_angels>,
	<tag:worldgen/biome:cataclysm:required_sunken_city_surrounding>,
	<tag:worldgen/biome:cataclysm:has_structure/sunken_city_biomes>,
	<tag:worldgen/biome:cataclysm:has_structure/soul_black_smith_biomes>,
	<tag:worldgen/biome:cataclysm:has_structure/ruined_citadel_biomes>,
	<tag:worldgen/biome:cataclysm:has_structure/cursed_pyramid_biomes>,
	<tag:worldgen/biome:cataclysm:has_structure/burning_arena_biomes>,
	<tag:worldgen/biome:cataclysm:has_structure/ancient_factory_biomes>,
	<tag:worldgen/biome:observed:land_spawnable>
];

for tagEntry, itemList in itemTagEntries {
	
	tagEntry.add(itemList);
	
}

for tagEntry, blockList in blockTagEntries {
	
	tagEntry.add(blockList);
	
}

for tagEntry, biomeList in worldgenTagEntries {
	
	for biome in biomeList {
		
		tagEntry.addId(biome);
		
	}
	
}

for tagEntry in tagsToClear {

	tagEntry.clear();
	
}