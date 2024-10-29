/* Imports */

import crafttweaker.api.tag.MCTag;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.type.UnknownTag;
import crafttweaker.api.tag.manager.ITagManager;

import crafttweaker.api.fluid.Fluid;
import crafttweaker.api.fluid.IFluidStack;

import stdlib.List;

/* Variables */

val fluidTagEntries as Fluid[][KnownTag<Fluid>] = {
	# <tag:fluids:aether:allowed_bucket_pickup> : [],
	<tag:fluids:twilightforest:fire_jet_fuel> : [ <fluid:ppp_packtweaks:fiery_blood> ],
	<tag:fluids:create:bottomless/deny>: [ <fluid:ppp_packtweaks:fiery_blood> ]
};

/* Main script */

for tagEntry, fluidList in fluidTagEntries {
	
	tagEntry.add(fluidList);
	
}