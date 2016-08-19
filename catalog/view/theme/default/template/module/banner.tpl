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


