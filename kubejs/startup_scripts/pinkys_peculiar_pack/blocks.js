StartupEvents.registry('block', (event) => {
	
	// Add Rose Quartz Tile Stairs and Slabs for a build
	
	event.create('ppp_packtweaks:rose_quartz_tile_stairs', 'stairs')
		.displayName('Rose Quartz Tile Stairs')
		.stoneSoundType()
		.tagBlock('mineable/pickaxe')
		.tagBlock("artifacts:mineable/digging_claws")
		.textureAll('create:block/palettes/rose_quartz_tiles')
	event.create('ppp_packtweaks:rose_quartz_tile_slab', 'slab')
		.displayName('Rose Quartz Tile Slab')
		.stoneSoundType()
		.tagBlock('mineable/pickaxe')
		.tagBlock('artifacts:mineable/digging_claws')
		.textureAll('create:block/palettes/rose_quartz_tiles')
		
	// Add crosscompatablity between Farmer's Delight crates and fruit from some other mods
	
	let crateNames = [
		'strawberry',
		'sweet_strawberry',
		'enchanted_berry',
		'enchanted_fruit'
	];
	
	let storageBlockNames = [
		'moonstone',
		'echo_crystal'
	];
	
	crateNames.forEach((crateName) => {
		
		event.create(`ppp_packtweaks:${crateName}_crate`, 'basic')
			.woodSoundType()
			.texture('up', `kubejs:block/${crateName}_crate_up`)
			.texture('north', `kubejs:block/${crateName}_crate_side`)
			.texture('west', `kubejs:block/${crateName}_crate_side`)
			.texture('east', `kubejs:block/${crateName}_crate_side`)
			.texture('south', `kubejs:block/${crateName}_crate_side`)
			.texture('down', 'farmersdelight:block/crate_bottom')
			.tagBlock('artifacts:mineable/digging_claws')
			.tagBlock('forge:storage_blocks')
			.tagBlock('minecraft:mineable/axe')
			.fullBlock(true)
	});
	
	storageBlockNames.forEach((blockName) => {
		
		event.create(`ppp_packtweaks:${blockName}_block`, 'basic')
			.fullBlock(true)
			
	});
	
	event.create('ppp_packtweaks:goldenleaf_berry_sack', 'basic')
		.soundType('wool')
		
	event.create('ppp_packtweaks:moon_shard_ore', 'basic')
		.soundType('stone')
		.tagBlock('forge:ores')
		.tagBlock('minecraft:mineable/pickaxe')
		.tagBlock('artifacts:mineable/digging_claws')
		.tagBlock('forge:ores_in_ground/stone')
		.tagBlock('incontrol:cave_block')
		.tagBlock('endermanoverhaul:cave_enderman_holdable')
		.tagBlock('witherstormmod:wither_storm_small_cluster_blacklist')
		.tagBlock('minecraft:needs_iron_tool')
		.tagItem('forge:ores')
		.tagItem('balm:ores')
		.tagItem('forge:ores_in_ground/stone')
		.fullBlock(true)
		.requiresTool(true)
		
	event.create('ppp_packtweaks:ziggurat_gate', 'basic')
		.soundType('stone')
		.unbreakable()
		
})