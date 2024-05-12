/* Imports */

import crafttweaker.api.game.Server;

import crafttweaker.api.world.Level;
import crafttweaker.api.world.LevelAccessor;
import crafttweaker.api.world.LevelReader;
import crafttweaker.api.world.ServerLevel;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;
import crafttweaker.api.entity.LivingEntity;
import crafttweaker.api.entity.type.player.Player;

import crafttweaker.forge.api.event.Event;
import crafttweaker.forge.api.event.entity.EntityEvent;
import crafttweaker.forge.api.event.entity.living.LivingEvent;
import crafttweaker.forge.api.event.entity.player.PlayerEvent;
import crafttweaker.forge.api.event.entity.EntityJoinLevelEvent;
import crafttweaker.forge.api.interact.PlayerInteractEvent;
import crafttweaker.forge.api.event.interact.EntityInteractEvent;

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
		
		if (entity.type == <entitytype:babyfat:ranchu>) {
			
			val ranchuVarient = level.random.nextInt(RANCHU_VARIENT_MIN, RANCHU_VARIENT_MAX);
			entity.updateData({Variant: ranchuVarient});
			
		}
	
    }
	
});