/* Imports */

import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.recipe.type.CraftingRecipe;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

import crafttweaker.util.NameUtil;
import mods.farmersdelight.CookingPot;

/* Objects */

public class cookingRecipeExtended {
	
	public var name as string : get, set;
	
	public var input as IIngredient[] : get, set;
	public var output as IItemStack : get, set;
	
	public var hasContainer as bool : get, set;
	public var container as IItemStack : get, set;
	
	public var experience as float : get, set;
	public var cookTime as int : get, set;
	public var replace as bool : get, set;
	
	public this(setOutput as IItemStack, setInput as IIngredient[], setReplace as bool) {
		
		this.output = setOutput;
		this.input = setInput;
		this.hasContainer = false;
		this.experience = 0.35;
		this.cookTime = 200;
		this.replace = setReplace;
	}
	
	public this(setOutput as IItemStack, setInput as IIngredient[], setContainer as IItemStack, setReplace as bool) {
		
		this.output = setOutput;
		this.input = setInput;
		this.hasContainer = true;
		this.container = setContainer;
		this.experience = 0.35;
		this.cookTime = 200;
		this.replace = setReplace;
		
	}
	
	public this(setOutput as IItemStack, setInput as IIngredient[], setContainer as IItemStack, setCookTime as int, setExperience as float, setReplace as bool) {
		
		this.output = setOutput;
		this.input = setInput;
		this.hasContainer = true;
		this.container = setContainer;
		this.experience = setExperience;
		this.cookTime = setCookTime;
		this.replace = setReplace;
		
	}
	
	public registerRecipe() as void {
		
		this.name = NameUtil.fixing("ct_cooking_pot_" + this.output.registryName);
		
		if (this.replace) {
			
			recipes.remove(this.output);
			
		}
		
		if (this.hasContainer) {
			
			<recipetype:farmersdelight:cooking>.addRecipe(this.name, this.output, this.input, null, this.container, this.experience, this.cookTime);
			
		} else {
			
			<recipetype:farmersdelight:cooking>.addRecipe(this.name, this.output, this.input, null, null, this.experience, this.cookTime);
			
		}
		
	}
	
}

/* Variables */

val COOKING_RECIPES as cookingRecipeExtended[] = [

	// Intergration - The Golden Apple Stew now requires materials from Ribbits, Twilight Flavors and Delight, and Friends and Foes that can be found in the Twilight Forest
	
	new cookingRecipeExtended(<item:witherstormmod:golden_apple_stew>, [<item:minecraft:golden_apple>, <item:ribbits:toadstool>, <item:twilightdelight:cooked_insect>], true)
];

/* Main script */

