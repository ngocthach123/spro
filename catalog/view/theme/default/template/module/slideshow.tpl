
<div id="slideshow" class="owl-carousel" style="opacity: 1;">
    <?php foreach ($banners as $banner): ?>
        <div class="item">
            <?php if ($banner['link']): ?>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
            <?php else:?>
                <a><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
            <?php endif; ?>
        </div>
    <?php endforeach;?>
</div>
<script type="text/javascript"><!--
    $('#slideshow').owlCarousel({
        items: 6,
        lazyLoad : true,
        autoPlay: 3000,
        singleItem: true,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
        pagination: false
    });
    --></script>