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

// Values for rescaling bug/insect entities

val ENTITIES_TO_SCALE as float[EntityType<Entity>] = {
	<entitytype:crittersandcompanions:leaf_insect> : 0.6,
	<entitytype:crittersandcompanions:jumping_spider> : 0.35,
	<entitytype:mysticsbiomes:butterfly> : 0.4,
	<entitytype:crittersandcompanions:dragonfly> : 0.4
};

events.register<crafttweaker.forge.api.event.entity.EntityJoinLevelEvent>(event => {

    val level = event.level;
	val entity = event.entity;
	
	if !level.isClientSide {
	
		val server = (event.level as ServerLevel).server;
		
		// Scale down various bug/insect entities on spawn
		
		for scalingEntity, scaleValue in ENTITIES_TO_SCALE {
			
			if (entity.type == scalingEntity) {
				
				entity.updateData({"pehkui:scale_data_types": { "pehkui:width": { initial: scaleValue, scale: scaleValue, target: scaleValue }, "pehkui:height": { initial: scaleValue, scale: scaleValue, target: scaleValue } } });
				
			}
			
		}
		
		// Generate random Ranchu variations on spawn
		
		if (entity.type == <entitytype:babyfat:ranchu>) {
			
			val ranchuVarient = level.random.nextInt(RANCHU_VARIENT_MIN, RANCHU_VARIENT_MAX);
			entity.updateData({Variant: ranchuVarient});
			
		}
		
		// Ensue Weeping Angels stick to one variety
		
		if (entity.type == <entitytype:weeping_angels:weeping_angel>) {
			
			//entity.updateData({angelVariant: "weeping_angels:doctor"});
			
		}
		
    }
	
});