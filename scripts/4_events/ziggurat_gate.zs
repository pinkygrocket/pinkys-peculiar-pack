/******************************************************************************************
	This script handles saving, loading and updating CraftTweaker save data representing whether or not a Wither Storm is active in the server. This save data can then be accessed by other CraftTweaker scripts.
	
	This script and save data works regardless of what dimension a Wither Storm is present in and/or if there are two or more Wither Storms present.
	
	However, this script does not work if added to a pre-existing save game with an already-present Wither Storm; it must be added BEFORE summoning/spawning.
******************************************************************************************/

/* Imports */

import crafttweaker.api.game.Server;

import crafttweaker.api.world.Level;
import crafttweaker.api.world.LevelAccessor;
import crafttweaker.api.world.LevelReader;
import crafttweaker.api.world.ServerLevel;
import crafttweaker.api.world.SavedData;
import crafttweaker.api.world.CraftTweakerSavedData;

import crafttweaker.forge.api.event.Event;
import crafttweaker.forge.api.event.entity.EntityEvent;
import crafttweaker.forge.api.event.entity.living.LivingEvent;
import crafttweaker.forge.api.event.entity.player.PlayerEvent;
import crafttweaker.forge.api.interact.PlayerInteractEvent;
import crafttweaker.forge.api.event.interact.RightClickBlockEvent;

import crafttweaker.forge.api.event.entity.EntityJoinLevelEvent;
import crafttweaker.forge.api.event.entity.living.LivingDeathEvent;

import crafttweaker.api.util.math.BlockPos;

import crafttweaker.api.data.IData;

/* Main script */

/* This event handles setting initial save data - this should cover most use cases except if a Wither Storm is summoned in an empty server. */

/* events.register<crafttweaker.forge.api.event.entity.player.PlayerLoggedInEvent>(event => {

	val level = event.level;
	
	if (!level.isClientSide) {
		
		val server = (event.level as ServerLevel).server;
		
		if ("isWitherStormActive" in server.overworldData.getData().asMap()) {
			
			println("Wither Storm CraftTweaker save data already set. Not updating current value");
			
		} else {
			
			val allDimensions = server.getAllLevels();
			val isWitherStormAlreadyActive = false;
			
			for dimension in allDimensions {
				
				val witherStormEntities = dimension.getEntities((entity as MCEntity) => true, <entitytype:witherstormmod:wither_storm>);
				
				if (witherStormEntities) {
					
					isWitherStormAlreadyActive = true;
					
				}
				
			}
			
			println("Wither Storm CraftTweaker save data not set");
			
			if (isWitherStormAlreadyActive) {
				
				println("Setting initial Wither Storm CraftTweaker save data value to false (no storm active)");
				server.overworldData.setData({isWitherStormActive: false});
			
			} else {
			
				println("Setting initial Wither Storm CraftTweaker save data value to true (storm active)");
				server.overworldData.setData({isWitherStormActive: true});
			
			}
			
		}
		
	}
	
}); */


// This event handles updating save data when a Wither Storm joins the world.

events.register<crafttweaker.forge.api.event.entity.EntityJoinLevelEvent>(event => {
	
	// Setting a few variables to make things easier to read.
	
	val level = event.level;
	val entity = event.entity;
	
	if (!level.isClientSide && entity.type == <entitytype:witherstormmod:wither_storm>) { 
		
		/* 	The server variable needs to be declared on the event running server-side; EntityJoinLevelEvent runs on both the server and the client, and defining the server on the client-side of the event causes bugs.
			This also prevents the code from firing twice. */
		
		val server = (event.level as ServerLevel).server;
		
		/* 	Since there are different functions for setting new data and updating existing data, we need to check if Wither Storm data is already present in the save data.
			At the same time, we check if another Wither Storm is already present. */
		
		val isWitherStormDataSet = false;
		val isWitherStormAlreadyActive = false;
	
		if ("isWitherStormActive" in server.overworldData.getData().asMap()) {
			
			isWitherStormDataSet = true;
			
			val witherStormDataInitiallyActive as bool = (event.level as ServerLevel).server.overworldData.getData()["isWitherStormActive"].asBool();
			
			if (witherStormDataInitiallyActive) {
				
				isWitherStormAlreadyActive = true;
				println("Wither Storm CraftTweaker save data already set to true (storm active)");
				println("One or more Wither Storms are still active. Not updating current value");
				
			} else {
				
				println("Wither Storm CraftTweaker save data already set to false (no storm active)");
				
			}
			
		} else {
			
			println("Wither Storm CraftTweaker save data not set");
			
		}
		
		// Now that checks are done, we go ahead and update the save data.
		
		if (!isWitherStormDataSet) {
			
			server.overworldData.setData({isWitherStormActive: true});
			println("Wither storm CT save data now set to active (storm active)");
			
		} else if (!isWitherStormAlreadyActive) {
			
			server.overworldData.updateData({isWitherStormActive: true});
			println("Wither Storm CraftTweaker save data now updated to true (storm active)");
			
		} else {
			
			println("Wither storm CraftTweaker save data not updated or set");
			
		}
		
	}
	
});

/* events.register<crafttweaker.forge.api.event.entity.living.LivingDeathEvent>(event => {
    
	// Setting a few variables to make things easier to read.
	
	val level = event.level;
	val entity = event.entity;
	
	if (!level.isClientSide && entity.type == <entitytype:witherstormmod:wither_storm>) { 
		
		val isWitherStormDataSet
		val isAnotherWitherStormActive
	}
	
}); */

