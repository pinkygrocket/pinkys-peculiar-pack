/* Imports */

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.type.UnknownTag;
import crafttweaker.api.tag.manager.ITagManager;

import crafttweaker.api.resource.ResourceLocation;

import stdlib.List;

/* Variables */

// Currently this doesn't do anything, but I'm keeping this for the future in case F&F adds support for other beehives.

val professionTagEntries as ResourceLocation[][UnknownTag] = {
	<tag:point_of_interest_type:minecraft:acquirable_job_site> : [ <resource:everycomp:faf_beehive>, <resource:betterbeekeeping:mod_beehive> ],
	<tag:point_of_interest_type:minecraft:village> : [ <resource:everycomp:faf_beehive>, <resource:betterbeekeeping:mod_beehive> ]
};

/* Main script */

for tagEntry, poiList in professionTagEntries {
	
	tagEntry.addId(poiList);
	
}