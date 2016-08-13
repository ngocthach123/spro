
<?php foreach ($banners as $banner): ?>
    <a class="fancybox" style="display: none" href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
<?php endforeach;?>

<script type="text/javascript">
    $(document).ready(function() {
        $(".fancybox").fancybox({
            padding : 0
        });

        setTimeout(function(){
            // Launch fancyBox on first element
            $(".fancybox").eq(0).trigger('click');

        }, <?php echo $delay ?>);
    });
</script>