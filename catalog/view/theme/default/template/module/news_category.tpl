<div class="widget widget_categories block"><h3 class="block block-title">Danh mục</h3>
  <ul>
    <?php if ($categories[0]['children']) { ?>
      <?php foreach ($categories[0]['children'] as $child) { ?>
        <li class="cat-item cat-item-1"><a href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>"><?php echo $child['name']; ?></a></li>
      <?php } ?>
    <?php } ?>
  </ul>
</div>
