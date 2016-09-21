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
    <!-- top sản phẩm -->
    <div class="topproduct-home">
      <div class="headertopproduct-home">
        <div class="col-md-1 col-sm-1 hidden-xs txttopproduct-cat pdglrn">
          <p class="titleboxheading-home">&nbsp;</p>
        </div>
        <div class="col-md-11 col-sm-11 col-xs-12 tabtopproduct-home pdglrn">
          <ul class="nav nav-tabs navtabtopproduct-home">
            <li class="active"><a data-toggle="tab" href="#topproductfeatured-home">Mới nhất</a></li>
            <li><a data-toggle="tab" href="#topproductbestseller-home">Mua nhiều nhất</a></li>
          </ul>
        </div>
      </div>
      <div class="contenttopproduct-home">
        <div class="tab-content">
          <div class="customNavigation">
            <a class="btn prev"><i class="fa fa-chevron-left"></i></a>
            <a class="btn next"><i class="fa fa-chevron-right"></i></a>
          </div>
          <div id="topproductfeatured-home" class="tab-pane fade in active">
            <div id="owl-demo" class="owl-carousel owl-theme">
              <?php foreach ($products_lasted as $product): ?>
                <div class="item wrapbox-product">
                <div class="contentbox-product">
                  <div class="boxnew-product">
                    New
                  </div>
                  <div class="boximage-product">
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"/></a>
                    <div class="txtboximage">
                      <a href="<?php echo $product['href']; ?>" class="btn btn-boximage">Xem chi tiết</a>
                    </div>
                  </div>
                  <div class="boxname-product">
                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  </div>
                  <div class="boxprice-product">
                    <div class="productprice <?php echo $product['special']? '' : 'box-max';?>">
                      <?php if ($product['special']) { ?>
                        <span class="productsell"><?php echo $product['special']; ?></span>
                        <span class="productsale"> <?php echo $product['price']; ?></span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">- <?php echo $product['specialper']; ?>%</span>
                      </div>
                      <?php } else { ?>
                      <span class="productsell"> <?php echo $product['price']; ?></span>
                      <span class="">&nbsp;</span>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="boxreview-product">
                    <img src="image/rating_star.png"/>(<?php echo $product['count_reviews']; ?> nhận xét)
                  </div>
                </div>
              </div>
              <?php endforeach;?>
            </div>
            <script type="text/javascript">
              $(document).ready(function() {
                var owl = $("#owl-demo");
                owl.owlCarousel({
                  items : 3, //10 items above 1000px browser width
                  itemsDesktop : [1000,4], //5 items between 1000px and 901px
                  itemsDesktopSmall : [900,3], // betweem 900px and 601px
                  itemsTablet: [600,2], //2 items between 600 and 0
                  itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
                  pagination: false
                });
                // Custom Navigation Events
                $(".next").click(function(){
                  owl.trigger('owl.next');
                })
                $(".prev").click(function(){
                  owl.trigger('owl.prev');
                })
              });
            </script>
          </div>
          <div id="topproductbestseller-home" class="tab-pane fade">
            <div id="owl-demo2" class="owl-carousel owl-theme">
              <?php foreach ($products_seller as $product): ?>
                <div class="item wrapbox-product">
                <div class="contentbox-product">
                  <div class="boxsale-product">
                    Sale
                  </div>
                  <div class="boximage-product">
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"/></a>
                  </div>
                  <div class="boxname-product">
                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  </div>
                  <div class="boxprice-product">
                    <div class="productprice <?php echo $product['special']? '' : 'box-max';?>">
                      <?php if ($product['special']) { ?>
                        <span class="productsell"><?php echo $product['special']; ?></span>
                        <span class="productsale"> <?php echo $product['price']; ?></span>
                        </div>
                        <div class="percentsale">
                          <span class="percentdiscount">- <?php echo $product['specialper']; ?>%</span>
                        </div>
                    <?php } else { ?>
                    <span class="productsell"> <?php echo $product['price']; ?></span>
                    <span class="">&nbsp;</span>
                  </div>
                  <?php } ?>
                  </div>
                  <div class="boxreview-product">
                    <img src="image/rating_star.png"/>(<?php echo $product['count_reviews']; ?> nhận xét)
                  </div>
                </div>
              </div>
              <?php endforeach;?>
            </div>
            <script type="text/javascript">
              $(document).ready(function() {
                var owl = $("#owl-demo2");
                owl.owlCarousel({
                  items : 3, //10 items above 1000px browser width
                  itemsDesktop : [1000,4], //5 items between 1000px and 901px
                  itemsDesktopSmall : [900,3], // betweem 900px and 601px
                  itemsTablet: [600,2], //2 items between 600 and 0
                  itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
                  pagination: false
                });
                // Custom Navigation Events
                $(".next").click(function(){
                  owl.trigger('owl.next');
                })
                $(".prev").click(function(){
                  owl.trigger('owl.prev');
                })
              });
            </script>
          </div>
        </div>
      </div>
    </div>
    <!-- end top sản phẩm -->

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
                      <div class="productprice wbp box-max">
                        <span class="productsell"><?php echo $product['price']; ?></span>
                        <span class="">&nbsp;</span>
                      </div>
                    <?php } ?>
                  </div>
                  <div class="boxreview-product">
                    <img src="image/rating_star.png"/>(<?php echo $product['count_reviews']; ?> nhận xét)
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

    <!-- newsrelated-category -->
    <?php if($articles): ?>
      <div class="newsrelated-category">
        <h3>Tin tức liên quan</h3>
          <?php foreach ($articles as $article): ?>
            <div class="itemnews">
              <div class="namenews">
                <a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
              </div>
              <div class="datednews">
                <?php echo $article['date']; ?>
              </div>
              <div class="contentnews">
                <?php echo $article['short_desc']; ?>
              </div>
            </div>
          <?php endforeach; ?>
      </div>
    <?php endif;?>
    <!-- end newsrelated-category -->
  </div>
</div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
