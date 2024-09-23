/* Imports */

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;

import mods.farmersdelight.CookingPot;

/* Objects */

public class cookingRecipeExtended {
	
	public var name as string : get, set;
	
	public var input as IIngredient[] : get, set;
	public var output as IItemStack : get, set;
	
	public var hasContainer as bool : get, set;
	public var container as IItemStack : get, set;
	
	public var experience as float : get, set;
	public var cookTime as float : get, set;
	
}

/* Variables */

// Intergration - The Golden Apple Stew now requires materials from Ribbits, Twilight Flavors and Delight, and Friends and Foes that can be found in the Twilight Forest

// [<item:minecraft:golden_apple>, <item:ribbits:toadstool>, <item:twilightdelight:cooked_insect>]
/* Main script */

