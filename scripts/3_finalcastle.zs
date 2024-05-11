#modloaded twilightforest weeping_angels

/* Imports */

import mods.angrymobs.AITweaks;

import crafttweaker.api.world.Level;
import crafttweaker.api.world.LevelAccessor;
import crafttweaker.api.world.LevelReader;
import crafttweaker.api.world.biome.Biome;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;
import crafttweaker.api.entity.LivingEntity;
import crafttweaker.api.entity.type.player.Player;

import crafttweaker.forge.api.event.Event;
import crafttweaker.forge.api.event.tick.TickEvent;
import crafttweaker.forge.api.event.tick.PlayerTickEvent;

import crafttweaker.forge.api.event.entity.EntityEvent;
import crafttweaker.forge.api.event.entity.living.LivingEvent;
import crafttweaker.api.resource.ResourceLocation;

import crafttweaker.api.util.math.BlockPos;
import crafttweaker.api.util.math.Vec3;

/* Variables */

val ENTITY_CHECK_RADIUS = 10;
val ANGEL_TYPES as string[] = [
	"weeping_angels:weeping_angel"
];
val ANGEL_BIOMES as string[] = [
	"twilightforest:final_plateau",
	"twilightforest:thornlands"
];

/* Events */

events.register<crafttweaker.forge.api.event.tick.PlayerTickEvent>(event => {
	
	val player = event.player;
	val level = player.level;
	
	if level.isClientSide {
        // Since it is the client, we are just going to do nothing and return.
        return;
    }
	
	val entitiesToCheck = level.getEntitiesOfClass<Entity>((player.x - ENTITY_CHECK_RADIUS), (player.y - ENTITY_CHECK_RADIUS), (player.z - ENTITY_CHECK_RADIUS), (player.x + ENTITY_CHECK_RADIUS), (player.y + ENTITY_CHECK_RADIUS), (player.z + ENTITY_CHECK_RADIUS)) as stdlib.List<Entity>; // Generate a list of entites surrounding the player in a box with a radius of ENTITY_CHECK_RADIUS, centered on the player
		
	for entity in entitiesToCheck { 
			
		val entityBiome = level.getBiome(new BlockPos(entity.x as int, entity.y as int, entity.z as int)).registryName.toString();
		val entityTypeName = entity.type.registryName.toString();
		
		var isOutOfBounds as bool = true;
		var isTargetedType as bool = false;
		
		for biomeToCheckFor in ANGEL_BIOMES {
			
			if (biomeToCheckFor == entityBiome) {
				
				isOutOfBounds = false;
				
			}
			
		}
		
		for typeToCheckFor in ANGEL_TYPES {
			
			if (typeToCheckFor == entityTypeName) {
				
				isTargetedType = true;
			}
			
		}
		
		if (isTargetedType && isOutOfBounds) {
				
			entity.kill();
			return;
			
		}

	}
	
	return;
	
});