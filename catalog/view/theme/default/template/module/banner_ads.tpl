
<?php foreach ($banners as $banner): ?>
    <div class="ads" style="top: <?php echo $banner['top'] !=''? $banner['top'] : 'auto'?>; left: <?php echo $banner['left'] !=''? $banner['left'] : 'auto'?>; bottom: <?php echo $banner['bottom'] !=''? $banner['bottom'] : 'auto'?>; right: <?php echo $banner['right'] !=''? $banner['right'] : 'auto'?>; ">
    <span class="banner-close">
        <i class="fa fa-times" aria-hidden="true"></i>
    </span>
    <a class="" href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    </div>
<?php endforeach;?>

<script>
    $(".banner-close").click(function(){
        $(this).parent().remove();
    });
</script>
