/* Imports */

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.type.UnknownTag;
import crafttweaker.api.tag.manager.ITagManager;

import crafttweaker.api.mod.Mod;
import crafttweaker.api.mod.Mods;

import crafttweaker.api.resource.ResourceLocation;

import stdlib.List;

/* Main script */

// EMI is weird and likes to show tags for mods that aren't in the game, creating bloat.
// This script clears tags from mods that aren't in the game.
// Since it only runs on world load, this should't break datapacks or users adding mods.

for managerEntry in <tagmanager:items>.tags {

	var managerModID = managerEntry.id.namespace;
	
	if(loadedMods.isModLoaded(managerModID) || managerModID == "c" || managerModID == "items_displayed" || managerModID == "ppp_packtweaks") {
		
		for itemEntry in managerEntry.idElements {
		
			var itemModID = itemEntry.namespace;
		
			if(loadedMods.isModLoaded(itemModID) || itemModID == "ppp_packtweaks") {
		
			} else {
		
				<tagmanager:items>.removeId(managerEntry, itemEntry);
			
			}
		
		}
	
	} else {
		
		managerEntry.clear();
	}

	
}