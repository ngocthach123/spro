
<!-- sản phẩm mới -->
<div class="latestproduct-home">
  <div class="headerlatestproduct-home">
    <div class="col-md-12 col-sm-12 col-xs-12 txtlatestproduct-home pdglrn">
      <p class="titleboxheading-home">Sản phẩm mới</p>
    </div>
  </div>
  <div class="contentlatestproduct-home">
    <div class="customNavigation">
      <a class="btn prevlatest"><i class="fa fa-chevron-left"></i></a>
      <a class="btn nextlatest"><i class="fa fa-chevron-right"></i></a>
    </div>
    <div id="owl-demolatest" class="owl-carousel owl-theme">
      <?php foreach ($banners as $banner) { ?>
      <div class="item wrapbox-product wrap-banner">
          <div class="boximage-product">
            <?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/></a>
            <?php } else { ?>
            <a><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
            <?php } ?>
          </div>
      </div>
      <?php }?>
      <?php foreach ($products as $product): ?>
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
          <?php if ($product['price']): ?>
          <div class="boxprice-product">
            <?php if (!$product['special']): ?>
            <div class="productprice box-max">
              <span class="productsell"><?php echo $product['price']; ?></span>
            </div>
            <?php else:?>
            <div class="productprice">
              <span class="productsell"><?php echo $product['special'];?></span>
              <span class="productsale"><?php echo $product['price']; ?></span>
            </div>
            <div class="percentsale">
              <span class="percentdiscount">-<?php echo $product['specialper']; ?>%</span>
            </div>
            <?php endif;?>
          </div>
          <?php endif;?>
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
      <?php endforeach;?>
    </div>
    <script type="text/javascript">
      $(document).ready(function() {
        var owl = $("#owl-demolatest");
        owl.owlCarousel({
          items : 4, //10 items above 1000px browser width
          itemsDesktop : [1000,4], //5 items between 1000px and 901px
          itemsDesktopSmall : [900,3], // betweem 900px and 601px
          itemsTablet: [600,2], //2 items between 600 and 0
          itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
          pagination: false
        });
        // Custom Navigation Events
        $(".nextlatest").click(function(){
          owl.trigger('owl.next');
        })
        $(".prevlatest").click(function(){
          owl.trigger('owl.prev');
        })
      });
    </script>
  </div>
</div>
<!-- end sản phẩm mới -->
