
<div id="manu" class="owl-carouse">
		<?php if ($brands) { ?>
			
			
			
			<?php foreach ($brands as $brand) { ?>
				
					<?php if ($brand['manufacturer']) { ?>
						
							<?php foreach ($brand['manufacturer'] as $manufacturer) { ?>
								<div class="item text-center">
								
									<a><img src="<?php echo $manufacturer['image']; ?>" class="img-responsive"></a>
									<!--<?php echo $manufacturer['name']; ?>-->
								</div>
							<?php } ?>
						
					<?php } ?>
			<?php } ?>
		<?php } ?>
</div>
<script type="text/javascript"><!--
$('#manu').owlCarousel({
	items: 6,
	autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false
});
--></script>