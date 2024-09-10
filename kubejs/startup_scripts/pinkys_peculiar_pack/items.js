StartupEvents.registry('item', (event) => {
	
	/*	 QOL - Wood Scraps are obtained by breaking down wood items
		and then making them into planks
		acting as a 'recycling' mechanic */
	
	let scrapNames = [
		'oak_scraps',
		'spruce_scraps',
		'birch_scraps',
		'jungle_scraps',
		'dark_oak_scraps',
		'acacia_scraps',
		'mangrove_scraps',
		'cherry_scraps',
		'crimson_scraps',
		'roseroot_scraps',
		'yagroot_scraps',
		'cruderoot_scraps',
		'conberry_scraps',
		'sunroot_scraps',
		'coconut_scraps',
		'walnut_scraps',
		'azalea_scraps',
		'flowering_azalea_scraps',
		'strawberry_scraps'
	];
	
	scrapNames.forEach((itemName) => {
		
		event.create(itemName, 'basic')
			.maxStackSize(64)
			
	});
	
	event.create('moon_shard')
		.displayName('Moon Shard')
		.maxStackSize(64)
		
})