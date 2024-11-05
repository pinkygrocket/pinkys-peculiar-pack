/* Imports */

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.type.UnknownTag;
import crafttweaker.api.tag.manager.ITagManager;

import crafttweaker.api.resource.ResourceLocation;
import crafttweaker.api.entity.EntityType;

import stdlib.List;

/* Variables */

val resourcesEntries as ResourceLocation[][KnownTag<EntityType>] = {

	// Aether
	///	Enable the Wither Storm to ignore Aether invisiblity
	/// Prevent Skyroot tools from affecting boss drops
	/// Make sure Farmlife entities are treated as Aether entities
	
	<tag:entity_types:aether:ignore_invisibility> : [ <resource:witherstormmod:wither_storm>, <resource:witherstormmod:wither_storm_head>, <resource:witherstormmod:wither_storm_segment> ],
	<tag:entity_types:aether:whirlwind_unaffected> : [],
	<tag:entity_types:aether:no_skyroot_double_drops> : [ <resource:witherstormmod:wither_storm>, <resource:witherstormmod:wither_storm_head>, <resource:witherstormmod:wither_storm_segment> ],
	<tag:entity_types:aether:treated_as_aether_entity> : [],
	
	// Delightful
	
	<tag:entity_types:delightful:fatty_animals> : [],
	<tag:entity_types:delightful:drops_acorn> : [],
	
	// Ecologics
	<tag:entity_types:ecologics:penguin_hunt_targets> : [ <resource:babyfat:ranchu>, <resource:crittersandcompanions:koi_fish> ],
	
	// Enderman Overhaul
	/// Prevent teleportation of boss mobs from Aether, Twilight Forest, Wither Storm, and some non-mob entities
	
	<tag:entity_types:endermanoverhaul:cant_be_teleported> : [ <resource:twilightforest:alpha_yeti>, <resource:twilightforest:hydra>, <resource:twilightforest:knight_phantom>, <resource:twilightforest:lich>, <resource:twilightforest:minoshroom>, <resource:twilightforest:naga>, <resource:twilightforest:plateau_boss>, <resource:twilightforest:snow_queen>, <resource:twilightforest:ur_ghast>, <resource:aether:valkyrie_queen>, <resource:aether:slider>, <resource:aether:sun_spirit>, <resource:lost_aether_content:aerwhale_king>, <resource:witherstormmod:withered_symbiont>, <resource:witherstormmod:wither_storm>, <resource:witherstormmod:wither_storm_head>, <resource:witherstormmod:wither_storm_segment> ],
	
	# Friends and Foes
	//<tag:entity_types:friendsandfoes:mauler_prey> : [],
	
	# Forge
	
	### Register Wither Storm as a boss
	<tag:entity_types:forge:bosses> : [ <resource:witherstormmod:wither_storm> ],
	
	### Register Baby Fat and Critters and Companions mobs as fish
	<tag:entity_types:forge:fishes> : [ <resource:babyfat:ranchu>, <resource:crittersandcompanions:koi_fish> ],
	
	# Minecraft
	
	<tag:entity_types:minecraft:axolotl_hunt_targets> : [ <resource:babyfat:ranchu>, <resource:crittersandcompanions:koi_fish> ],
	<tag:entity_types:minecraft:freeze_immune_entity_types> : [ <resource:witherstormmod:wither_storm>, <resource:witherstormmod:wither_storm_head>, <resource:witherstormmod:wither_storm_segment> ],
	<tag:entity_types:minecraft:powder_snow_walkable_mobs> : [],
	<tag:entity_types:minecraft:frog_food> : [],
	
	// Nullscape
	
	// Prevent teleportation of boss mobs from Aether, Twilight Forest and Wither Storm
	<tag:entity_types:nullscape:not_teleportable> : [ <resource:twilightforest:alpha_yeti>, <resource:twilightforest:hydra>, <resource:twilightforest:knight_phantom>, <resource:twilightforest:lich>, <resource:twilightforest:minoshroom>, <resource:twilightforest:naga>, <resource:twilightforest:plateau_boss>, <resource:twilightforest:snow_queen>, <resource:twilightforest:ur_ghast>, <resource:aether:valkyrie_queen>, <resource:aether:slider>, <resource:aether:sun_spirit>, <resource:lost_aether_content:aerwhale_king>, <resource:witherstormmod:withered_symbiont>, <resource:witherstormmod:wither_storm>, <resource:witherstormmod:wither_storm_head>, <resource:witherstormmod:wither_storm_segment> ],
	
	# Sully's Mod - Make tortises scared of bosses from Aether, Twilight Forest and Wither Storm
	
	<tag:entity_types:sullysmod:attacks_baby_tortoises> : [],
	<tag:entity_types:sullysmod:scares_tortoises> : [ <resource:witherstormmod:wither_storm>, <resource:witherstormmod:wither_storm_head>, <resource:witherstormmod:wither_storm_segment> ],
	<tag:entity_types:sullysmod:cannot_be_flung> : [],
	<tag:entity_types:sullysmod:cannot_bounce> : [],
	
	// Supplementaries 
	
	<tag:entity_types:supplementaries:cage_catchable> : [],
	<tag:entity_types:supplementaries:jar_catchable> : [ <resource:netherdepthsupgrade:glowdine> ],
	
	// Twilight Forest
	/// Make cats and wolves sortable per Chested Companions
	
	<tag:entity_types:twilightforest:sortable_entities>: [ <resource:minecraft:cat>, <resource:minecraft:wolf> ],
	
	// Wither Storm Mod
	/// Prevent Wither Sickness from affecting bosses from Aether and Twilight Forest, causes issues
	/// Prevent the Wither Storm from targeting bosses from Aether and Twilight Forest, causes issues
	
	<tag:entity_types:witherstormmod:wither_sickness_immune> : [ <resource:twilightforest:alpha_yeti>, <resource:twilightforest:hydra>, <resource:twilightforest:knight_phantom>, <resource:twilightforest:lich>, <resource:twilightforest:minoshroom>, <resource:twilightforest:naga>, <resource:twilightforest:plateau_boss>, <resource:twilightforest:snow_queen>, <resource:twilightforest:ur_ghast>, <resource:aether:valkyrie_queen>, <resource:aether:slider>, <resource:aether:sun_spirit>, <resource:lost_aether_content:aerwhale_king> ],
	<tag:entity_types:witherstormmod:wither_storm_targeting_blacklist> : [ <resource:twilightforest:alpha_yeti>, <resource:twilightforest:hydra>, <resource:twilightforest:knight_phantom>, <resource:twilightforest:lich>, <resource:twilightforest:minoshroom>, <resource:twilightforest:naga>, <resource:twilightforest:plateau_boss>, <resource:twilightforest:snow_queen>, <resource:twilightforest:ur_ghast>, <resource:aether:valkyrie_queen>, <resource:aether:slider>, <resource:aether:sun_spirit>, <resource:lost_aether_content:aerwhale_king> ]
	
};

/* Main script */

for tagEntry, entityList in resourcesEntries {
	
	tagEntry.addId(entityList);
	
}