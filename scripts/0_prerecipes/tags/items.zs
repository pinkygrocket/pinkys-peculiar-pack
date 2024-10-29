/* Imports */

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.manager.ITagManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.ItemDefinition;

import stdlib.List;

/* Variables */

val itemTagEntries as IItemStack[][KnownTag<ItemDefinition>] = {

	// Aether
	/// Allow CWSM's Command Block Axe to harvest Golden Amber - not an Aether tool but is infinity+1
	/// Add Farmer's Delight Hams to valid pig drops
	/// Block double drops from boss trophies and some boss rewards
	/// Allow CWSM's Command Block Pickaxe to damage the Slider
	
	<tag:items:aether:golden_amber_harvesters> : [ <item:witherstormmod:command_block_axe> ],
	<tag:items:aether:pig_drops> : [ <item:farmersdelight:ham> ],
	<tag:items:aether:no_skyroot_double_drops> : [ <item:twilightforest:naga_trophy>, <item:twilightforest:lich_trophy>, <item:twilightforest:minoshroom_trophy>, <item:twilightforest:hydra_trophy>, <item:twilightforest:knight_phantom_trophy>, <item:twilightforest:ur_ghast_trophy>, <item:twilightforest:alpha_yeti_trophy>, <item:twilightforest:snow_queen_trophy>, <item:twilightforest:quest_ram_trophy>, <item:umbral_skies:slider_trophy>, <item:umbral_skies:valkyrie_queen_trophy>, <item:umbral_skies:sun_spirit_trophy>, <item:witherstormmod:withered_nether_star>, <item:deep_aether:slider_eye>, <item:deep_aether:medal_of_honor>, <item:deep_aether:sun_core>, <item:deep_aether:aerwhale_saddle>],
	<tag:items:aether:slider_damaging_items>: [ <item:witherstormmod:command_block_pickaxe> ],
	
	// Autumnity
	/// Allow snails to be tempted by mushroom items added from other mods
	
	<tag:items:autumnity:snail_food> : [ <item:farmersdelight:red_mushroom_colony>, <item:farmersdelight:brown_mushroom_colony>, <item:deep_aether:lightcap_mushrooms> ],
	<tag:items:autumnity:snail_tempt_items> : [ <item:farmersdelight:red_mushroom_colony>, <item:farmersdelight:brown_mushroom_colony>, <item:deep_aether:lightcap_mushrooms>, <item:farmersdelight:mushroom_rice>, <item:packedup:brown_mushroom_crate>, <item:packedup:red_mushroom_crate> ],
	
	// Balm
	
	<tag:items:balm:gems> : [],
	
	// Blueprint
	
	<tag:items:blueprint:cat_food> : [],
	<tag:items:blueprint:chicken_food> : [],
	<tag:items:blueprint:ocelot_food> : [],
	<tag:items:blueprint:pig_food> : [],
	<tag:items:blueprint:strider_food> : [],
	<tag:items:blueprint:strider_tempt_items> : [],
	<tag:items:blueprint:wooden_chests> : [],
	<tag:items:blueprint:wooden_bookshelves> : [],
	<tag:items:blueprint:wooden_chiseled_bookshelves> : [],
	<tag:items:blueprint:wooden_trapped_chests> : [],
	
	// Bookshelf
	
	<tag:items:bookshelf:armor> : [],
	<tag:items:bookshelf:books> : [],
	<tag:items:bookshelf:boots> : [],
	<tag:items:bookshelf:bows> : [],
	<tag:items:bookshelf:chestplates> : [],
	<tag:items:bookshelf:clocks> : [],
	<tag:items:bookshelf:fishing_rods> : [],
	<tag:items:bookshelf:helmets> : [],
	<tag:items:bookshelf:leggings> : [],
	<tag:items:bookshelf:mob_buckets> : [],
	<tag:items:bookshelf:shields> : [],
	<tag:items:bookshelf:spyglasses> : [],
	
	// Common
	
	<tag:items:c:buckets> : [],
	<tag:items:c:buckets/empty> : [],
	<tag:items:c:buckets/entity_water> : [ <item:sullysmod:lanternfish_bucket>, <item:upgrade_aquatic:pike_bucket>, <item:upgrade_aquatic:perch_bucket>, <item:upgrade_aquatic:lionfish_bucket>, <item:quark:crab_bucket>, <item:upgrade_aquatic:nautilus_bucket>, <item:upgrade_aquatic:squid_bucket>, <item:upgrade_aquatic:glow_squid_bucket>, <item:babyfat:ranchu_bucket>, <item:aether:skyroot_pufferfish_bucket>, <item:aether:skyroot_salmon_bucket>, <item:aether:skyroot_cod_bucket>, <item:aether:skyroot_tropical_fish_bucket>, <item:aether:skyroot_axolotl_bucket>, <item:deep_aether:skyroot_aerglow_fish_bucket>, <item:aether:skyroot_tadpole_bucket>, <item:deep_aether:aerglow_fish_bucket>, <item:extra_compat:skyroot_lanternfish_bucket>, <item:crittersandcompanions:dumbo_octopus_bucket>, <item:crittersandcompanions:koi_fish_bucket>, <item:crittersandcompanions:sea_bunny_bucket> ],
	<tag:items:c:buckets/milk> : [],
	<tag:items:c:buckets/powder_snow> : [],
	<tag:items:c:buckets/water> : [],
	<tag:items:c:chests> : [],
	<tag:items:c:chests/wooden> : [],
	<tag:items:c:crops> : [],
	<tag:items:c:dusts> : [],
	<tag:items:c:foods/berry> : [],
	<tag:items:c:foods/cooked_fish> : [],
	<tag:items:c:foods/cooked_meat> : [],
	<tag:items:c:foods/fruit> : [],
	<tag:items:c:foods/fruits> : [],
	<tag:items:c:foods/soup> : [],
	<tag:items:c:foods/raw_fish> : [],
	<tag:items:c:foods/raw_meat> : [],
	<tag:items:c:foods/vegetable> : [],
	<tag:items:c:glass_panes> : [],
	<tag:items:c:glass_blocks/cheap> : [],
	<tag:items:c:ingots> : [],
	<tag:items:c:nuggets> : [],
	<tag:items:c:ores> : [],
	<tag:items:c:potions> : [],
	<tag:items:c:rods> : [],
	<tag:items:c:raw_blocks> : [],
	<tag:items:c:stones> : [],
	<tag:items:c:storage_blocks> : [],
	<tag:items:c:tools> : [],
	<tag:items:c:tools/melee_weapons> : [],
	<tag:items:c:tools/mining_tool> : [],
	<tag:items:c:tools/ranged_weapon> : [],
	
	// Create
	/// Add stripped log and woods from other mod for recipe compatablity
	/// Allow some other slab types to be used for crafting Rails
	/// Make other bottle items stand upright on Belts
	
	<tag:items:create:modded_stripped_logs> : [ <item:autumnity:stripped_maple_log>, <item:upgrade_aquatic:stripped_driftwood_log>, <item:upgrade_aquatic:stripped_river_log>, <item:mysticsbiomes:stripped_strawberry_log>, <item:mysticsbiomes:stripped_peach_log>, <item:mysticsbiomes:stripped_sea_foam_log>, <item:mysticsbiomes:stripped_jacaranda_log>, <item:witherstormmod:stripped_tainted_log>, <item:snifferplus:stripped_stone_pine_log>, <item:deep_aether:stripped_sunroot_log>, <item:deep_aether:stripped_conberry_log>, <item:deep_aether:stripped_cruderoot_log>, <item:deep_aether:stripped_yagroot_log>, <item:deep_aether:stripped_roseroot_log>, <item:aether:stripped_skyroot_log> ],
	<tag:items:create:modded_stripped_wood> : [ <item:autumnity:stripped_maple_wood>, <item:upgrade_aquatic:stripped_driftwood>, <item:upgrade_aquatic:stripped_river_wood>, <item:aether:stripped_skyroot_wood>, <item:deep_aether:stripped_yagroot_wood>,<item:deep_aether:stripped_roseroot_wood>, <item:deep_aether:stripped_cruderoot_wood>, <item:deep_aether:stripped_conberry_wood>, <item:deep_aether:stripped_sunroot_wood>, <item:witherstormmod:stripped_tainted_wood>,<item:snifferplus:stripped_stone_pine_wood> ],
	<tag:items:create:sleepers> : [ <item:minecraft:polished_andesite_slab>, <item:minecraft:andesite_slab>, <item:quark:polished_tuff_slab>, <item:minecraft:polished_deepslate_slab>, <item:create:polished_cut_andesite_slab> ],
	<tag:items:create:upright_on_belt> : [ <item:potionofbees:potion_of_bees>, <item:potionofbees:splash_potion_of_bees>, <item:potionofbees:lingering_potion_of_bees>, <item:amendments:dye_bottle>, <item:supplementaries:jar>, <item:crittersandcompanions:sea_bunny_slime_bottle>, <item:artifacts:cloud_in_a_bottle>, <item:swampier_swamps:gas_bottle>, <item:minecraft:experience_bottle>, <item:autumnity:sap_bottle>, <item:betterbeekeeping:strange_honey_bottle>, <item:betterbeekeeping:cool_honey_bottle>, <item:betterbeekeeping:lively_honey_bottle>, <item:betterbeekeeping:bright_honey_bottle>, <item:betterbeekeeping:warm_honey_bottle>, <item:betterbeekeeping:spicy_honey_bottle>, <item:upgrade_aquatic:mulberry_jam_bottle>, <item:quark:bottled_cloud>, <item:autumnity:syrup_bottle> ],
	
	// Create Dreasm & Desires
	
	<tag:items:create_dd:freezable> : [],
	<tag:items:create_dd:sandable> : [],
	<tag:items:create_dd:seethable> : [],
	
	// CraftTweaker - Things for custom recipes and loot intergration
	
	<tag:items:crafttweaker:maps> : [ <item:minecraft:map>, <item:minecraft:filled_map> ],
	<tag:items:crafttweaker:adhesives> : [<item:minecraft:slime_ball>, <item:minecraft:honey_bottle>, <item:aether:swet_ball>],
	<tag:items:crafttweaker:clouds> : [ <item:aether:cold_aercloud>, <item:aether:blue_aercloud>, <item:aether:golden_aercloud>, <item:twilightforest:wispy_cloud>, <item:twilightforest:fluffy_cloud>, <item:twilightforest:rainy_cloud>, <item:twilightforest:snowy_cloud>, <item:deep_aether:sterling_aercloud>, <item:deep_aether:chromatic_aercloud>],
	<tag:items:crafttweaker:azalea_planks> : [ <item:quark:azalea_planks>, <item:ecologics:azalea_planks> ],
	<tag:items:crafttweaker:torches> : [ <item:minecraft:torch>, <item:bambooeverything:dry_bamboo_torch>, <item:bambooeverything:bamboo_torch>, <item:bonetorch:bonetorch> ],
	<tag:items:crafttweaker:hammers> : [ <item:justhammers:iron_impact_hammer>, <item:aether:hammer_of_kingbdogz> ],
	<tag:items:crafttweaker:vanilla_overworld_discs>: [],
	<tag:items:crafttweaker:overworld_discs> : [ <item:integrated_stronghold:music_disc_sight>, <item:integrated_stronghold:music_disc_forlorn>, <item:ecologics:music_disc_coconut>, <item:idas:music_disc_calidum>, <item:idas:music_disc_slither>, <item:sullysmod:music_disc_scour>, <item:minecraft:music_disc_relic>, <item:minecraft:music_disc_otherside>, <item:upgrade_aquatic:music_disc_atlantis>, <item:minecraft:music_disc_5>, <item:minecraft:music_disc_wait>, <item:minecraft:music_disc_11>, <item:minecraft:music_disc_ward>, <item:minecraft:music_disc_strad>, <item:minecraft:music_disc_stal>, <item:minecraft:music_disc_mellohi>, <item:minecraft:music_disc_mall>, <item:minecraft:music_disc_far>, <item:minecraft:music_disc_chirp>, <item:minecraft:music_disc_blocks>, <item:minecraft:music_disc_cat>, <item:minecraft:music_disc_13>],
	<tag:items:crafttweaker:aether_discs> : [ <item:lost_aether_content:music_disc_legacy>, <item:lost_aether_content:music_disc_sovereign_of_the_skies>, <item:deep_aether:music_disc_nabooru>, <item:deep_aether:music_disc_a_morning_wish>, <item:aether:music_disc_ascending_dawn>, <item:aether:music_disc_aether_tune> ],
	<tag:items:crafttweaker:twilight_forest_discs> : [],
	<tag:items:crafttweaker:nether_discs> : [],
	
	// Critters and Companions
	
	<tag:items:crittersandcompanions:ferret_food> : [],
	<tag:items:crittersandcompanions:shinma_enaga_food> : [],
	
	// DeathKnell
	/// Add non-vanilla axes, books and cookies for death messages
	
	<tag:items:deathknell:axes> : [ <item:aether:skyroot_axe>, <item:aether:holystone_axe>, <item:aether:zanite_axe>, <item:aether:gravitite_axe>, <item:aether:valkyrie_axe>, <item:lost_aether_content:phoenix_axe>, <item:twilightforest:ironwood_axe>, <item:twilightforest:steeleaf_axe>, <item:twilightforest:knightmetal_axe>, <item:tflostblocks:incomplete_thorncutter_axe>, <item:tflostblocks:thorncutter_axe>, <item:witherstormmod:command_block_axe> ],
	<tag:items:deathknell:books> : [ <item:scholar:white_writable_book>, <item:scholar:light_gray_writable_book>, <item:scholar:gray_writable_book>, <item:scholar:black_writable_book>, <item:scholar:brown_writable_book>, <item:scholar:red_writable_book>, <item:scholar:orange_writable_book>, <item:scholar:yellow_writable_book>, <item:scholar:lime_writable_book>, <item:scholar:green_writable_book>, <item:scholar:cyan_writable_book>, <item:scholar:light_blue_writable_book>, <item:scholar:blue_writable_book>, <item:scholar:purple_writable_book>, <item:scholar:magenta_writable_book>, <item:scholar:pink_writable_book>, <item:witherstormmod:command_block_book>, <item:map_atlases:atlas>, <item:aether:book_of_lore>, <item:quark:ancient_tome>, <item:patchouli:guide_book>, <item:scholar:white_written_book>, <item:scholar:light_gray_written_book>, <item:scholar:gray_written_book>, <item:scholar:black_written_book>, <item:scholar:brown_written_book>, <item:scholar:red_written_book>, <item:scholar:orange_written_book>, <item:scholar:yellow_written_book>, <item:scholar:lime_written_book>, <item:scholar:green_written_book>, <item:scholar:cyan_written_book>, <item:scholar:light_blue_written_book>, <item:scholar:blue_written_book>, <item:scholar:purple_written_book>, <item:scholar:magenta_written_book>, <item:scholar:pink_written_book>  ],
	<tag:items:deathknell:cookies> : [ <item:farmersdelight:sweet_berry_cookie>, <item:farmersdelight:honey_cookie>, <item:twilightdelight:torchberry_cookie>, <item:endersdelight:uncanny_cookies>, <item:aether:gingerbread_man> ],
	
	// Deep Aether
	
	<tag:items:deep_aether:eggs> : [],
	<tag:items:deep_aether:milk_buckets> : [],
	
	// Decorative Blocks 
	
	<tag:items:decorative_blocks:seats> : [],
	<tag:items:decorative_blocks:seats_that_burn> : [],
	<tag:items:decorative_blocks:supports_that_burn>: [],
	
	// Decorative Bottles 
	
	<tag:items:decorative_bottles:potions> : [ <item:potionofbees:potion_of_bees> ],
	
	// Domestic Innovation
	
	<tag:items:domesticationinnovation:tame_frogs_with> : [],
	
	// Ecologics
	
	<tag:items:ecologics:penguin_tempt_items> : [],
	
	// Exposure
	/// Set up custom filters
	
	<tag:items:exposure:filters> : [ <item:witherstormmod:tainted_glass_pane>, <item:endermanoverhaul:corrupted_pearl>, <item:endermanoverhaul:ancient_pearl>, <item:minecraft:ender_pearl>, <item:endermanoverhaul:warped_pearl>, <item:endermanoverhaul:icy_pearl>, <item:endermanoverhaul:bubble_pearl>, <item:endermanoverhaul:crimson_pearl>, <item:endermanoverhaul:soul_pearl>, <item:endermanoverhaul:summoner_pearl>, <item:aether:quicksoil_glass_pane>, <item:tflostblocks:auroralized_glass_pane> ],
	<tag:items:exposure:lenses> : [],
	
	// Farmer's Delight 
	/// Allow Ecologic's Coconut Husk to be used as a serving container
	
	<tag:items:farmersdelight:cabbage_roll_ingredients> : [],
	<tag:items:farmersdelight:serving_containers> : [ <item:ecologics:coconut_husk> ],
	<tag:items:farmersdelight:cabinets> : [],
	<tag:items:farmersdelight:cabinets/wooden> : [],
	<tag:items:farmersdelight:flat_on_cutting_board> : [],
	<tag:items:farmersdelight:offhand_equipment> : [],
	<tag:items:farmersdelight:wolf_prey> : [],
	<tag:items:farmersdelight:straw_plants> : [],
	
	// Fishermen's Trap
	/// Make fish baits make more sense
	
	<tag:items:fishermens_trap:fish_baits> : [ <item:farmersdelight:cabbage>, <item:farmersdelight:cabbage_leaf>, <item:minecraft:bread>, <item:twilightforest:cicada>, <item:twilightforest:moonworm>, <item:delightful:honey_glazed_walnut>, <item:ecologics:walnut>, <item:farmersdelight:onion>, <item:farmersdelight:tomato>, <item:mysticsbiomes:strawberry>, <item:delightful:salmonberries>, <item:twilightforest:firefly>, <item:aether:blue_berry>, <item:mysticsbiomes:strawberry>, <item:minecraft:beetroot>, <item:minecraft:potato>, <item:minecraft:carrot>, <item:delightful:salmonberries>, <item:farmersdelight:pumpkin_slice>, <item:create:wheat_flour>],
	<tag:items:fishermens_trap:jei_display_results/minecraft/air> : [],
	<tag:items:fishermens_trap:jei_display_results/minecraft/beetroot> : [],
	<tag:items:fishermens_trap:jei_display_results/minecraft/bread> : [],
	<tag:items:fishermens_trap:jei_display_results/minecraft/golden_carrot> : [],
	<tag:items:fishermens_trap:jei_display_results/minecraft/melon_slice> : [],
	<tag:items:fishermens_trap:jei_display_results/minecraft/sweet_berries> : [],
	
	// Forge
	/// Intergration/add missing items
	
	<tag:items:forge:all_sticks> : [],
	<tag:items:forge:armor> : [],
	<tag:items:forge:boots> : [],
	<tag:items:forge:berries> : [],
	<tag:items:forge:books> : [],
	<tag:items:forge:bookshelves> : [],
	<tag:items:forge:bows> : [],
	<tag:items:forge:buckets> : [],
	<tag:items:forge:chestplates> : [],
	<tag:items:forge:chest_boats> : [],
	<tag:items:forge:chests> : [],
	<tag:items:forge:cooked_beef> : [],
	<tag:items:forge:crops> : [],
	<tag:items:forge:cooked_fishes> : [],
	<tag:items:forge:cookies> : [],
	<tag:items:forge:doors> : [],
	<tag:items:forge:dusts> : [],
	<tag:items:forge:fences> : [],
	<tag:items:forge:fruits/sweet> : [],
	<tag:items:forge:fruits> : [],
	<tag:items:forge:glass_panes> : [],
	<tag:items:forge:gems> : [],
	<tag:items:forge:heads> : [],
	<tag:items:forge:helmets> : [],
	<tag:items:forge:hoes> : [],
	<tag:items:minecraft:igniters> : [ <item:twilightforest:fiery_sword>, <item:twilightforest:fiery_pickaxe>, <item:twilightdelight:fiery_knife>, <item:aether:flaming_sword> ],
	<tag:items:forge:mob_buckets> : [],
	<tag:items:forge:mushrooms> : [],
	<tag:items:forge:leggings> : [],
	<tag:items:forge:swords> : [],
	<tag:items:forge:trapdoors> : [],
	<tag:items:forge:vegatables> : [],
	<tag:items:forge:milk> : [ <item:aether:skyroot_milk_bucket> ],
	<tag:items:forge:shields> : [],
	<tag:items:forge:salad_ingredients> : [],
	<tag:items:forge:stripped_logs> : [],
	<tag:items:forge:stripped_wood> : [],
	<tag:items:forge:trapped_chests> : [],
	<tag:items:forge:wooden_chests> : [],
	<tag:items:forge:wooden_fence_gates> : [],
	<tag:items:forge:wooden_fences> : [],
	
	// Minecraft
	/// Add some mod tools to common tags
	/// Let Absent by Design wool blocks dampen vibrations
	/// Make Piglins respond to some golden blocks/items added by other mods 
	/// Allow Twilight Forest and Aether materials to be used for beacon payments
	/// Add some more item types to tags
	
	<tag:items:minecraft:axes> : [ <item:witherstormmod:command_block_axe> ],
	<tag:items:minecraft:swords> : [],
	<tag:items:minecraft:tools> : [],
	<tag:items:minecraft:creeper_igniters> : [ <item:twilightforest:fiery_sword>, <item:twilightforest:fiery_pickaxe>, <item:twilightdelight:fiery_knife>, <item:aether:flaming_sword> ],
	<tag:items:minecraft:dampens_vibrations> : [<item:absentbydesign:stairs_wool_purple>, <item:absentbydesign:stairs_wool_red>, <item:absentbydesign:stairs_wool_silver>, <item:absentbydesign:stairs_wool_white>, <item:absentbydesign:stairs_wool_yellow>, <item:absentbydesign:slab_wool_black>, <item:absentbydesign:slab_wool_blue>, <item:absentbydesign:slab_wool_brown>, <item:absentbydesign:slab_wool_gray>, <item:absentbydesign:slab_wool_cyan>, <item:absentbydesign:slab_wool_green>, <item:absentbydesign:slab_wool_light_blue>, <item:absentbydesign:slab_wool_lime>, <item:absentbydesign:slab_wool_magenta>, <item:absentbydesign:stairs_wool_blue>, <item:absentbydesign:stairs_wool_black>, <item:absentbydesign:slab_wool_yellow>, <item:absentbydesign:slab_wool_white>, <item:absentbydesign:slab_wool_silver>, <item:absentbydesign:slab_wool_red>, <item:absentbydesign:slab_wool_purple>, <item:absentbydesign:slab_wool_pink>, <item:absentbydesign:slab_wool_orange>, <item:absentbydesign:stairs_wool_brown>, <item:absentbydesign:stairs_wool_cyan>, <item:absentbydesign:stairs_wool_gray>, <item:absentbydesign:stairs_wool_green>, <item:absentbydesign:stairs_wool_light_blue>, <item:absentbydesign:stairs_wool_lime>, <item:absentbydesign:stairs_wool_magenta>, <item:absentbydesign:stairs_wool_orange>, <item:absentbydesign:stairs_wool_pink> ],
	<tag:items:minecraft:piglin_loved> : [ <item:goldenhopper:golden_hopper_minecart>, <item:telepass:gold_telepass>, <item:absentbydesign:slab_gold>, <item:absentbydesign:slab_raw_gold>, <item:absentbydesign:stairs_gold>, <item:absentbydesign:stairs_raw_gold>, <item:absentbydesign:wall_gold>, <item:absentbydesign:wall_raw_gold>, <item:aether_protect_your_moa:golden_moa_armor>, <item:packedup:gold_pallet>, <item:packedup:golden_apple_basket>, <item:packedup:golden_carrot_crate>, <item:packedup:raw_gold_crate>, <item:crittersandcompanions:gold_dragonfly_armor>, <item:leathered_boots:leathered_gold_boots>, <item:goldenhopper:golden_hopper> ],
	<tag:items:minecraft:beacon_payment_items> : [ <item:twilightforest:fiery_ingot>, <item:twilightforest:knightmetal_ingot>, <item:twilightforest:ironwood_ingot>, <item:deep_aether:stratus_ingot>, <item:aether:enchanted_gravitite>, <item:twilightforest:steeleaf_ingot>, <item:twilightforest:carminite>],
	<tag:items:minecraft:leaves> : [ <item:witherstormmod:tainted_leaves> ],
	<tag:items:minecraft:completes_find_tree_tutorial> : [ <item:witherstormmod:tainted_leaves> ],
	
	// Musical Foxes
	// Allow Foxes to use horns from other mods
	
	<tag:items:musicalfoxes:fox_can_play> : [ <item:endertrigon:dragon_horn>, <item:illagerinvasion:horn_of_sight> ],
	
	// Quad
	/// Allow "fiery" weapons from Aether and Twilight Forest to be used to set things on fire
	
	<tag:items:quad:fire_lighter> : [ <item:twilightforest:fiery_sword>, <item:twilightforest:fiery_pickaxe>, <item:twilightdelight:fiery_knife>, <item:aether:flaming_sword> ],
	
	// Quark
	/// Prevent certain Xtra Arrows from being affected by multishot to prevent weird behavior, glitches or exploits
	
	<tag:items:quark:ignore_multishot> : [ <item:xtraarrows:flint_ender_arrow>, <item:xtraarrows:flint_tracking_arrow>, <item:xtraarrows:golden_apple_arrow>, <item:xtraarrows:notch_apple_arrow>, <item:xtraarrows:leashing_arrow>, <item:xtraarrows:flint_magnetic_arrow>],
	
	// Shield Expansion
	/// Add shields from other mods
	
	<tag:items:shieldexp:shields> : [ <item:lost_aether_content:gravitite_shield>, <item:lost_aether_content:zanite_shield>, <item:twilightforest:knightmetal_shield>, <item:sullysmod:jade_shield>, <item:deep_aether:skyjade_shield>, <item:deep_aether:stratus_shield>, <item:artifacts:umbrella>, <item:endermanoverhaul:corrupted_shield>, <item:lost_aether_content:shield_of_emile> ],
	
	// Supplementaries
	/// Allow CWSM's Tainted Dust to be used in the Hourglass
	/// Blacklist backpacks from Shulker Boxes
	/// Allow "fiery" weapons from Aether and Twilight Forest to be used to set things on fire
	/// Make knives "stick" into pedestals
	
	<tag:items:supplementaries:cookies> : [ ],
	<tag:items:supplementaries:hourglass_dusts> : [ <item:witherstormmod:tainted_dust> ],
	<tag:items:supplementaries:fire_sources> : [ <item:twilightforest:fiery_sword>, <item:twilightforest:fiery_pickaxe>, <item:twilightdelight:fiery_knife>, <item:aether:flaming_sword> ],
	<tag:items:supplementaries:shulker_blacklist> : [ <item:wearablebackpacks:backpack>, <item:enderpack:enderpack> ],
	<tag:items:supplementaries:pedestal_downright> : [ <item:twilightdelight:ironwood_knife>, <item:twilightdelight:steeleaf_knife>, <item:twilightdelight:knightmetal_knife>, <item:twilightdelight:fiery_knife>, <item:aether:lightning_knife>, <item:farmersdelight:flint_knife>, <item:farmersdelight:iron_knife>, <item:farmersdelight:diamond_knife>, <item:farmersdelight:netherite_knife>, <item:farmersdelight:golden_knife>, <item:delightful:bone_knife>, <item:delightful:zinc_knife>, <item:delightful:gravitite_knife>, <item:delightful:holystone_knife>, <item:delightful:skyroot_knife>, <item:delightful:zanite_knife>, <item:delightful:phoenix_knife>, <item:delightful:skyjade_knife>, <item:delightful:stratus_knife> ],
	
	// Twilight Forest
	/// Allow breads from other mods to be used on Kobolds
	
	<tag:items:twilightforest:kobold_pacification_breads> : [ <item:delightful:cantaloupe_bread>, <item:upgrade_aquatic:mulberry_bread> ],
	
	// Wearable Backpacks
	/// Blacklist the Ender Pack 
	
	<tag:items:wearablebackpacks:backpack/blacklist> : [ <item:enderpack:enderpack> ]
};

/* Main script */

for tagEntry, itemList in itemTagEntries {
	
	tagEntry.add(itemList);
	
}