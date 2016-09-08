<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
    <div class="col-sm-3">
      <div class="boxcol-left">
        <div class="boxcol-heading">
          Tìm theo
        </div>
        <div class="boxcol-content">
          <div class="filtertypes-page">
            <div class="txtfiltertypes">
              <a data-toggle="collapse" href="#filtercat"><?php echo $text_category; ?></a>
            </div>
            <div class="itemfiltertypes">
              <div id="filtercat" class="filter collapse in">
                <?php foreach ($categories as $category_1): ?>
                <label><input type="checkbox" name="" value="<?php echo $category_1['href'];?>" onclick="location = this.value;" <?php echo $category_1['checked'] ? 'checked' : '';?> >
                  <?php echo $category_1['name'];?> <span></span>
                </label>
                <?php endforeach;?>
              </div>
            </div>
          </div>

          <div class="filtertypes-page">
            <div class="txtfiltertypes">
              <a data-toggle="collapse" href="#filtermanufacturer">Hãng sản xuất</a>
            </div>
            <div class="itemfiltertypes">
              <div id="filtermanufacturer" class="filter collapse in">
                <?php foreach ($manufacturers as $manufacturer): ?>
                <label><input type="checkbox" name="" value="<?php echo $manufacturer['href'];?>" onclick="location = this.value;" <?php echo $manufacturer['checked'] ? 'checked' : '';?> >
                  <?php echo $manufacturer['name'];?> <span></span>
                </label>
                <?php endforeach;?>
              </div>
            </div>
          </div>
        </div>
      </div><!-- end boxcol-left -->
    </div>
    <?php echo $column_left; ?>

    <div id="content" class="col-sm-9 wrap-search"><?php echo $content_top; ?>
      <div class="wrapbox-category">
        <h1 class="block"><?php echo $heading_title; ?></h1>
        <!-- boxfilter-category -->
        <div class="boxfilter-category">
          <div class="sortanddisplay">
            <div class="sortprice">
              Sắp xếp theo:
              <select id="input-sort" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
            <div class="displayproduct">
              Hiển thị:
              <select id="input-limit" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="pagination-category">
            <?php echo $pagination; ?>
          </div>
        </div>
        <!-- products-category -->
        <div class="products-category">
          <!-- 1 -->
          <?php if($products): ?>
          <?php foreach ($products as $product): ?>
          <div class="colitemproduct">
            <div class="itemproduct">
              <div class="wrapbox-product">
                <div class="contentbox-product">
                  <?php if ($product['special']):?>
                  <div class="boxsale-product">
                    Sale
                  </div>
                  <?php endif;?>
                  <div class="boximage-product">
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"></a>
                    <div class="txtboximage">
                      <a href="<?php echo $product['href']; ?>" class="btn btn-boximage">Xem chi tiết</a>
                    </div>
                  </div>
                  <div class="boxname-product">
                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  </div>
                  <div class="boxprice-product">
                    <?php if ($product['special']) { ?>
                    <div class="productprice wbp">
                      <span class="productsell"><?php echo $product['special']; ?></span>
                      <span class="productsale"><?php echo $product['price']; ?></span>
                    </div>
                    <div class="percentsale wps">
                      <span class="percentdiscount">-<?php echo $product['specialper']; ?>%</span>
                    </div>
                    <?php } else { ?>
                    <div class="productprice wbp">
                      <span class="productsell"><?php echo $product['price']; ?></span>
                      <span class="">&nbsp;</span>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="boxreview-product hidden">
                    ( 19 nhận xét )
                  </div>
                </div>
              </div>
            </div>
          </div>
          <?php endforeach;?>
          <?php else: ?>
          <p><?php echo $text_empty; ?></p>
          <?php endif;?>
        </div>
        <!-- paginationbottom-category -->
        <div class="paginationbottom-category">
          <?php echo $pagination; ?>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>