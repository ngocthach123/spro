<?php if($banner_name == 'Banner Left'):?>
<!-- boximage-left -->
    <div class="boximage-left">
    <?php foreach ($banners as $banner) { ?>
        <div class="itembn-left">
            <?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
            <?php } else { ?>
            <a><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
            <?php } ?>
        </div>
    <?php } ?>
    </div>

<?php elseif($banner_name == 'Banner Right'): ?>

    <div id="bannertrailer">
        <?php foreach ($banners as $banner) { ?>
            <div class="itemimage">
                <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
                <?php } else { ?>
                <a><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
                <?php } ?>
            </div>
        <?php } ?>
    </div>
<?php  elseif($banner_name == 'Banner Bottom 1 3'): ?>
    <div class="wrap-banner">
    <?php foreach ($banners as $banner) { ?>
        <div class="col-md-4 block-banner">
            <?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
            <?php } else { ?>
            <a><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
            <?php } ?>
        </div>
    <?php } ?>
    </div>
    <div style="clear: both"></div>
<?php else: ?>

    <div class="wrap-banner">
        <?php foreach ($banners as $banner) { ?>
        <div class="col-md-12 block-banner">
            <?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
            <?php } else { ?>
            <a><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
            <?php } ?>
        </div>
        <?php } ?>
    </div>
    <div style="clear: both"></div>
<?php endif;?>


