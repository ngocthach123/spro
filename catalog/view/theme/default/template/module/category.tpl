<?php if($layout_id == 3):?>
  <div class="boxcol-left">
    <div class="boxcol-heading">
      <?php echo $category['name']; ?>
    </div>
    <div class="boxcol-content">
      <ul class="boxcategory">
        <?php foreach ($category['children'] as $child): ?>
        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
            <?php if ($child['children']): ?>
            <ul>
              <?php foreach ($child['children'] as $child_2): ?>
               <li><a href="<?php echo $child_2['href']; ?>"><?php echo $child_2['name']; ?></a></li>
              <?php endforeach;?>
            </ul>
            <?php endif;?>
          </li>
        <?php endforeach;?>
      </ul>
    </div>
  </div>
  <!-- boxcol-left -->
  <div class="boxcol-left">
    <div class="boxcol-heading">
      Tìm theo
    </div>
    <div class="boxcol-content">
      <!-- filtersearch -->
      <div class="filtersearch-page">
        <form method="get" action="<?php echo $action_search;?>" id="search-category">
          <input type="text" name="filter_name" placeholder="Tìm theo tên, mã sản phẩm" value="<?php echo $filter_name;?>"/>
          <div class="button-filter" onclick="document.getElementById('search-category').submit()"><i class="fa fa-search"></i></div>
        </form>
      </div>
      <!-- filtermanufacturer -->
      <?php if($manufacturers): ?>
      <div class="filtertypes-page">
        <div class="txtfiltertypes">
          <a data-toggle="collapse" href="#filtermanufacturer">Hãng sản xuất</a>
        </div>
        <div class="itemfiltertypes">
          <div id="filtermanufacturer" class="collapse in">
            <?php foreach($manufacturers as $manufacturer): ?>
              <label><input type="checkbox" name="" value="<?php echo $manufacturer['href'];?>" onclick="location = this.value;" <?php echo $manufacturer['checked'] ? 'checked' : '';?> >
                <?php echo $manufacturer['name'];?> <span></span>
              </label>
           <?php endforeach;?>
          </div>
        </div>
      </div>
      <?php endif;?>
      <!-- filterprice -->
      <div class="filtertypes-page">
        <div class="txtfiltertypes">
          <a data-toggle="collapse" href="#filterprice">Tìm theo giá</a>
        </div>
        <div class="itemfiltertypes">
          <div id="filterprice" class="collapse in">
            <?php foreach ($money as $money):?>
              <label><input type="checkbox" name="" value="<?php echo $money['href'];?>" onclick="location = this.value;" <?php echo $money['checked'] ? 'checked' : '';?>>
                <?php echo $money['text'];?> <span></span>
              </label>
            <?php endforeach;?>
          </div>
        </div>
      </div>
      <!-- end filterprice -->
    </div>
  </div><!-- end boxcol-left -->

<?php else:?> <!-- trang chu -->

<div id="mainmenucate-top">
  <ul class="sub-1">
    <!-- menu cấp 1 -->
    <?php foreach ($categories as $category): ?>
      <li>
        <i class="cat-ic" <?php echo "style='background:url(\"".$category['thumb']."\") no-repeat 50% 50%'"; ?> ></i>
      <a href="<?php echo $category['href']; ?>" class="<?php echo $category['category_id'] == $category_id ? 'active': ''; ?>">
        &nbsp;<?php echo $category['name']; ?> <i class="fa fa-chevron-right"></i>
      </a>
        <?php if ($category['children']): $i = 1;?>
          <ul class="sub-2">
            <div class="col-md-4">
            <!-- menu cấp 2 -->
            <?php foreach ($category['children'] as $child): ?>
              <li><a href="<?php echo $child['href']; ?>" class="<?php echo $child['category_id'] == $child_id ? 'active' : ''; ?>"><b><?php echo $child['name']; ?></b></a>
                <?php if ($child['children']): ?>
                  <ul>
                    <!-- menu cấp 3 -->
                    <?php foreach ($child['children'] as $child_2): ?>
                    <li><a href="<?php echo $child_2['href']; ?>"><?php echo $child_2['name']; ?></a></li>

                    <?php if ($i == 14): ?>
                      </ul></li></div> <div class="col-md-4"><li><ul>
                    <?php endif;?>

                    <?php $i++; endforeach;?>
                    <!-- menu cấp 3 -->
                  </ul>
                <?php endif;?>
              </li>

              <?php if ($i == 14 || $i == 28): ?>
                </div><div class="col-md-4">
              <?php endif;?>

            <?php $i++; endforeach;?>
            <!-- end menu cấp 2 -->
            </div>

            <?php if($i<28 && $category['banner'] != '') : ?>
              <div class="col-md-4 pull-right">
                <a href="<?php echo $category['link_banner']; ?>"><img src="<?php echo $category['banner']; ?>" class="img-responsive"></a>
              </div>
            <?php endif;?>
          </ul>
      <?php endif;?>
    </li>
    <?php endforeach;?>
    <!-- menu cấp 1 -->
  </ul>
</div>

<script>
  if($("body").hasClass('common-home') || $("body").attr('class') == ''){
    $("#mainmenucate-top").css({"opacity":"1","visibility": "visible", "top": "100%"});
  }

  $(document).ready(function() {
    $('#mainmenucate-top li ul.sub-2').css('min-height', $('#mainmenucate-top').innerHeight() +2);
  });
</script>

<?php endif;?>
