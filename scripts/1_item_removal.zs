/* Imports */

import crafttweaker.api.recipe.IRecipeManager;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;

import crafttweaker.api.ingredient.IIngredient;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.ItemDefinition;

import mods.jeitweaker.Jei;
import mods.jeitweaker.ingredient.JeiIngredient;

/* Variables */

val completeItemRemovalByItem as IItemStack[] = [
	
	<item:beautify:warped_trellis>,
	<item:beautify:birch_trellis>,
	<item:beautify:jungle_trellis>,
	<item:beautify:acacia_trellis>,
	<item:beautify:crimson_trellis>,
	<item:beautify:dark_oak_trellis>,
	<item:beautify:spruce_trellis>,
	<item:beautify:oak_trellis>,
	<item:beautify:mangrove_trellis>,
	

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
	
	<item:minecraft:beehive>
];

val completeItemRemovalByRegex as string[] = [

	// Create Bells and Whistles - Don't like the look of the pilots, may bring them back later
	"bellsandwhistles:.*_pilot",
	
	// Mystic's Biomes - Overlap with vanilla (why) and Autumnity
	"mysticsbiomes:.*(cherry|maple|frosted)_.*",
	
	// Wither Storm Mod - Having command block versions of every tool in every class is bloat
	"witherstormmod:(wooden|stone|iron|gold)_command.*",
	
	// Xtra Arrows - Has a lot of bloat, we only want the base level of Arrows
	"xtraarrows:(flint|diamond|iron|golden|netherite)_.*",
	
	// Create Mechanical Spawner - We are only using the mechanical spawner for the Wither Storm
	"create_mechanical_spawner:.*_bucket",
	
	// Friends and Foes - Overlap with Better Beekeeping
	"friendsandfoes:.*_beehive",
	
	// Every Compat - Some overlap with other crosscompat mods
	"everycomp:fd/twilightforest/.*_cabinet",
	
	// Just Hammers - I don't want to make hammers for every tool class but still want the functionality
	"justhammers:.*_core",
	
	// Create DD - Most of Create DD is random undocumented things that I don't want and doesn't fit this pack/game
	"create_dd:.*(gilded_rose|sail|asphalt|mechanism|rubber|dolomite|gabbro).*",
	"v_slab_compat:create_dd/.*(dolomite|gabbro).*",
	
	// Just Hammers - I don't want to make hammers for every tool class but still want the functionality
	"justhammers:(stone|gold|diamond|netherite).*",
	"justhammers:.*(reinforced|destructor).*",
	
	// Create Connected - Just don't want the discs
	"create_connected:music_disc.*",
	
	// Nether's Delight - Don't like the Machetes because they have no compat
	"nethersdelight.*_machete"
];

for regex in completeItemRemovalByRegex {
	
	recipes.removeByRegex(regex);
	Jei.hideIngredientsByRegex(regex);
	
}

for input in completeItemRemovalByItem {

	recipes.remove(input);
	Jei.hideIngredient(input);
	
}

<recipetype:witherstormmod:anvil>.removeAll();
