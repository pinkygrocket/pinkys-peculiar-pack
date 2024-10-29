/* Imports */

import crafttweaker.api.entity.Entity;

import crafttweaker.api.world.damage.DamageSource;

import crafttweaker.api.world.Level;
import crafttweaker.api.world.BlockGetter;
import crafttweaker.api.world.BlockAndTintGetter;
import crafttweaker.api.world.LevelReader;
import crafttweaker.api.world.CommonLevelAccessor;
import crafttweaker.api.world.LevelAccessor;

import crafttweaker.api.world.Explosion;
import crafttweaker.api.world.ExplosionBlockInteraction;

import crafttweaker.forge.api.event.Event;
import crafttweaker.forge.api.event.entity.EntityEvent;
import crafttweaker.forge.api.event.entity.ProjectileImpactEvent;
import crafttweaker.forge.api.event.entity.living.LivingEvent;
import crafttweaker.forge.api.event.entity.player.PlayerEvent;
import crafttweaker.forge.api.interact.PlayerInteractEvent;
import crafttweaker.forge.api.event.interact.RightClickBlockEvent;

import crafttweaker.api.events.EventManager;

import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.item.IItemStack;

import crafttweaker.api.util.math.Vec3;
import crafttweaker.api.util.math.Vec3i;
import crafttweaker.api.util.math.BlockPos;
import crafttweaker.api.util.HitResult;
import crafttweaker.api.util.HitResultType;

import crafttweaker.api.block.Block;
import crafttweaker.api.block.BlockState;
import crafttweaker.api.block.BlockIngredient;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.LivingEntity;
import crafttweaker.api.entity.type.projectile.Projectile;
import crafttweaker.api.entity.type.player.Player;

import crafttweaker.api.tag.MCTag;

import crafttweaker.api.text.MutableComponent;

/* Variables */

val IGNITION_INGREDIENT = <tag:items:quad:fire_lighter>.asIIngredient();
val GUNPOWDER_CRATE_BLOCK = <block:packedup:gunpowder_crate> as Block;
val EXPLOSION_SIZE = 4.0;
val EXPLOSION_CREATES_FIRE = true; // currently not in use right now since it throws an error

/* Main script */

// Make Gunpowder Crates explode when being interacted with by a valid "fire lighter" item"

events.register<crafttweaker.forge.api.event.interact.RightClickBlockEvent>(event => {
	
	// Set some variables to make things easier to read
	
	val level = event.entity.level;
	val playerItem = event.itemStack;
	val block = level.getBlockState(event.blockPos) as Block;
		
	if (block == GUNPOWDER_CRATE_BLOCK && IGNITION_INGREDIENT.contains(playerItem)) {
		
		detonateSafeExplosion(level, event.blockPos, Explosion.create(level, event.blockPos.x, event.blockPos.y, event.blockPos.z, EXPLOSION_SIZE, true, <constant:minecraft:explosion/blockinteraction:destroy_with_decay>, event.entity));
		
		if (playerItem.damageableItem) {
		
		}
		
	}
   
});

// Make Gunpowder Crates explode when exposed to other explosions

events.register<crafttweaker.forge.api.event.DetonateExplosionEvent>(event => {
	
	// Set some variables to make things easier to read
	
	val level = event.level;
	
	for blockPosition in event.affectedBlocks {
		
		var block = level.getBlockState(blockPosition) as Block;
		
		if (block == GUNPOWDER_CRATE_BLOCK) {
			
			detonateSafeExplosion(level, blockPosition, Explosion.create(level, blockPosition.x, blockPosition.y, blockPosition.z, EXPLOSION_SIZE, true, <constant:minecraft:explosion/blockinteraction:destroy_with_decay>));
			
		}
		
	}
	
});

// Make Gunpowder Crates explode when hit by projectiles 

events.register<crafttweaker.forge.api.event.entity.ProjectileImpactEvent>(event => {
    
	val level = event.projectile.level;
	val resultType = event.hitResult.type;
	val impactPosition = new BlockPos(event.hitResult.location.x as int, event.hitResult.location.y as int, event.hitResult.location.z as int) as BlockPos;
	val block = level.getBlockState(impactPosition) as Block;
	
	println("[SCRIPT DEBUG] Hit result location is " + impactPosition.x + ", " + impactPosition.y + ", " + impactPosition.z + ", which is " + block.commandString);
	
	if (block == GUNPOWDER_CRATE_BLOCK && resultType == <constant:minecraft:hitresult/type:block>) {
		
		detonateSafeExplosion(level, impactPosition, Explosion.create(level, impactPosition.x, impactPosition.y, impactPosition.z, EXPLOSION_SIZE, true, <constant:minecraft:explosion/blockinteraction:destroy_with_decay>));
		event.projectile.kill();
		
	}
	
});

events.register<crafttweaker.forge.api.event.block.NeighborBlockNotifyEvent>(event => {
    println("NeighborBlockNotifyEvent ran!");
});

/* Functions */

// "Safe" in this context means that it won't crash the game

public function detonateSafeExplosion(dimension as Level, position as BlockPos, explosion as Explosion) as void {
	
	dimension.setBlockAndUpdate(position, <blockstate:minecraft:air>); // Prevents crashes if called in a for loop
	
	explosion.clearToBlow();
	explosion.explode();
	explosion.finalizeExplosion(true);

}
