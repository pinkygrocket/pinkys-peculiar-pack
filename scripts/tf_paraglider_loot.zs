#noload
#modloaded twilightforest paraglider

/* Imports */

import crafttweaker.api.item.IItemStack;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;

import crafttweaker.api.loot.modifier.ILootModifier;
import crafttweaker.api.loot.modifier.CommonLootModifiers;

import crafttweaker.api.resource.ResourceLocation;

/* Variables */

val BOSS_ENTITIES as EntityType<Entity>[] = [
	<entitytype:twilightforest:alpha_yeti>,
	<entitytype:twilightforest:naga>,
	<entitytype:twilightforest:snow_queen>,
	<entitytype:twilightforest:ur_ghast>,
	<entitytype:twilightforest:lich>,
	<entitytype:twilightforest:minoshroom>,
	<entitytype:twilightforest:hydra>,
	<entitytype:cataclysm:ignis>
];

val MINIBOSS_ENTITIES as EntityType<Entity>[] = [
	 <entitytype:twilightforest:knight_phantom>,
	 <entitytype:twilightforest:armored_giant>
];

/* Main script */

for bossEntity in BOSS_ENTITIES {

	bossEntity.addLootModifier(bossEntity.registryName.path + "_drop_heart_container", CommonLootModifiers.add(<item:paraglider:heart_container>));
	
}

for minibossEntity in MINIBOSS_ENTITIES {
	
	minibossEntity.addLootModifier(minibossEntity.registryName.path + "_drop_spirit_orb", CommonLootModifiers.add(<item:paraglider:spirit_orb> * 2));
	
}