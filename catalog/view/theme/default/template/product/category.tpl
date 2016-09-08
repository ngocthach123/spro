<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

    <!-- boxcol-left -->
  <?php echo $column_left;?>

  <!-- contentpage -->
  <div id="contentpage">
    <!-- slidecategory -->
    <?php echo $content_top;?>

    <!-- wrapbox-category -->
    <div class="wrapbox-category">
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
          <p>Không có sản phẩm trong danh mục này.</p>
        <?php endif;?>
      </div>
      <!-- paginationbottom-category -->
      <div class="paginationbottom-category">
        <?php echo $pagination; ?>
      </div>
    </div>
    <!-- descriptioncategory -->
    <div class="descriptioncategory">
      <?php echo $description;?>
    </div>
  </div>
</div>
<?php echo $footer; ?>
