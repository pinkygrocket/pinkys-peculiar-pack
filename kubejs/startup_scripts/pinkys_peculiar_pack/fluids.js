StartupEvents.registry('fluid', event => {
	event.create('ppp_packtweaks:fiery_blood')
       .thickTexture(0x5a0b0b)
       .bucketColor(0x5a0b0b)
       .displayName('Fiery Blood')
	event.create('ppp_packtweaks:unstable_compound')
	   .thickTexture(0x292929)
       .bucketColor(0x292929)
	   .displayName('Unstable Compound')
	event.create('ppp_packtweaks:clear_lava')
		.displayName('Clear Lava')
		.thinTexture(0xFF0000)
		.noBucket()
		.noBlock()
})