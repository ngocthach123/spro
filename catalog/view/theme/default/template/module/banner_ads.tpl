
<?php foreach ($banners as $banner): ?>
    <div class="ads" style="top: <?php echo $banner['top'] !=''? $banner['top'] : 'auto'?>; left: <?php echo $banner['left'] !=''? $banner['left'] : 'auto'?>; bottom: <?php echo $banner['bottom'] !=''? $banner['bottom'] : 'auto'?>; right: <?php echo $banner['right'] !=''? $banner['right'] : 'auto'?>; ">
    <a class="fancybox" href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    </div>
<?php endforeach;?>
