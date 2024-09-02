StartupEvents.registry('block', (event) => {
	event.create('rose_quartz_tile_stairs', 'stairs')
		.displayName('Rose Quartz Tile Stairs')
		.stoneSoundType()
		.tagBlock("mineable/pickaxe")
		.tagBlock("artifacts:mineable/digging_claws")
		.textureAll('create:block/palettes/rose_quartz_tiles');
	event.create('rose_quartz_tile_slab', 'slab')
		.displayName('Rose Quartz Tile Slab')
		.stoneSoundType()
		.tagBlock('mineable/pickaxe')
		.tagBlock("artifacts:mineable/digging_claws")
		.textureAll('create:block/palettes/rose_quartz_tiles');
})