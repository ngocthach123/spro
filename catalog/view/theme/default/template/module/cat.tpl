<div class="list-group">
  <?php foreach ($categories as $cat) { ?>
  <?php if ($cat['cat_id'] == $cat_id) { ?>
  <a href="<?php echo $cat['href']; ?>" class="list-group-item active"><?php echo $cat['name']; ?></a>
  <?php if ($cat['children']) { ?>
  <?php foreach ($cat['children'] as $child) { ?>
  <?php if ($child['cat_id'] == $newid) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $cat['href']; ?>" class="list-group-item"><?php echo $cat['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>





