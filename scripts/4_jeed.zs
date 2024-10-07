/* Imports */

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.IRecipeManager;
import crafttweaker.api.entity.effect.MobEffect;

import crafttweaker.api.data.ListData;
import crafttweaker.api.data.IData;

/* Variables */

val jeedRecipes as IItemStack[][MobEffect] = {
	<mobeffect:minecraft:wither> : [<item:netherdepthsupgrade:wither_bonefish_spawn_egg>, <item:witherstormmod:sickened_bee_spawn_egg>, <item:witherstormmod:sickened_cat_spawn_egg>, <item:witherstormmod:sickened_chicken_spawn_egg>, <item:witherstormmod:sickened_cow_spawn_egg>, <item:witherstormmod:sickened_iron_golem_spawn_egg>, <item:witherstormmod:sickened_mushroom_cow_spawn_egg>, <item:witherstormmod:sickened_parrot_spawn_egg>, <item:witherstormmod:sickened_phantom_spawn_egg>, <item:witherstormmod:sickened_pillager_spawn_egg>, <item:witherstormmod:sickened_zombie_spawn_egg>, <item:witherstormmod:sickened_skeleton_spawn_egg>, <item:witherstormmod:sickened_snow_golem_spawn_egg>, <item:witherstormmod:sickened_spider_spawn_egg>, <item:witherstormmod:sickened_villager_spawn_egg>, <item:witherstormmod:sickened_vindicator_spawn_egg>, <item:witherstormmod:sickened_wolf_spawn_egg>],
	<mobeffect:monobank:thief> : [<item:monobank:monobank>],
	<mobeffect:deep_aether:valkyrie_valor> : [<item:deep_aether:medal_of_honor>],
	<mobeffect:xtraarrows:magnetized> : [<item:xtraarrows:flint_magnetic_arrow>],
	<mobeffect:potionofbees:evanescence> : [<item:potionofbees:potion_of_bees>, <item:potionofbees:splash_potion_of_bees>, <item:potionofbees:lingering_potion_of_bees>]
};

val potionProviders as IItemStack[] = [
	<item:potionbundles:potion_bundle>,
	<item:potionbundles:splash_potion_bundle>,
	<item:potionbundles:lingering_potion_bundle>
];

/* Main script */

for effect, providers in jeedRecipes {
	
	var name = "crafttweaker_jeed_effect_provider_" + effect.registryName;
	var effectProvidersJson = new ListData();
	
	for item in providers {
		
		effectProvidersJson.add(item as IData);
		
	}
	
	<recipetype:jeed:effect_provider>.addJsonRecipe(name, {
		"type" : "jeed:effect_provider",
		"effect" : effect.registryName,
		"providers" : effectProvidersJson
	});
	
}

val potionProvidersJson = new ListData();

for item in potionProviders {
	
	potionProvidersJson.add(item);
	
}

<recipetype:jeed:potion_provider>.addJsonRecipe("crafttweaker_jeed_potion_provider", {
	"type" : "jeed:potion_provider",
	"providers" : potionProvidersJson
});