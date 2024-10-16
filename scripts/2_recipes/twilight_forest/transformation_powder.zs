/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;
import crafttweaker.api.data.IData;

/* Objects */

public class transformationRecipeExtended {
	
	public var name as string : get, set;
	
	public var input as EntityType<Entity> : get, set;
	public var output as EntityType<Entity> : get, set;
	public var reversible as bool : get, set;
	
	public this(setOutput as EntityType<Entity>, setInput as EntityType<Entity>, setReversible as bool) {
		
		this.input = setInput;
		this.output = setOutput;
		this.reversible = setReversible;
		
	}
	
	public registerRecipe() as void {
		
		this.name = "ct_transformation_" + this.input.registryName.path + "_to_" + this.output.registryName.path;
		<recipetype:twilightforest:transformation_powder>.addJsonRecipe(this.name, {
			"type" : "twilightforest:transformation_powder",
			"from" : this.input.registryName,
			"reversible" : this.reversible,
			"to" : this.output.registryName
		});
		
	}
	
}

/* Variables */

// Order is Overworld/Nether --> Twilight Forest --> Aether for trios

val TRANSFORMATION_RECIPES as transformationRecipeExtended[] = [
	
	// Intergration - Ecologics Penguin is the Overworld penguin, TF Penguin is exclusive to TF
	
	new transformationRecipeExtended(<entitytype:ecologics:penguin>, <entitytype:twilightforest:penguin>, true),
	
	// Intergration - Some rough dimension equvialants
	
	new transformationRecipeExtended(<entitytype:minecraft:horse>, <entitytype:aether:moa>, true),
	new transformationRecipeExtended(<entitytype:minecraft:dolphin>, <entitytype:aether:aerwhale>, true),
	new transformationRecipeExtended(<entitytype:upgrade_aquatic:thrasher>, <entitytype:aether:zephyr>, true),
	new transformationRecipeExtended(<entitytype:ecologics:coconut_crab>, <entitytype:twilightforest:helmet_crab>, true),
	
	// Intergration - Mauler is exclusive to Twilight Forest now
	
	new transformationRecipeExtended(<entitytype:minecraft:fox>, <entitytype:friendsandfoes:mauler>, true),
	
	// Intergration - Farmlife's animals are now exclusive to the Aether
	
	new transformationRecipeExtended(<entitytype:minecraft:chicken>, <entitytype:farmlife:galliraptor>, true),
	new transformationRecipeExtended(<entitytype:minecraft:goat>, <entitytype:farmlife:domestic_tribull>, true),
	
	// Intergration - Mooblooms are exclusive to the Twilight Forest now
	
	new transformationRecipeExtended(<entitytype:minecraft:mooshroom>, <entitytype:friendsandfoes:moobloom>, true),
	
	// Gamefeel - Minotaurs and Piglin Brutes are more closely related, not Zombie Piglings
	
	new transformationRecipeExtended(<entitytype:minecraft:piglin_brute>, <entitytype:twilightforest:minotaur>, true),
	
	// Intergration - The Flying Cow is more closely related than the Deer so the Deer <--> Cow transformation is replaced
	
	new transformationRecipeExtended(<entitytype:minecraft:cow>, <entitytype:aether:flying_cow>, true),
	
	// Mob cycles
	
	new transformationRecipeExtended(<entitytype:minecraft:rabbit>, <entitytype:twilightforest:dwarf_rabbit>, false),
	new transformationRecipeExtended(<entitytype:twilightforest:dwarf_rabbit>, <entitytype:aether:aerbunny>, false),
	new transformationRecipeExtended(<entitytype:aether:aerbunny>, <entitytype:minecraft:rabbit>, false),
	
	new transformationRecipeExtended(<entitytype:minecraft:cod>, <entitytype:deep_aether:aerglow_fish>, false),
	new transformationRecipeExtended(<entitytype:deep_aether:aerglow_fish>, <entitytype:babyfat:ranchu>, false),
	new transformationRecipeExtended(<entitytype:babyfat:ranchu>, <entitytype:minecraft:cod>, false),
	
	new transformationRecipeExtended(<entitytype:sculkybits:sculk_crawler>, <entitytype:twilightforest:pinch_beetle>, false),
	new transformationRecipeExtended(<entitytype:twilightforest:pinch_beetle>, <entitytype:deep_aether:venomite>, false),
	new transformationRecipeExtended(<entitytype:deep_aether:venomite>, <entitytype:sculkybits:sculk_crawler>, false),
	
	new transformationRecipeExtended(<entitytype:minecraft:pig>, <entitytype:twilightforest:boar>, false),
	new transformationRecipeExtended(<entitytype:twilightforest:boar>, <entitytype:aether:phyg>, false),
	new transformationRecipeExtended(<entitytype:aether:phyg>, <entitytype:minecraft:pig>, false)
	
];

for recipe in TRANSFORMATION_RECIPES {
	recipe.registerRecipe();
}