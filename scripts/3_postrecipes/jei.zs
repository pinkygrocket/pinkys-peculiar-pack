/* Imports */

import crafttweaker.api.game.Game;

import crafttweaker.api.text.Component;
import crafttweaker.api.text.MutableComponent;
import crafttweaker.api.text.Message;
import crafttweaker.api.text.FormattedText;

import mods.jeitweaker.Jei;
import mods.jeitweaker.ingredient.JeiIngredient;

import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.item.IItemStack;

/* Variables */

val itemsWithHints as MutableComponent[IItemStack] = {
	<item:chimes:bamboo_chimes> : Component.translatable("chimes.jei.hint.bamboo_chimes"),
	<item:chimes:iron_chimes> : Component.translatable("chimes.jei.hint.iron_chimes"),
	<item:chimes:carved_bamboo_chimes> : Component.translatable("chimes.jei.hint.carved_bamboo_chimes"),
	<item:chimes:copper_chimes> : Component.translatable("chimes.jei.hint.copper_chimes"),
	<item:chimes:amethyst_chimes> : Component.translatable("chimes.jei.hint.amethyst_chimes"),
	<item:chimes:glass_bells> : Component.translatable("chimes.jei.hint.glass_bells"),
	<item:aether:ice_pendant> : Component.translatable("aether.jei.hint.ice_pendant"),
	<item:aether:ice_ring> : Component.translatable("aether.jei.hint.ice_ring"),
	<item:aether:golden_ring> : Component.translatable("aether.jei.hint.gold_ring"),
	<item:aether:iron_ring> : Component.translatable("aether.jei.hint.iron_ring"),
	<item:aether:golden_pendant> : Component.translatable("aether.jei.hint.gold_pendant"),
	<item:aether:iron_pendant> : Component.translatable("aether.jei.hint.iron_pendant"),
	<item:aether:regeneration_stone> : Component.translatable("aether.jei.hint.regeneration_stone"),
	<item:aether:iron_bubble> : Component.translatable("aether.jei.hint.iron_bubble"),
	<item:babyfat:ranchu_bucket> : Component.translatable("babyfat.jei.hint.ranchu"),
	<item:babyfat:ranchu_spawn_egg> : Component.translatable("babyfat.jei.hint.ranchu")
};

val hideInJei as IItemStack[] = [

	// ppp_packtweaks - The Incomplete Formidibomb is only used in crafting the Formidibomb
	
	<item:ppp_packtweaks:incomplete_formidibomb>
];

/* Main script */

for hintItem, hintText in itemsWithHints {
	
	Jei.addIngredientInformation(hintItem, hintText);
	
}

for item in hideInJei {

	Jei.hideIngredient(item);

}

/*

	<item:supplementaries:clock_block>
	<item:supplementaries:pulley_block>
	<item:supplementaries:speaker_block>
	<item:supplementaries:goblet>
	<item:supplementaries:hourglass>
	<item:supplementaries:bubble_blower>
	<item:supplementaries:slice_map>
	<item:supplementaries:safe>
	<item:supplementaries:globe>
	<item:supplementaries:globe_sepia>
	<item:supplementaries:cog_block>
	<item:supplementaries:crank>
	<item:supplementaries:wind_vane>
	<item:supplementaries:bomb>
	<item:supplementaries:altimeter>
	<item:supplementaries:slice_map>
	<item:supplementaries:bellows>
	<item:supplementaries:flute>
	<item:supplementaries:bomb_blue>
	<item:supplementaries:soap>
	<item:supplementaries:dispenser_minecart>
	<item:supplementaries:lock_block>
	<item:supplementaries:redstone_illuminator>
	<item:supplementaries:key>
	<item:supplementaries:wrench>
	<item:supplementaries:slingshot>
	<item:supplementaries:crystal_display>
	<item:supplementaries:relayer>
	<item:supplementaries:spring_launcher>
	<item:supplementaries:turn_table>
	<item:supplementaries:rope_arrow>
	<item:supplementaries:statue>
	<item:supplementaries:hat_stand>
	<item:supplementaries:blackboard>
	<item:supplementaries:notice_board>
	<item:paraglider:paraglider>
	<item:paraglider:deku_leaf>
	<item:paraglider:heart_container>
	<item:paraglider:goddess_statue>
	<item:paraglider:kakariko_goddess_statue>
	<item:paraglider:goron_goddess_statue>
	<item:paraglider:rito_goddess_statue>
	<item:paraglider:horned_statue>
	
*/