/* Imports */

import crafttweaker.api.item.IItemStack;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;

import crafttweaker.api.loot.modifier.LootModifierManager;
import crafttweaker.api.loot.modifier.ILootModifier;
import crafttweaker.api.loot.modifier.CommonLootModifiers;

import crafttweaker.api.loot.condition.AllOfCondition;
import crafttweaker.api.loot.condition.LootConditions;
import crafttweaker.api.loot.condition.LootTableIdLootCondition;

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
	<entitytype:aether:sun_spirit>,
	<entitytype:aether:valkyrie_queen>,
	<entitytype:aether:slider>
];

val MINIBOSS_ENTITIES as EntityType<Entity>[] = [
	 <entitytype:twilightforest:knight_phantom>,
	 <entitytype:twilightforest:armored_giant>
];

val CHEST_ENTRIES_SPIRIT_ORBS = [
	<resource:twilightforest:chests/aurora_cache>,
	<resource:twilightforest:chests/aurora_room>,
	<resource:twilightforest:chests/troll_vault>,
	<resource:twilightforest:chests/troll_vault_with_lamp>,
	<resource:twilightforest:chests/tower_room>,
	<resource:twilightforest:chests/tower_library>,
	<resource:twilightforest:chests/stronghold_room>,
	<resource:twilightforest:chests/stronghold_cache>,
	<resource:twilightforest:chests/labyrinth_dead_end>,
	<resource:twilightforest:chests/labyrinth_room>,
	<resource:twilightforest:chests/labyrinth_vault>,
	<resource:twilightforest:chests/labyrinth_vault_jackpot>,
	<resource:twilightforest:chests/hedge_maze>,
	<resource:twilightforest:chests/hill_2>,
	<resource:twilightforest:chests/hill_3>,
	<resource:twilightforest:chests/darktower_cache>,
	<resource:minecraft:chests/shipwreck_treasure>,
	<resource:minecraft:chests/stronghold_corridor>,
	<resource:minecraft:chests/stronghold_crossing>,
	<resource:minecraft:chests/stronghold_library>,
	<resource:minecraft:chests/underwater_ruin_big>,
	<resource:minecraft:chests/underwater_ruin_small>,
	<resource:minecraft:chests/woodland_mansion>,
	<resource:minecraft:chests/buried_treasure>,
	<resource:minecraft:chests/jungle_temple>,
	<resource:minecraft:chests/shipwreck_treasure>,
	<resource:minecraft:chests/desert_pyramid>,
	<resource:minecraft:chests/bastion_treasure>,
	<resource:betterdeserttemples:chests/pharaoh_hidden>,
	<resource:betterdeserttemples:chests/tomb_pharaoh>,
	<resource:betterdeserttemples:chests/pharaoh_hidden>,
	<resource:betterjungletemples:chests/treasure>,
	<resource:betterstrongholds:chests/treasure>,
	<resource:aether:chests/dungeon/bronze/bronze_dungeon_trash>,
	<resource:aether:chests/dungeon/silver/silver_dungeon_treasure>,
	<resource:betterfortresses:chests/worship>,
	<resource:repurposed_structures:chests/bastions/underground/treasure>
];

/* Main script */

// Make bosses drop Heart Containers

for bossEntity in BOSS_ENTITIES {

	bossEntity.addLootModifier("inject/tf/entities/" + bossEntity.registryName.path + "/heart_container", CommonLootModifiers.add(<item:paraglider:heart_container>));
	
}

// Make minibosses drop Spirit Orbs

for minibossEntity in MINIBOSS_ENTITIES {
	
	minibossEntity.addLootModifier("inject/tf/entities/" + minibossEntity.registryName.path + "/spirit_orb", CommonLootModifiers.add(<item:paraglider:spirit_orb> * 2));
	
}

// Make the Questing Ram drop a Heart Container upon quest completion

loot.modifiers.register("inject/tf/entities/questing_ram/spirit_orb", LootConditions.allOf(LootTableIdLootCondition.create(<resource:twilightforest:entities/questing_ram_rewards>)), CommonLootModifiers.add(<item:paraglider:heart_container>));

//