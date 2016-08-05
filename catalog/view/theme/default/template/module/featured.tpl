
<div id="topproductfeatured-home" class="tab-pane fade in active">
  <div id="owl-demo" class="owl-carousel owl-theme">
    <?php foreach ($products as $product): ?>
      <div class="item wrapbox-product">
      <div class="contentbox-product">
        <div class="boxhot-product">
          Hot
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
              <div class="productprice">
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
          ( 19 nhận xét )
        </div>
      </div>
    </div>
    <?php endforeach;?>
  </div>
  <script type="text/javascript">
    $(document).ready(function() {
      var owl = $("#owl-demo");
      owl.owlCarousel({
        items : 4, //10 items above 1000px browser width
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