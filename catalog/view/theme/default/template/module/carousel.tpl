<div class="wrappartner-home">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 col-xs-12">
                <div id="partner" class="owl-carousel" style="opacity: 1;">
                    <?php foreach ($banners as $banner) { ?>
                        <div class="item">
                            <a href="<?php echo $banner['link'] ? $banner['link'] : '';?>" ><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
                        </div>
                    <?php } ?>
                </div>
                <script type="text/javascript"><!--
                    $('#partner').owlCarousel({
                        items: 6,
                        lazyLoad : true,
                        autoPlay: 3000,
                        navigation: true,
                        navigationText: ['<i class="fa fa-chevron-left fa-lg"></i>', '<i class="fa fa-chevron-right fa-lg"></i>'],
                        pagination: false
                    });
                    --></script>
            </div>
        </div>
    </div>
</div>
