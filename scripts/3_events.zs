/* Imports */

import crafttweaker.api.game.Server;

import crafttweaker.api.world.Level;
import crafttweaker.api.world.LevelAccessor;
import crafttweaker.api.world.LevelReader;
import crafttweaker.api.world.ServerLevel;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;

import crafttweaker.forge.api.event.Event;
import crafttweaker.forge.api.event.entity.EntityEvent;
import crafttweaker.forge.api.event.entity.EntityJoinLevelEvent;

import crafttweaker.api.resource.ResourceLocation;

val BUTTERFLY_NAME as string = "mysticsbiomes:butterfly";

// Scale down Mystic Biome's butterflies using Pehkui

events.register<crafttweaker.forge.api.event.entity.EntityJoinLevelEvent>(event => {

    val level = event.level;
	val entity = event.entity;
	
	if level.isClientSide {
        // Since it is the client, we are just going to do nothing and return.
        return;
    }
	
	val server = (event.level as ServerLevel).server;
	val entityTypeName = entity.type.registryName.toString();
	
	if (entityTypeName == BUTTERFLY_NAME) {
		
		server.executeCommand("scale set pehkui:width 0.4 @e[type=mysticsbiomes:butterfly]");
		server.executeCommand("scale set pehkui:height 0.4 @e[type=mysticsbiomes:butterfly]");
		return;
		
	}
	
});