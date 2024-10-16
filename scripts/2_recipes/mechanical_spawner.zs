/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.entity.Entity;
import crafttweaker.api.entity.EntityType;

import crafttweaker.api.fluid.IFluidStack;
import crafttweaker.api.data.IData;

import crafttweaker.util.NameUtil;
import crafttweaker.api.resource.ResourceLocation;

/* Objects */

public class mechanicalSpawnerRecipeExtended {
	
	public var name as string : get, set;
	
	public var fluid as IFluidStack : get, set;
	public var fluidAmount as int : get, set;
	
	public var mob as EntityType<Entity> : get, set;
	
	public var duration as int : get, set;
	
	public this(setMob as EntityType<Entity>, setFluid as IFluidStack, setFluidAmount as int, setDuration as int) {
		
		this.mob = setMob;
		this.fluid = setFluid;
		this.fluidAmount = setFluidAmount;
		this.duration = setDuration;
		
	}
	
	public registerRecipe() as void {
		
		this.name = NameUtil.fixing("ct_mechanical_spawner_" + this.mob.registryName);
		
		// We need to use this method specifically as Create Mechanical Spawner does not register it's system with IRecipeManager
		
		recipes.addJsonRecipe(this.name, {
			"type": "create_mechanical_spawner:spawner",
			"fluid": {
				"fluid": this.fluid.registryName as IData,
				"amount": this.fluidAmount
			},
			"mob": this.mob.registryName as IData,
			"processingTime": this.duration
		});
		
	}
	
}

/* Variables */

val MECHANICAL_SPAWNER_RECIPES as mechanicalSpawnerRecipeExtended[] = [
	new mechanicalSpawnerRecipeExtended(<entitytype:witherstormmod:wither_storm>, <fluid:ppp_packtweaks:unstable_compound>, 1000, 2500)
];

/* Main script */

for recipe in MECHANICAL_SPAWNER_RECIPES {
	recipe.registerRecipe();
}