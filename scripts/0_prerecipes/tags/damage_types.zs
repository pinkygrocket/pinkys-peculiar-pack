/* Imports */

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.type.UnknownTag;
import crafttweaker.api.tag.manager.ITagManager;

import crafttweaker.api.resource.ResourceLocation;

import stdlib.List;

/* Variables */

val damageTypeEntries as ResourceLocation[][UnknownTag] = {

	// Swampier Swamps
	/// Allow the Formidibomb to blow up swamp gas 
	
	<tag:damage_type:swampier_swamps:blows_up_swamp_gas> : [ <resource:witherstormmod:formidibomb>, <resource:witherstormmod:player_formidibomb> ],
	
	// Twilight Forest
	/// Allow the Wither Storm to pierce Lich shields
	
	<tag:damage_type:twilightforest:breaks_lich_shields> : [ <resource:witherstormmod:wither_storm_attack_mob> ]
	
};

/* Main script */

/* for tagEntry, damageList in damageTypeEntries {
	
	tagEntry.addId(damageList);
	
} */
