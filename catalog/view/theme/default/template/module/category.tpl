
<div id="mainmenucate-top" class="hidden">
  <ul>
    <!-- menu cấp 1 -->
    <?php foreach ($categories as $category): ?>
      <li>
      <a href="<?php echo $category['href']; ?>" class="<?php echo $category['category_id'] == $category_id ? 'active': ''; ?>">
        <i class="fa fa-bullseye"></i>&nbsp;<?php echo $category['name']; ?> <i class="fa fa-chevron-right"></i>
      </a>
        <?php if ($category['children']): ?>
          <ul>
            <!-- menu cấp 2 -->
            <?php foreach ($category['children'] as $child): ?>
              <li><a href="<?php echo $child['href']; ?>" class="<?php echo $child['category_id'] == $child_id ? 'active' : ''; ?>"><i class="fa fa-bullseye"></i>&nbsp; <?php echo $child['name']; ?></a>
                <?php if ($child['children']): ?>
                  <ul>
                    <!-- menu cấp 3 -->
                    <?php foreach ($child['children'] as $child_2): ?>
                    <li><a href="<?php echo $child_2['href']; ?>"><i class="fa fa-bullseye"></i>&nbsp;<?php echo $child_2['name']; ?></a></li>
                    <?php endforeach;?>
                    <!-- menu cấp 3 -->
                  </ul>
                <?php endif;?>
              </li>
            <?php endforeach;?>
            <!-- end menu cấp 2 -->
          </ul>
      <?php endif;?>
    </li>
    <?php endforeach;?>
    <!-- menu cấp 1 -->
  </ul>
</div>

<script>
  if($("body").hasClass('common-home') || $("body").attr('class') == ''){
    $("#mainmenucate-top").removeClass('hidden');
  }
</script>
