/* Imports */

import crafttweaker.api.game.Server;

import crafttweaker.api.world.Level;
import crafttweaker.api.world.LevelAccessor;
import crafttweaker.api.world.LevelReader;
import crafttweaker.api.world.ServerLevel;
import crafttweaker.api.world.biome.Biome;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;
import crafttweaker.api.entity.LivingEntity;
import crafttweaker.api.entity.MobCategory;

import crafttweaker.forge.api.event.Event;
import crafttweaker.forge.api.event.entity.EntityEvent;
import crafttweaker.forge.api.event.entity.living.LivingEvent;
import crafttweaker.forge.api.event.entity.player.PlayerEvent;
import crafttweaker.forge.api.event.entity.EntityJoinLevelEvent;

import crafttweaker.api.resource.ResourceLocation;

import crafttweaker.api.util.math.RandomSource;

import crafttweaker.api.block.Block;

/* Variables */

// Mob types that living mobs can belong to - used to avoid mob functions acting on things like arrows, lightning, etc.

val MOB_TYPES as MobCategory[] = [
	<constant:minecraft:mobcategory:monster>,
	<constant:minecraft:mobcategory:creature>,
	<constant:minecraft:mobcategory:ambient>,
	<constant:minecraft:mobcategory:axolotls>,
	<constant:minecraft:mobcategory:underground_water_creature>,
	<constant:minecraft:mobcategory:water_creature>,
	<constant:minecraft:mobcategory:water_ambient>
];

// The varient of Ranchus is determined by a interger, so min and max are set here

val RANCHU_VARIENT_MIN = 1;
val RANCHU_VARIENT_MAX = 303;

// Mob sizes are randomized a tad to make the world feel more alive - this is the max and min of this randomization
// CT doesn't like random floats or doubles, so we do intergers and convert later

val SIZE_RANDOMIZIER_MAX as int = 110;
val SIZE_RANDOMIZER_MIN as int = 90;

// Values for rescaling bug/insect entities - set as a multiplier of their original size

val ENTITIES_WITH_BASE_SCALE as float[EntityType<Entity>] = {
	<entitytype:crittersandcompanions:leaf_insect> : 0.6,
	<entitytype:crittersandcompanions:jumping_spider> : 0.35,
	<entitytype:autumnity:snail> : 0.35,
	<entitytype:mysticsbiomes:butterfly> : 0.4,
	<entitytype:crittersandcompanions:dragonfly> : 0.4
};

// Entities that shouldn't have their scale changed

val ENTITIES_SCALE_CHANGES_BLACKLIST as EntityType<Entity>[] = [
	<entitytype:witherstormmod:tentacle>,
	<entitytype:witherstormmod:wither_storm>,
	<entitytype:endertrigon:baby_ender_dragon>,
	<entitytype:eyesinthedarkness:eyes>,
	<entitytype:distantfriends:friend>,
	<entitytype:gravestone:player_ghost>,
	<entitytype:lost_aether_content:aerwhale_king>,
	<entitytype:twilightforest:naga>,
	<entitytype:twilightforest:hydra>,
	<entitytype:twilightforest:alpha_yeti>,
	<entitytype:twilightforest:armored_giant>,
	<entitytype:twilightforest:king_spider>,
	<entitytype:twilightforest:knight_phantom>,
	<entitytype:twilightforest:lich>,
	<entitytype:twilightforest:minoshroom>,
	<entitytype:twilightforest:plateau_boss>,
	<entitytype:twilightforest:quest_ram>,
	<entitytype:twilightforest:snow_queen>,
	<entitytype:twilightforest:ur_ghast>,
	<entitytype:aether:sun_spirit>,
	<entitytype:aether:valkyrie_queen>,
	<entitytype:aether:slider>,
	<entitytype:minecraft:ender_dragon>,
	<entitytype:minecraft:wither>,
	<entitytype:minecraft:warden>,
	<entitytype:minecraft:elder_guardian>
];

events.register<crafttweaker.forge.api.event.entity.EntityJoinLevelEvent>(event => {
	
	// Setting variables...
	
    val level = event.level;
	val entity = event.entity;
	
	// Only execute server side & on living entities
	
	if !level.isClientSide { 
		
		// Define the server after we determine that we are working server side, else CT throws an error
		
		val server = (event.level as ServerLevel).server;
		val isLivingMob = false;
		
		for livingMobType in MOB_TYPES {
			
			if (entity.type.category == livingMobType) {
				
				isLivingMob = true;
				
			}
			
		}
		
		if(isLivingMob) {
			
			// Randomized mob scaling is a cool feature on, but unfort causes horrible lag with the current implementation, so it's been disabled.
			
			/* // Randomize mob scales to make the world feel more alive...
			
			val skipScaleChanges as bool = false;
			
			// Determine if the mob is blacklisted from scale changes
			
			for entityToSkip in ENTITIES_SCALE_CHANGES_BLACKLIST {
				
				if (entity.type == entityToSkip) {
					
					skipScaleChanges = true;
					
				}
				
			}
			
			if (!skipScaleChanges) {
				
				val finalScaleValue as float = 1.0;
				
				// Scale down various bug/insect entities by a set amount
				
				for scalingEntity, scaleValue in ENTITIES_WITH_BASE_SCALE {
					
					if (entity.type == scalingEntity) {
						
						finalScaleValue = scaleValue;
						
					}
					
				}
				
				val randomMultiplier = level.random.nextInt(SIZE_RANDOMIZER_MIN, SIZE_RANDOMIZIER_MAX) as float;
				randomMultiplier = randomMultiplier / 100;
				finalScaleValue = finalScaleValue * randomMultiplier;
				
				entity.updateData({"pehkui:scale_data_types": { "pehkui:width": { initial: finalScaleValue, scale: finalScaleValue, target: finalScaleValue }, "pehkui:height": { initial: finalScaleValue, scale: finalScaleValue, target: finalScaleValue } } });
			
			} */
			
			// Generate random Ranchu variations
				
			if (entity.type == <entitytype:babyfat:ranchu>) {
					
				val ranchuVarient = level.random.nextInt(RANCHU_VARIENT_MIN, RANCHU_VARIENT_MAX);
				entity.updateData({Variant: ranchuVarient});
					
			}
			
		}
		
	}
	
});