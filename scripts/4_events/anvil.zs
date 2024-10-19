/****************************************************************************
*** Script for managing anvil recipes
*** The anvil doesn't have a normal manager, and instead is event-driven
*** thus why it's called in the events folder
****************************************************************************/

/* Imports */

import crafttweaker.forge.api.event.Event;
import crafttweaker.forge.api.event.entity.EntityEvent;
import crafttweaker.forge.api.event.entity.living.LivingEvent;
import crafttweaker.forge.api.event.entity.player.PlayerEvent;
import crafttweaker.forge.api.event.anvil.AnvilUpdateEvent;
import crafttweaker.forge.api.event.anvil.AnvilRepairEvent;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.data.IData;

/* Objects */

public class anvilRepairableItem {
	
	public var amountToFullRepair as int; // Repair percentage is 1/value, e.g. 4 --> 25%
	public var itemToRepair as IItemStack;
	public var materialCost as IItemStack; // Should probably add IIngredient support at some point
	
	public this(setItemToRepair as IItemStack, setMaterialCost as IItemStack) {
		
		this.itemToRepair = setItemToRepair;
		this.materialCost = setMaterialCost;
		this.amountToFullRepair = 4; // 4/25% is the standard repair amount in vanilla Minecraft
		
	}
	
}

/* Variables */

// Mostly just making items that aren't normally repairable (shields, paragliders, etc.) repairable.

val REPAIRABLE_ITEMS as anvilRepairableItem[] = [
	new anvilRepairableItem(<item:twilightforest:block_and_chain>, <item:twilightforest:knightmetal_ingot>),
	new anvilRepairableItem(<item:twilightforest:knightmetal_shield>, <item:twilightforest:knightmetal_ingot>),
	new anvilRepairableItem(<item:sullysmod:jade_shield>, <item:sullysmod:polished_jade>),
	new anvilRepairableItem(<item:shieldexp:diamond_shield>, <item:minecraft:diamond>),
	//new anvilRepairableItem(<item:shieldexp:wooden_shield>, <item:minecraft:diamond>),
	new anvilRepairableItem(<item:shieldexp:iron_shield>, <item:minecraft:iron_ingot>),
	new anvilRepairableItem(<item:shieldexp:golden_shield>, <item:minecraft:gold_ingot>),
	new anvilRepairableItem(<item:shieldexp:netherite_shield>, <item:minecraft:netherite_ingot>),
	new anvilRepairableItem(<item:deep_aether:skyjade_shield>, <item:deep_aether:skyjade>),
	new anvilRepairableItem(<item:deep_aether:stratus_shield>, <item:deep_aether:stratus_ingot>),
	new anvilRepairableItem(<item:lost_aether_content:zanite_shield>, <item:aether:zanite_gemstone>),
	new anvilRepairableItem(<item:lost_aether_content:gravitite_shield>, <item:aether:enchanted_gravitite>),
	new anvilRepairableItem(<item:paraglider:paraglider>, <item:minecraft:leather>),
	new anvilRepairableItem(<item:sculkhornid:sculkhorn>, <item:minecraft:echo_shard>),
	new anvilRepairableItem(<item:sculkhornid:sculkhorn_sonicboom>, <item:minecraft:echo_shard>)
];

/* Main script */

events.register<crafttweaker.forge.api.event.anvil.AnvilUpdateEvent>(event => {
	
	for entry in REPAIRABLE_ITEMS {
		
		if (entry.itemToRepair == event.left && event.left.damaged && entry.materialCost == event.right) {
			
			// Repair penalty value set here follows the logic established by Better Anvils' config and not vanilla minecraft
			// I.E. the scaling is linear, not exponential
			// Currently this doens't work and doesn't print anything for some reason - will need to get further help
			
			var repairPenalty as int;
			
			if ("RepairCost" in event.left.tag.asMap()) {
				
				repairPenalty = event.left.tag["RepairCost"].asInt();
				println("Penalty applied: " + event.left.tag["RepairCost"].asInt());
				
			} else {
				
				repairPenalty = 0;
				println("No penalty applied");
				
			}
			
			event.cost = event.right.amount + event.left.baseRepairCost + repairPenalty;
			
			var repairValue as int;
			repairValue = event.left.maxDamage / 4;
			repairValue = repairValue * event.right.amount;
			
			if (repairValue >= event.left.maxDamage) {
			
				event.output = event.left.withDamage(event.left.maxDamage);
				
			} else {
				
				event.output = event.left.withDamage(event.left.damage + repairValue);
				
			}
			
		}
		
	}

});