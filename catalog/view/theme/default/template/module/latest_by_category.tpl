<!-- máy xịt rửa cao cấp -->
<div class="categoryproduct-home">

  <div class="headertopproduct-home">
    <div class="col-md-4 col-sm-4 col-xs-12 txttopproduct-home pdglrn">
      <p class="titleboxheading-home"><?php echo $heading_title; ?></p>
    </div>
    <div class="col-md-8 col-sm-8 col-xs-12 tabtopproduct-home pdglrn">
      <ul class="nav nav-tabs nav-link navtabtopproduct-home">
        <?php foreach($childrens as $child):?>
        <li class=""><a href="<?php echo $child['href'];?>"><?php echo $child['name'];?></a></li>
        <?php endforeach;?>
      </ul>
    </div>
  </div>
  <div class="contentcategoryproduct-home">

    <div class="wrap-banner">
      <?php foreach ($banners as $banner) { ?>
      <div class="col-md-12 block-inner-banner boximage-left">
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
        <?php } else { ?>
        <a><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
    <div style="clear: both"></div>

    <div class="tab-content last-by-cat">
      <div class="customNavigation">
        <a class="btn prevcategory<?php echo $category_id;?>"><i class="fa fa-chevron-left"></i></a>
        <a class="btn nextcategory<?php echo $category_id;?>"><i class="fa fa-chevron-right"></i></a>
      </div>
      <div id="mayxitruaproject" class="tab-pane fade in active">
        <div id="owl-democategory<?php echo $category_id;?>" class="owl-carousel owl-theme">
          <?php foreach ($products as $product) { ?>
          <div class="item wrapbox-product">
            <div class="contentbox-product">
              <?php if ($product['special']): ?>
                <div class="boxsale-product">
                  Sale
                </div>
              <?php endif;?>
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
                   </div>
                  <?php } ?>
              </div>
              <div class="boxreview-product">
                <img src="image/rating_star.png"/>(<?php echo $product['count_reviews']; ?> nhận xét)
              </div>
            <?php if($product['coupon']):?>
              <div class="boxvouchers-product">
                <div class="codevouchers">
                  Nhập mã <b><?php echo $product['coupon']['code'];?></b>
                </div>
                <div class="pricevouchers">
                  Chỉ còn<br> <?php echo $product['coupon']['price'];?>
                </div>
              </div>
            <?php endif;?>
            </div>
          </div>
          <?php } ?>
        </div>
      <span class="btn-viewall"><a href="<?php echo $href;?>">Xem tất cả <i class="fa fa-caret-right" aria-hidden="true"></i></a></span>
        <script type="text/javascript">
          $(document).ready(function() {
            var owl = $("#owl-democategory<?php echo $category_id;?>");
            owl.owlCarousel({
              items : 4, //10 items above 1000px browser width
              itemsDesktop : [1000,4], //5 items between 1000px and 901px
              itemsDesktopSmall : [900,3], // betweem 900px and 601px
              itemsTablet: [600,2], //2 items between 600 and 0
              itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
              pagination: false
            });
            // Custom Navigation Events
            $(".nextcategory<?php echo $category_id;?>").click(function(){
              owl.trigger('owl.next');
            })
            $(".prevcategory<?php echo $category_id;?>").click(function(){
              owl.trigger('owl.prev');
            })
          });
        </script>
      </div>
    </div>
  </div>
</div>
<!-- end máy xịt rửa cao cấp -->



