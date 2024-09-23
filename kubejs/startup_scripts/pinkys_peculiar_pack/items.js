StartupEvents.registry('item', (event) => {
	
	/*	 QOL - Wood Scraps are obtained by breaking down wood items
		and then making them into planks
		acting as a 'recycling' mechanic */
	
	let scrapNames = [
		'oak',
		'spruce',
		'birch',
		'jungle',
		'dark_oak',
		'acacia',
		'mangrove',
		'cherry',
		'crimson',
		'roseroot',
		'yagroot',
		'cruderoot',
		'conberry',
		'sunroot',
		'coconut',
		'walnut',
		'azalea',
		'flowering_azalea',
		'strawberry',
		'bamboo',
		'warped',
		'tainted',
		'peach',
		'sea_foam',
		'ashen',
		'skyroot',
		'mossy_oak',
		'twilight_oak',
		'canopy',
		'tf_mangrove',
		'darkwood',
		'timewood',
		'transwood',
		'minewood',
		'towerwood',
		'maple',
		'stone_pine',
		'river',
		'driftwood',
		'thorn'
	];
	
	scrapNames.forEach((itemName) => {
		
		event.create(`ppp_packtweaks:${itemName}_scraps`, 'basic')
			.maxStackSize(64)
			
	});
	
	event.create('ppp_packtweaks:moon_shard')
		.displayName('Moon Shard')
		.maxStackSize(64)
		
})