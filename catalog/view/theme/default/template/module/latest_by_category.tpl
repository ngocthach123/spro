<!-- máy xịt rửa cao cấp -->
<div class="categoryproduct-home">
  <div class="headercategoryproduct-home">
    <div class="col-md-4 col-sm-4 col-xs-12 txtcategoryproduct-home pdglrn">
      <div class="titlecategoryheading-home"><i class="fa fa-gg"></i><?php echo $heading_title; ?></div>
    </div>
    <div class="col-md-8 col-sm-8 col-xs-12 pillcategoryproduct-home pdglrn">
      <ul class="nav nav-pills navpillcategoryproduct-home">
        <li class="active"><a data-toggle="pill" href="#mayxitruaproject">Máy xịt rửa Project</a></li>
        <li><a data-toggle="pill" href="#mayxitruakarcher">Máy xịt rửa Karcher</a></li>
        <li><a data-toggle="pill" href="#mayruaxegiadinh">Máy rửa xe gia đình</a></li>
        <li><a data-toggle="pill" href="#mayruaxenuocnong">Máy rửa xe nước nóng</a></li>
      </ul>
    </div>
  </div>
  <div class="contentcategoryproduct-home">
    <div class="tab-content">
      <div class="customNavigation">
        <a class="btn prevcategory"><i class="fa fa-chevron-left"></i></a>
        <a class="btn nextcategory"><i class="fa fa-chevron-right"></i></a>
      </div>
      <div id="mayxitruaproject" class="tab-pane fade in active">
        <div id="owl-democategory1" class="owl-carousel owl-theme">
          <?php foreach ($products as $product) { ?>
          <div class="item wrapbox-product">
            <div class="contentbox-product">
              <div class="boxnew-product">
                New
              </div>
              <div class="boximage-product">
                <a href="#"><img src="<?php echo $product['thumb']; ?>"/></a>
                <div class="txtboximage">
                  <a href="<?php echo $product['href']; ?>" class="btn btn-boximage">Xem chi tiết</a>
                </div>
              </div>
              <div class="boxname-product">
                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              </div>
              <div class="boxprice-product">
                <div class="productprice">
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
                ( 19 nhận xét )
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
        <script type="text/javascript">
          $(document).ready(function() {
            var owl = $("#owl-democategory1");
            owl.owlCarousel({
              items : 4, //10 items above 1000px browser width
              itemsDesktop : [1000,4], //5 items between 1000px and 901px
              itemsDesktopSmall : [900,3], // betweem 900px and 601px
              itemsTablet: [600,2], //2 items between 600 and 0
              itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
              pagination: false
            });
            // Custom Navigation Events
            $(".nextcategory").click(function(){
              owl.trigger('owl.next');
            })
            $(".prevcategory").click(function(){
              owl.trigger('owl.prev');
            })
          });
        </script>
      </div>
    </div>
  </div>
</div>
<!-- end máy xịt rửa cao cấp -->



