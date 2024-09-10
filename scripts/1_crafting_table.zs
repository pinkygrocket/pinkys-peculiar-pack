/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.type.ShapedRecipe;
import crafttweaker.api.recipe.type.ShapelessRecipe;

import crafttweaker.api.ingredient.IIngredient;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.ItemDefinition;

import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.MCTag;

import crafttweaker.api.resource.ResourceLocation;

import mods.jeitweaker.Jei;
import mods.jeitweaker.ingredient.JeiIngredient;

import crafttweaker.api.recipe.MirrorAxis;

import crafttweaker.api.text.Component;
import crafttweaker.api.text.Message;

/* Objects */

public class craftingRecipeExtended {
	
	public var name as string : get, set;
	
	/* Valid types:
	 * SHAPED
	 * SHAPELESS 
	 * MIRRORED_ALL
	 */

	public var type as string : get, set;
	public var inputShaped as IIngredient[][] : get, set;
	public var inputShapeless as IIngredient[] : get, set;
	public var output as IItemStack : get, set;
	public var replace as bool : get, set;
	
	public this(setType as string, setOutput as IItemStack, setReplace as bool, setInput as IIngredient[]) as craftingRecipeExtended {
		
		this.type = setType;
		this.output = setOutput;
		this.inputShapeless = setInput;
		this.replace = setReplace;
		
	}
	
	public this(setType as string, setOutput as IItemStack, setReplace as bool, setInput as IIngredient[][]) as craftingRecipeExtended {
		
		this.type = setType;
		this.output = setOutput;
		this.inputShaped = setInput;
		this.replace = setReplace;
		
	}
	
	public registerRecipe() as void {
	
		if(this.replace) {
		
			craftingTable.remove(this.output);
			
		}
			
		this.name = this.output.registryName.namespace + "_" + this.output.registryName.path;
		
		if(this.type == "SHAPED") {
		
			craftingTable.addShaped(this.name, this.output, this.inputShaped);
		
		} else if (this.type == "SHAPELESS") {
		
			craftingTable.addShapeless(this.name, this.output, this.inputShapeless);
		
		} else if (this.type == "MIRRORED_ALL") {
		
			craftingTable.addShapedMirrored(this.name, MirrorAxis.ALL, this.output, this.inputShaped);
		
		}
		
		return;
		
	}
	
}

public class craftingRecipePatterned {
	
	public var name as string : get, set;
	
	/* 	Valid patterns:
		* CAKE
		* CHEST_BOAT
		* ELEVATOR
		* SLEEPING_BAG
		* LANTERN_CANDLE
		* LANTERN_OIL
		* LANTERN_PUMPKIN
		* LANTERN_FLOWER
		* LANTERN_ORB
		* LANTERN_PAPER
		* PENNANT_SQUARE
		* PENNANT_LIME
		* PENNANT_DOVETAIL
		* PENNANT_SPEARHEAD
		* PENNANT_TRIANGLE
		* LANTERN_FAIRY
		* LANTERN_SKULL
		* LANTERN_GHOST
		* LANTERN_SPIDER
		* LANTERN_WITCH
		* LANTERN_SNOWFLAKE
		* LANTERN_HEART
		* LANTERN_MOON
		* LANTERN_STAR
		* LANTERN_ICICLE
		* LANTERN_METEOR
		* HAMMERED_PLATE
	*/
	
	public var pattern as string : get, set;
	
	public var output as IItemStack : get, set;
	public var replace as bool : get, set;
	
	public var inputSingle as IIngredient : get, set;
	public var inputMultiple as IIngredient[]: get, set;
	
	public var finalInputShaped as IIngredient[][]: get, set;
	
	public this(setPattern as string, setOutput as IItemStack, setReplace as bool, setInput as IIngredient) as void {
		
		this.pattern = setPattern;
		this.output = setOutput;
		this.replace = setReplace;
		this.inputSingle = setInput;
		
	}
	
	public this(setPattern as string, setOutput as IItemStack, setReplace as bool, setInput as IIngredient[]) as void {
		
		this.pattern = setPattern;
		this.output = setOutput;
		this.replace = setReplace;
		this.inputMultiple = setInput;
		
	}
	
	public registerRecipe() as void {
		
		this.name = this.output.registryName.namespace + "_" + this.output.registryName.path;
		
		if(this.replace) {
			
			craftingTable.remove(this.output);
			
		}
		
		if (this.pattern == "CAKE") {
			
			craftingTable.addShaped(this.name + "_vanilla", this.output, [[<tag:items:forge:milk>, <tag:items:forge:milk>, <tag:items:forge:milk>], [<item:minecraft:sugar>, this.inputSingle, <item:minecraft:sugar>], [<tag:items:forge:grain/wheat>, <tag:items:forge:grain/wheat>, <tag:items:forge:grain/wheat>]]);
			craftingTable.addShaped(this.name + "_dough", this.output, [[<item:minecraft:air>, <tag:items:forge:milk>, <item:minecraft:air>], [<item:minecraft:sugar>, this.inputSingle, <item:minecraft:sugar>,], [<item:minecraft:air>, <tag:items:forge:dough>, <item:minecraft:air>]]);
	
		} else if (this.pattern == "CHEST_BOAT") {
			
			craftingTable.addShaped(this.name + "_shaped", this.output, [[<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], [this.inputMultiple[0], <tag:items:forge:chests/wooden>, this.inputMultiple[0]], [this.inputMultiple[0], this.inputMultiple[0], this.inputMultiple[0]]]);
			craftingTable.addShapeless(this.name + "_shapeless", this.output, [<tag:items:forge:chests/wooden>, this.inputMultiple[1]]);
			
		} else if (this.pattern == "LANTERN_OIL") {
		
			
		
		} else {
			
			if (this.pattern == "SLEEPING_BAG") {
				
				this.finalInputShaped = [[<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], [this.inputSingle, this.inputSingle, this.inputSingle], [<item:minecraft:air>, <tag:items:forge:string>, <item:minecraft:air>]];
				
			} else if (this.pattern == "ELEVATOR") {
				
				this.finalInputShaped = [[this.inputSingle, this.inputSingle, this.inputSingle],[this.inputSingle, <tag:items:forge:ender_pearls>, this.inputSingle], [this.inputSingle, this.inputSingle, this.inputSingle]];
				
			} else if (this.pattern == "") {
			
			}
			
			if (this.output.owner == "fairylights") {
				
				this.name += "_" + makeSafeRecipeName(this.output.hoverName);
				
			}
			
			craftingTable.addShaped(this.name, this.output, this.finalInputShaped);
			
		}
		
		return;
		
	}
	
}

public class color {
	
	public var name as string : get, set;
	public var dye as KnownTag<ItemDefinition> : get, set;
	public var fairyLightsColorCode as int: get, set;
	
	public this(inputName as string, inputDye as KnownTag<ItemDefinition>, inputCode as int) {
		
		this.name = inputName;
		this.dye = inputDye;
		this.fairyLightsColorCode = inputCode;
		
	}
	
}

/* Variables */

val standardPackRecipes as craftingRecipeExtended[] = [

	// Intergration - Make Supplementaries's Cog Block be crafted with Create cogs
	
	new craftingRecipeExtended("SHAPED", <item:supplementaries:cog_block>, true, [[<tag:items:forge:ingots/copper>, <item:create:cogwheel>, <tag:items:forge:ingots/copper>], [<item:create:cogwheel>, <tag:items:forge:storage_blocks/redstone>, <item:create:cogwheel>], [<tag:items:forge:ingots/copper>, <item:create:cogwheel>, <tag:items:forge:ingots/copper>]]),
	
	// Progression - Make the Explorer's Compass a midgame item that requires some exploration to get, as a tradeoff for it's power
	
	new craftingRecipeExtended("SHAPED", <item:explorerscompass:explorerscompass>, true, [[<item:twilightforest:ironwood_ingot>, <tag:items:minecraft:stone_bricks>, <item:minecraft:netherite_ingot>], [<tag:items:minecraft:stone_bricks>, <item:minecraft:compass>, <tag:items:minecraft:stone_bricks>], [<item:deep_aether:stratus_ingot>, <tag:items:minecraft:stone_bricks>, <item:quark:diamond_heart>]]),
	
	// Progression - Cooking For Blockhead's Crafting Book requiring diamonds is a bit silly
	
	new craftingRecipeExtended("SHAPED", <item:cookingforblockheads:crafting_book>, true, [[<item:minecraft:air>, <tag:items:forge:ingots/iron>, <item:minecraft:air>], [<item:minecraft:crafting_table>, <item:cookingforblockheads:recipe_book>, <item:minecraft:crafting_table>], [<item:minecraft:air>, <tag:items:forge:ingots/iron>, <item:minecraft:air>]]),
	
	// Intergration - Make the Carved Bamboo Chimes require dried bamboo from Bamboo Everything
	
	new craftingRecipeExtended("SHAPED", <item:chimes:carved_bamboo_chimes>, true, [[<item:minecraft:air>, <item:minecraft:oak_slab>, <item:minecraft:air>], [<item:minecraft:air>, <tag:items:forge:string>, <item:minecraft:air>], [<item:minecraft:air>, <item:bambooeverything:dry_bamboo>, <item:minecraft:air>]]),
	
	// Intergration/Progression - Make Create's sheets possible to be crafted with a hammer, for easier progression
	
	new craftingRecipeExtended("SHAPELESS", <item:create:copper_sheet>, false, [ <item:minecraft:copper_ingot>, <tag:items:crafttweaker:hammers>.asIIngredient().anyDamage().transformDamage() ]),
	new craftingRecipeExtended("SHAPELESS", <item:create:brass_sheet>, false, [ <item:create:brass_ingot>, <tag:items:crafttweaker:hammers>.asIIngredient().anyDamage().transformDamage() ]),
	new craftingRecipeExtended("SHAPELESS", <item:create:iron_sheet>, false, [ <item:minecraft:iron_ingot>, <tag:items:crafttweaker:hammers>.asIIngredient().anyDamage().transformDamage() ]),
	new craftingRecipeExtended("SHAPELESS", <item:create:golden_sheet>, false, [ <item:minecraft:gold_ingot>, <tag:items:crafttweaker:hammers>.asIIngredient().anyDamage().transformDamage() ]),
	new craftingRecipeExtended("SHAPELESS", <item:cogsofcarminite:ironwood_sheet>, false, [ <tag:items:forge:ingots/fiery>, <tag:items:crafttweaker:hammers>.asIIngredient().anyDamage().transformDamage()]),
	new craftingRecipeExtended("SHAPELESS", <item:cogsofcarminite:knightmetal_sheet>, false, [ <item:twilightforest:knightmetal_ingot>, <tag:items:crafttweaker:hammers>.asIIngredient().anyDamage().transformDamage()]),
	new craftingRecipeExtended("SHAPELESS", <item:cogsofcarminite:fiery_sheet>, false, [ <item:twilightforest:fiery_ingot>, <tag:items:crafttweaker:hammers>.asIIngredient().anyDamage().transformDamage()]),
	
	// Progression - Needing iron and redstone to craft a map is a little silly
	
	new craftingRecipeExtended("SHAPELESS", <item:minecraft:map>, true, [ <item:minecraft:ink_sac>, <tag:items:forge:paper>]),
	
	// Intergration - Make Create's dough --> slime ball recipe accept any lime dye
	
	new craftingRecipeExtended("SHAPELESS", <item:minecraft:slime_ball>, false, [ <tag:items:forge:dough>, <tag:items:forge:dyes/lime>]),
	
	// Intergration - Make the hammer a copper item and use rope to make item
	
	new craftingRecipeExtended("SHAPED", <item:justhammers:iron_impact_hammer>, true, [[<item:minecraft:air>, <item:minecraft:copper_block>, <tag:items:forge:ropes>], [<item:minecraft:air>, <tag:items:forge:rods/wooden>, <item:minecraft:copper_block>], [<tag:items:forge:rods/wooden>, <item:minecraft:air>, <item:minecraft:air>]]),
	
	// Progression - Wooden stairs/slabs/etc. are being moved to the Sawmill, so it needs to be obtainable without them
	
	new craftingRecipeExtended("SHAPED", <item:sawmill:sawmill>, true, [[<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], [<item:minecraft:air>, <tag:items:forge:ingots/iron>, <item:minecraft:air>], [<tag:items:minecraft:planks>, <tag:items:minecraft:planks>, <tag:items:minecraft:planks>]]),
	
	// Intergration - Accept any torch to craft various items that only accepted vanilla torches
	
	new craftingRecipeExtended("SHAPED", <item:minecraft:lantern>, true, [[<tag:items:forge:nuggets/iron>, <tag:items:forge:nuggets/iron>, <tag:items:forge:nuggets/iron>], [<tag:items:forge:nuggets/iron>, <tag:items:crafttweaker:torches>, <tag:items:forge:nuggets/iron>], [<tag:items:forge:nuggets/iron>, <tag:items:forge:nuggets/iron>, <tag:items:forge:nuggets/iron>]]),
	new craftingRecipeExtended("SHAPELESS", <item:minecraft:jack_o_lantern>, true, [<tag:items:crafttweaker:torches>, <item:minecraft:carved_pumpkin>]),
	new craftingRecipeExtended("SHAPED", <item:torchmaster:megatorch>, true, [[<tag:items:crafttweaker:torches>, <tag:items:crafttweaker:torches>, <tag:items:crafttweaker:torches>], [<tag:items:forge:gems/diamond>, <tag:items:minecraft:logs>, <tag:items:forge:gems/diamond>], [<item:minecraft:gold_block>, <tag:items:minecraft:logs>, <item:minecraft:gold_block>]]),
	new craftingRecipeExtended("SHAPED", <item:quark:stone_lamp>, true, [[<item:minecraft:stone>, <item:minecraft:stone>, <item:minecraft:stone>], [<item:minecraft:stone>, <tag:items:crafttweaker:torches>, <item:minecraft:stone>], [<item:minecraft:stone>, <item:minecraft:stone>, <item:minecraft:stone>]]),
	new craftingRecipeExtended("SHAPED", <item:quark:stone_brick_lamp>, true, [[<item:minecraft:stone_bricks>, <item:minecraft:stone_bricks>, <item:minecraft:stone_bricks>], [<item:minecraft:stone_bricks>, <tag:items:crafttweaker:torches>, <item:minecraft:stone_bricks>], [<item:minecraft:stone_bricks>, <item:minecraft:stone_bricks>, <item:minecraft:stone_bricks>]]),
	new craftingRecipeExtended("SHAPED", <item:supplementaries:sconce>, true, [[<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], [<tag:items:forge:nuggets/iron>, <tag:items:crafttweaker:torches>, <tag:items:forge:nuggets/iron>], [<item:minecraft:air>, <tag:items:forge:nuggets/iron>, <item:minecraft:air>]]),
	
	// Progression/Gamefeel - Make Wooden Shears require flint
	
	new craftingRecipeExtended("MIRRORED_ALL", <item:woodenshears:wshears_oak>, true,[[<item:minecraft:air>, <item:minecraft:flint>, <item:minecraft:air>],[<item:minecraft:flint>, <tag:items:forge:rods/wooden>, <item:minecraft:air>],[<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]),
	
	// Intergration - Make Twilight Forest's Final Castle bricks craftable with Moon Shards
	// Misc that I still need to figure WTF I was thinking
	
	new craftingRecipeExtended("SHAPED", <item:ascended_quark:skyroot_chest>, true, [[<item:aether:skyroot_planks>, <item:aether:skyroot_planks>, <item:aether:skyroot_planks>], [<item:aether:skyroot_planks>, <item:minecraft:air>, <item:aether:skyroot_planks>], [<item:aether:skyroot_planks>, <item:aether:skyroot_planks>, <item:aether:skyroot_planks>]]),
	new craftingRecipeExtended("SHAPED", <item:supplementaries:wrench>, true, [[<item:minecraft:air>, <tag:items:forge:ingots/copper>, <item:minecraft:air>], [<item:minecraft:air>, <tag:items:forge:rods>, <tag:items:forge:ingots/copper>], [<tag:items:forge:rods>, <item:minecraft:air>, <item:minecraft:air>]]),
	new craftingRecipeExtended("SHAPELESS", <item:minecraft:glowstone_dust> * 4, false, [ <item:minecraft:glowstone> ]),
	new craftingRecipeExtended("SHAPELESS", <item:minecraft:amethyst_shard> * 4, false, [ <item:minecraft:amethyst_block> ]),
	new craftingRecipeExtended("SHAPED", <item:xercapaint:item_easel>, true, [[<item:minecraft:air>, <tag:items:forge:rods/wooden>, <item:minecraft:air>], [<tag:items:forge:rods/wooden>, <item:minecraft:air>, <tag:items:forge:rods/wooden>], [<tag:items:forge:rods/wooden>, <item:minecraft:air>, <tag:items:forge:rods/wooden>]]),
	new craftingRecipeExtended("SHAPELESS", <item:map_atlases:atlas>, false, [ <item:minecraft:book>, <tag:items:crafttweaker:maps>, <item:minecraft:compass>, <tag:items:crafttweaker:adhesives> ]),
	new craftingRecipeExtended("SHAPED", <item:ecologics:flowering_azalea_chest_boat>, false, [[<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>], [<item:ecologics:flowering_azalea_planks>, <tag:items:forge:chests/wooden>, <item:ecologics:flowering_azalea_planks>], [<item:ecologics:flowering_azalea_planks>, <item:ecologics:flowering_azalea_planks>, <item:ecologics:flowering_azalea_planks>]])
];

val patternedPackRecipes as craftingRecipePatterned[] = [

	// Intergration - Make the Minecraft Cake take any valid egg
	
	new craftingRecipePatterned("CAKE", <item:minecraft:cake>, true, <tag:items:forge:eggs>),
	/* new craftingRecipePatterned("CHEST_BOAT", <item:mysticsbiomes:maple_chest_boat>, true, [<item:mysticsbiomes:maple_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:mysticsbiomes:jacaranda_chest_boat>, true, [<item:mysticsbiomes:jacaranda_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:mysticsbiomes:strawberry_chest_boat>, true, [<item:mysticsbiomes:strawberry_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:mysticsbiomes:strawberry_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:mysticsbiomes:peach_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:mysticsbiomes:sea_foam_chest_boat>, true, []),

	new craftingRecipePatterned("CHEST_BOAT", <item:ecologics:flowering_azalea_chest_boat>, true, [<item:ecologics:flowering_azalea_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:ecologics:azalea_chest_boat>, true, [<tag:items:crafttweaker:azalea_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:ecologics:walnut_chest_boat>, true, [<item:ecologics:walnut_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:ecologics:coconut_chest_boat>, true, [<item:ecologics:coconut_planks>]),
	
	new craftingRecipePatterned("CHEST_BOAT", <item:twilightforest:sorting_chest_boat>, true, [<item:twilightforest:sorting_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:twilightforest:mining_chest_boat>, true, [<item:twilightforest:mining_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:twilightforest:transformation_chest_boat>, true, [<item:twilightforest:transformation_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:twilightforest:time_chest_boat>, true, [<item:twilightforest:time_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:twilightforest:dark_chest_boat>, true, [<item:twilightforest:dark_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:twilightforest:mangrove_chest_boat>, true, [<item:minecraft:mangrove_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:twilightforest:canopy_chest_boat>, true, [<item:twilightforest:canopy_planks>]),
	new craftingRecipePatterned("CHEST_BOAT", <item:twilightforest:twilight_oak_chest_boat>, true, [<item:twilightforest:twilight_oak_planks>]), 
	
	new craftingRecipePatterned("CHEST_BOAT", <item:deep_aether:roseroot_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:deep_aether:yagroot_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:deep_aether:cruderoot_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:deep_aether:conberry_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:deep_aether:sunroot_chest_boat>, true, []),
	
	new craftingRecipePatterned("CHEST_BOAT", <item:aether:skyroot_chest_boat>, true, []),
	
	new craftingRecipePatterned("CHEST_BOAT", <item:upgrade_aquatic:driftwood_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:upgrade_aquatic:river_chest_boat>, true, []),
	
	new craftingRecipePatterned("CHEST_BOAT", <item:boatload:crimson_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:boatload:warped_chest_boat>, true, []),
	
	new craftingRecipePatterned("CHEST_BOAT", <item:fireproofboats:crimson_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:fireproofboats:warped_chest_boat>, true, []),
	
	new craftingRecipePatterned("CHEST_BOAT", <item:snifferplus:stone_pine_chest_boat>, true, []),
	new craftingRecipePatterned("CHEST_BOAT", <item:autumnity:maple_chest_boat>, true, []),
	*/
	
	// Intergration - Make Comfort's Sleeping Bags take any valid dye item
	
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_white>, false, <item:minecraft:white_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_orange>, false, <item:minecraft:orange_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_magenta>, false, <item:minecraft:magenta_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_light_blue>, false, <item:minecraft:light_blue_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_yellow>, false, <item:minecraft:yellow_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_lime>, false, <item:minecraft:lime_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_pink>, false, <item:minecraft:pink_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_gray>, false, <item:minecraft:gray_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_light_gray>, false, <item:minecraft:light_gray_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_cyan>, false, <item:minecraft:cyan_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_purple>, false, <item:minecraft:purple_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_blue>, false, <item:minecraft:blue_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_brown>, false, <item:minecraft:brown_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_green>, false, <item:minecraft:green_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_red>, false, <item:minecraft:red_wool>),
	new craftingRecipePatterned("SLEEPING_BAG", <item:comforts:sleeping_bag_black>, false, <item:minecraft:black_wool>),
	
	// Intergration - Make Elevator Mod's Elevators take any valid dye item
	
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_white>, true, <item:minecraft:white_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_orange>, true, <item:minecraft:orange_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_magenta>, true, <item:minecraft:magenta_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_light_blue>, true, <item:minecraft:light_blue_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_yellow>, true, <item:minecraft:yellow_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_lime>, true, <item:minecraft:lime_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_pink>, true, <item:minecraft:pink_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_gray>, true, <item:minecraft:gray_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_light_gray>, true, <item:minecraft:light_gray_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_cyan>, true, <item:minecraft:cyan_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_purple>, true, <item:minecraft:purple_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_blue>, true, <item:minecraft:blue_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_brown>, true, <item:minecraft:brown_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_green>, true, <item:minecraft:green_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_red>, true, <item:minecraft:red_wool>),
	new craftingRecipePatterned("ELEVATOR", <item:elevatorid:elevator_black>, true, <item:minecraft:black_wool>)
];

val metalSheets as IItemStack[IItemStack] = {

};

val colors as color[string] = {
	"white" : new color("white", <tag:items:forge:dyes/white>, 16383998),
	"light_gray" : new color("light_gray", <tag:items:forge:dyes/light_gray>, 10329495),
	"gray" : new color("gray", <tag:items:forge:dyes/gray>, 6316128),
	"black" : new color("black", <tag:items:forge:dyes/black>, 3289650),
	"brown" : new color("brown", <tag:items:forge:dyes/brown>, 8606770),
	"red" : new color("red", <tag:items:forge:dyes/red>, 11546150),
	"orange" : new color("orange", <tag:items:forge:dyes/orange>, 16351261),
	"yellow" : new color("yellow", <tag:items:forge:dyes/yellow>, 16701501),
	"lime" : new color("lime", <tag:items:forge:dyes/lime>, 8439583),
	"green" : new color("green", <tag:items:forge:dyes/green>, 6192150),
	"cyan" : new color("cyan", <tag:items:forge:dyes/cyan>, 1481884),
	"light_blue" : new color("light_blue", <tag:items:forge:dyes/light_blue>, 3847130),
	"blue" : new color("blue", <tag:items:forge:dyes/blue>, 3949738),
	"purple" : new color("purple", <tag:items:forge:dyes/purple>, 8991416),
	"magenta" : new color("magenta", <tag:items:forge:dyes/magenta>, 13061821),
	"pink" : new color("pink", <tag:items:forge:dyes/pink>, 15961002)
};

// Items that are being completely removed from the pack/game

val completeItemRemovalByItem as IItemStack[] = [

	<item:absentbydesign:wall_tuff>,
	
	// Absent by Design - Some overlap with other compat mods
	
	<item:absentbydesign:slab_calcite>,
	<item:absentbydesign:wall_calcite>,
	<item:absentbydesign:stairs_calcite>,
	<item:absentbydesign:stairs_tuff>,
	<item:absentbydesign:gate_nether_bricks>,
	
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
	"justhammers:(reinforced|destructor).*",
	
	// Create Connected - Just don't want the discs
	"create_connected:music_disc.*"
];

val recipeRemovalByName as string[] = [
	"absentbydesign:stripped_oak_wood",
	"absentbydesign:stripped_birch_wood",
	"absentbydesign:stripped_spruce_wood",
	"absentbydesign:stripped_jungle_wood",
	"absentbydesign:stripped_acacia_wood",
	"absentbydesign:stripped_dark_oak_wood",
	"create:crafting/appliances/slime_ball",
	"quark:tweaks/crafting/utility/misc/easy_sticks",
	"deep_aether:pumpkin_pie",
	"aether:skyroot_chest",
	"aether:skyroot_crafting_table"
];

val recipeRemovalByRegex as string[] = [
	"comforts:sleeping_bag_.*"
];

/* Main script */

for input in completeItemRemovalByItem {
	craftingTable.remove(input);
	Jei.hideIngredient(input);
}

for regex in completeItemRemovalByRegex {
	
	craftingTable.removeByRegex(regex);
	Jei.hideIngredientsByRegex(regex);
	
}

for recipe in recipeRemovalByName {
	craftingTable.removeByName(recipe);
}

for recipe in recipeRemovalByRegex {
	craftingTable.removeByRegex(recipe);
}

for recipe in standardPackRecipes {
	recipe.registerRecipe();
}

for recipe in patternedPackRecipes {
	recipe.registerRecipe();
}

/* Functions */

public function makeSafeRecipeName(inputString as string) as string {
	
	var output as string = "";
	output += inputString;
	output = stringFindAndReplace(output, " ", "_");
	output = stringFindAndReplace(output, "'", "_");
	output = stringToLowercase(output);
	return output;
	
}

public function stringFindAndReplace(inputString as string, inputFind as char, inputReplace as char) as string {
	
	var output as string = "";
	
	/* We have to use a while loop because 1.20.1 crafttweaker can't parse old basic for loops,
	and for loops are undocumented in 1.20.1's documentation. */
	
	var counter as int = 0;
	var length as int = inputString.length; // CT throws a ambiguity error if we don't say this is an int
	
	while (length > counter) {
		
		if (inputString[counter] == inputFind) {
			
			output += inputReplace;
			
		} else {
			
			output += inputString[counter];
			
		}
		
		counter += 1;
		
	}
	
	return output;
	
}

public function stringToLowercase(inputString as string) as string {
	
	var output as string = "";
	
	/* We have to use a while loop because 1.20.1 crafttweaker can't parse old basic for loops,
	and for loops are undocumented in 1.20.1's documentation. */
	
	var counter as int = 0;
	var length as int = inputString.length; // CT throws a ambiguity error if we don't say this is an int
	
	var CHAR_ARRAY as char[char] = {
		"A" : "a",
		"B" : "b",
		"C" : "c",
		"D" : "d",
		"E" : "e",
		"F" : "f",
		"G" : "g",
		"H" : "h",
		"I" : "i",
		"J" : "j",
		"K" : "k",
		"L" : "l",
		"M" : "m",
		"N" : "n",
		"O" : "o",
		"P" : "p",
		"Q" : "q",
		"R" : "r",
		"S" : "s",
		"T" : "t",
		"U" : "u",
		"V" : "v",
		"W" : "w",
		"X" : "x",
		"Y" : "y",
		"Z" : "z"
	};
	
	while (length > counter) {
		
		var charIsUppercase = false;
		var savedLowercaseChar as string = "";
		
		for uppercaseCharacter, lowercaseCharacter in CHAR_ARRAY {
			
			if (uppercaseCharacter == inputString[counter]) {
				
				charIsUppercase = true;
				savedLowercaseChar = lowercaseCharacter as string;
				
			}
			
		}
		
		if (charIsUppercase) {
			
			output += savedLowercaseChar;
			
		} else {
			
			output += inputString[counter];
			
		}
		
		counter += 1;
		
	}
	
	return output;
	
}