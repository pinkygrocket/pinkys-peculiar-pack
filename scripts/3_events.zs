/* Imports */

import crafttweaker.api.game.Server;

import crafttweaker.api.world.Level;
import crafttweaker.api.world.LevelAccessor;
import crafttweaker.api.world.LevelReader;
import crafttweaker.api.world.ServerLevel;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;
import crafttweaker.api.entity.LivingEntity;

import crafttweaker.forge.api.event.Event;
import crafttweaker.forge.api.event.entity.EntityEvent;
import crafttweaker.forge.api.event.entity.living.LivingEvent;
import crafttweaker.forge.api.event.entity.player.PlayerEvent;
import crafttweaker.forge.api.event.entity.EntityJoinLevelEvent;

import crafttweaker.api.resource.ResourceLocation;

import crafttweaker.api.util.math.RandomSource;

val RANCHU_VARIENT_MIN = 1;
val RANCHU_VARIENT_MAX = 303;

events.register<crafttweaker.forge.api.event.entity.EntityJoinLevelEvent>(event => {

    val level = event.level;
	val entity = event.entity;
	
	if !level.isClientSide {
	
		val server = (event.level as ServerLevel).server;
		
		// Scale down Mystic Biome's butterflies using Pehkui

		if (entity.type == <entitytype:mysticsbiomes:butterfly>) {
		
			server.executeCommand("scale set pehkui:width 0.4 @e[type=mysticsbiomes:butterfly]");
			server.executeCommand("scale set pehkui:height 0.4 @e[type=mysticsbiomes:butterfly]");
			return;
		
		}
		
		// Generate random Ranchu variations on spawn
		
		if (entity.type == <entitytype:babyfat:ranchu>) {
			
			val ranchuVarient = level.random.nextInt(RANCHU_VARIENT_MIN, RANCHU_VARIENT_MAX);
			entity.updateData({Variant: ranchuVarient});
			
		}
		
		// Ensue Weeping Angels stick to one variety
		
		if (entity.type = <entitytype:weepingangels:weeping_angel>) {
			
			entity.updateData({angelVariant: "doctor"});
		}
		
    }
	
});