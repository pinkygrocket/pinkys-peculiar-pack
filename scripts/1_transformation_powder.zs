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
		
		this.name = "crafttweaker_transformation_" + this.input.registryName.path + "_to_" + this.output.registryName.path;
		<recipetype:twilightforest:transformation_powder>.addJsonRecipe(this.name, {
			"type" : "twilightforest:transformation_powder",
			"from" : this.input.registryName,
			"reversible" : this.reversible,
			"to" : this.output.registryName
		});
		
	}
	
}

/* Variables */

val TRANSFORMATION_RECIPES as transformationRecipeExtended[] = [

	// Intergration - Ecologics Penguin is the Overworld penguin, TF Penguin is exclusive to TF
	
	new transformationRecipeExtended(<entitytype:ecologics:penguin>, <entitytype:twilightforest:penguin>, true),
	
	// Intergration - Horses and Moas are rough dimensional equivalants
	
	new transformationRecipeExtended(<entitytype:minecraft:horse>, <entitytype:aether:moa>, true),
	new transformationRecipeExtended(<entitytype:minecraft:cod>, <entitytype:deep_aether:aerglow_fish>, true),
	new transformationRecipeExtended(<entitytype:sculkybits:sculk_crawler>, <entitytype:twilightforest:pinch_beetle>, true),
	new transformationRecipeExtended(<entitytype:minecraft:fox>, <entitytype:friendsandfoes:mauler>, true),
	new transformationRecipeExtended(<entitytype:minecraft:chicken>, <entitytype:farmlife:galliraptor>, true),
	new transformationRecipeExtended(<entitytype:minecraft:goat>, <entitytype:farmlife:domestic_tribull>, true),
	new transformationRecipeExtended(<entitytype:minecraft:mooshroom>, <entitytype:friendsandfoes:moobloom>, true),
	new transformationRecipeExtended(<entitytype:minecraft:dolphin>, <entitytype:aether:aerwhale>, true),
	new transformationRecipeExtended(<entitytype:minecraft:piglin_brute>, <entitytype:twilightforest:minotaur>, true)
];

for recipe in TRANSFORMATION_RECIPES {
	recipe.registerRecipe();
}