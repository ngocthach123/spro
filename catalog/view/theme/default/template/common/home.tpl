<?php echo $header; ?>

<div class="slidebanner-home">
  <div class="container">
    <div class="row">
      <div class="col-md-14 col-sm-3 hidden-xs pdslidebanner">&nbsp;</div>
      <div class="col-md-13 col-sm-9 col-xs-12 pdslidebanner bgslidebanner pdleftslidebanner">
        <div id="slideshow" class="owl-carousel" style="opacity: 1;">
          <div class="item">
            <a href="#"><img src="image/slide.jpg" alt="slide"/></a>
          </div>
          <div class="item">
            <a href="#"><img src="image/slide.jpg" alt="slide"/></a>
          </div>
        </div>
        <script type="text/javascript"><!--
          $('#slideshow').owlCarousel({
            items: 6,
            lazyLoad : true,
            autoPlay: 3000,
            singleItem: true,
            navigation: true,
            navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
            pagination: false
          });
          --></script>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-12 pdslidebanner bgslidebanner">
        <div id="bannertrailer">
          <div class="itemimage">
            <a href="#"><img src="image/banner1.jpg" alt="banner1"/></a>
          </div>
          <div class="itemimage">
            <a href="#"><img src="image/banner2.jpg" alt="banner2"/></a>
          </div>
          <div class="itemimage">
            <a href="#"><img src="image/banner3.jpg" alt="banner3"/></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<!-- end slide banner -->
<!-- content home -->
<div class="container">
  <div class="row">
    <div id="content" class="col-lg-12 col-sm-12 col-xs-12">
      <!-- top sản phẩm -->
      <div class="topproduct-home">
        <div class="headertopproduct-home">
          <div class="col-md-4 col-sm-4 col-xs-12 txttopproduct-home pdglrn">
            <p class="titleboxheading-home">Top sản phẩm</p>
          </div>
          <div class="col-md-8 col-sm-8 col-xs-12 tabtopproduct-home pdglrn">
            <ul class="nav nav-tabs navtabtopproduct-home">
              <li class="active"><a data-toggle="tab" href="#topproductfeatured-home">Sản phẩm nổi bật</a></li>
              <li><a data-toggle="tab" href="#topproductbestseller-home">Sản phẩm bán chạy</a></li>
              <li><a data-toggle="tab" href="#topproductspecial-home">Sản phẩm khuyến mãi</a></li>
            </ul>
          </div>
        </div>
        <div class="contenttopproduct-home">
          <div class="tab-content">
            <div class="customNavigation">
              <a class="btn prev"><i class="fa fa-chevron-left"></i></a>
              <a class="btn next"><i class="fa fa-chevron-right"></i></a>
            </div>
           <?php echo $tab_1;?>
            <div id="topproductbestseller-home" class="tab-pane fade">
              <div id="owl-demo2" class="owl-carousel owl-theme">
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.400.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxsale-product">
                      Sale
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.400.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.400.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.400.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.100.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
              </div>
              <script type="text/javascript">
                $(document).ready(function() {
                  var owl = $("#owl-demo2");
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
            <div id="topproductspecial-home" class="tab-pane fade">
              <div id="owl-demo3" class="owl-carousel owl-theme">
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxsale-product">
                      Sale
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
              </div>
              <script type="text/javascript">
                $(document).ready(function() {
                  var owl = $("#owl-demo3");
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
          </div>
        </div>
      </div>
      <!-- end top sản phẩm -->
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
            <div class="item wrapbox-product">
              <div class="contentbox-product">
                <div class="boxnew-product">
                  New
                </div>
                <div class="boximage-product">
                  <a href="#"><img src="image/product1.jpg"/></a>
                  <div class="txtboximage">
                    <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                  </div>
                </div>
                <div class="boxname-product">
                  <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                </div>
                <div class="boxprice-product">
                  <div class="productprice">
                    <span class="productsell">2.100.000đ</span>
                    <span class="productsale">2.600.000đ</span>
                  </div>
                  <div class="percentsale">
                    <span class="percentdiscount">-20%</span>
                  </div>
                </div>
                <div class="boxreview-product">
                  ( 19 nhận xét )
                </div>
              </div>
            </div>
            <div class="item wrapbox-product">
              <div class="contentbox-product">
                <div class="boxsale-product">
                  Sale
                </div>
                <div class="boximage-product">
                  <a href="#"><img src="image/product1.jpg"/></a>
                  <div class="txtboximage">
                    <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                  </div>
                </div>
                <div class="boxname-product">
                  <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                </div>
                <div class="boxprice-product">
                  <div class="productprice">
                    <span class="productsell">2.100.000đ</span>
                    <span class="productsale">2.600.000đ</span>
                  </div>
                  <div class="percentsale">
                    <span class="percentdiscount">-20%</span>
                  </div>
                </div>
                <div class="boxreview-product">
                  ( 19 nhận xét )
                </div>
              </div>
            </div>
            <div class="item wrapbox-product">
              <div class="contentbox-product">
                <div class="boxnew-product">
                  New
                </div>
                <div class="boximage-product">
                  <a href="#"><img src="image/product1.jpg"/></a>
                  <div class="txtboximage">
                    <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                  </div>
                </div>
                <div class="boxname-product">
                  <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                </div>
                <div class="boxprice-product">
                  <div class="productprice">
                    <span class="productsell">2.100.000đ</span>
                    <span class="productsale">2.600.000đ</span>
                  </div>
                  <div class="percentsale">
                    <span class="percentdiscount">-20%</span>
                  </div>
                </div>
                <div class="boxreview-product">
                  ( 19 nhận xét )
                </div>
              </div>
            </div>
            <div class="item wrapbox-product">
              <div class="contentbox-product">
                <div class="boxnew-product">
                  New
                </div>
                <div class="boximage-product">
                  <a href="#"><img src="image/product1.jpg"/></a>
                  <div class="txtboximage">
                    <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                  </div>
                </div>
                <div class="boxname-product">
                  <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                </div>
                <div class="boxprice-product">
                  <div class="productprice">
                    <span class="productsell">2.100.000đ</span>
                    <span class="productsale">2.600.000đ</span>
                  </div>
                  <div class="percentsale">
                    <span class="percentdiscount">-20%</span>
                  </div>
                </div>
                <div class="boxreview-product">
                  ( 19 nhận xét )
                </div>
              </div>
            </div>
            <div class="item wrapbox-product">
              <div class="contentbox-product">
                <div class="boxnew-product">
                  New
                </div>
                <div class="boximage-product">
                  <a href="#"><img src="image/product1.jpg"/></a>
                  <div class="txtboximage">
                    <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                  </div>
                </div>
                <div class="boxname-product">
                  <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                </div>
                <div class="boxprice-product">
                  <div class="productprice">
                    <span class="productsell">2.100.000đ</span>
                    <span class="productsale">2.600.000đ</span>
                  </div>
                  <div class="percentsale">
                    <span class="percentdiscount">-20%</span>
                  </div>
                </div>
                <div class="boxreview-product">
                  ( 19 nhận xét )
                </div>
              </div>
            </div>
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
      <!-- máy xịt rửa cao cấp -->
      <div class="categoryproduct-home">
        <div class="headercategoryproduct-home">
          <div class="col-md-4 col-sm-4 col-xs-12 txtcategoryproduct-home pdglrn">
            <div class="titlecategoryheading-home"><i class="fa fa-gg"></i> Máy xịt rửa cao cấp</div>
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
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                      <div class="txtboximage">
                        <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                      </div>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.100.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxsale-product">
                      Sale
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                      <div class="txtboximage">
                        <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                      </div>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.100.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                      <div class="txtboximage">
                        <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                      </div>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.100.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                      <div class="txtboximage">
                        <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                      </div>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.100.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                      <div class="txtboximage">
                        <a href="#" class="btn btn-boximage">Xem chi tiết</a>
                      </div>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.100.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
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
            <div id="mayxitruakarcher" class="tab-pane fade">
              <div id="owl-democategory2" class="owl-carousel owl-theme">
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.400.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxsale-product">
                      Sale
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.400.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.400.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.400.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.100.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
              </div>
              <script type="text/javascript">
                $(document).ready(function() {
                  var owl = $("#owl-democategory2");
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
            <div id="mayruaxegiadinh" class="tab-pane fade">
              <div id="owl-democategory3" class="owl-carousel owl-theme">
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxsale-product">
                      Sale
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
              </div>
              <script type="text/javascript">
                $(document).ready(function() {
                  var owl = $("#owl-democategory3");
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
            <div id="mayruaxenuocnong" class="tab-pane fade">
              <div id="owl-democategory4" class="owl-carousel owl-theme">
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxsale-product">
                      Sale
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
                <div class="item wrapbox-product">
                  <div class="contentbox-product">
                    <div class="boxnew-product">
                      New
                    </div>
                    <div class="boximage-product">
                      <a href="#"><img src="image/product1.jpg"/></a>
                    </div>
                    <div class="boxname-product">
                      <a href="#">Máy rửa xe cao áp 3.0 kw Project P30-1510B2</a>
                    </div>
                    <div class="boxprice-product">
                      <div class="productprice">
                        <span class="productsell">2.500.000đ</span>
                        <span class="productsale">2.600.000đ</span>
                      </div>
                      <div class="percentsale">
                        <span class="percentdiscount">-20%</span>
                      </div>
                    </div>
                    <div class="boxreview-product">
                      ( 19 nhận xét )
                    </div>
                  </div>
                </div>
              </div>
              <script type="text/javascript">
                $(document).ready(function() {
                  var owl = $("#owl-democategory4");
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
    </div>
  </div>
</div>
<!-- end content home -->
<!-- danh mục nổi bật -->
<div class="wrapfeaturedhome">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-sm-12 col-xs-12">
        <div class="catefeaturedproduct-home">
          <div class="headercatefeatured-home">
            <div class="col-md-12 col-sm-12 col-xs-12 txtheadercatefeatured-home pdglrn">
              <p class="titleboxheading-home">Danh mục nổi bật</p>
            </div>
          </div>
          <div class="contentcatefeaturedproduct-home">
            <div class="col-md-3 col-sm-4 col-xs-12 boxcatecontent">
              <div class="boximagecate-home">
                <a href="#"><img src="image/cateimage.jpg"/></a>
              </div>
              <div class="boxnamecate-home">
                <h2>Máy nén khí</h2>
                <ul class="listcate-home">
                  <li><a href="#">Máy nén khí mini</a></li>
                  <li><a href="#">Máy nén khí piston</a></li>
                  <li><a href="#">Máy nén khí trục vít</a></li>
                  <li><a href="#">Máy nén khí đầu nổ</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-12 boxcatecontent">
              <div class="boximagecate-home">
                <a href="#"><img src="image/cateimage.jpg"/></a>
              </div>
              <div class="boxnamecate-home">
                <h2>Thiết bị sửa chữa vỏ</h2>
                <ul class="listcate-home">
                  <li><a href="#">Bộ dụng cụ vá vỏ</a></li>
                  <li><a href="#">Thiết bị sửa chữa ngành vỏ</a></li>
                  <li><a href="#">Máy tháo vỏ</a></li>
                  <li><a href="#">Thiết bị hỗ trợ</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-12 boxcatecontent">
              <div class="boximagecate-home">
                <a href="#"><img src="image/cateimage.jpg"/></a>
              </div>
              <div class="boxnamecate-home">
                <h2>Máy xịt rửa áp lực cao</h2>
                <ul class="listcate-home">
                  <li><a href="#">Máy rửa xe gia đình</a></li>
                  <li><a href="#">Máy rửa xe</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-12 boxcatecontent">
              <div class="boximagecate-home">
                <a href="#"><img src="image/cateimage.jpg"/></a>
              </div>
              <div class="boxnamecate-home">
                <h2>Thiết bị điện cầm tay</h2>
                <ul class="listcate-home">
                  <li><a href="#">Súng bắn đinh, bắn ghim</a></li>
                  <li><a href="#">Súng siết bu lông bằng điện</a></li>
                  <li><a href="#">Máy khoan</a></li>
                  <li><a href="#">Máy cắt, máy mài</a></li>
                  <li><a href="#">Máy cưa, máy bào, máy đánh bóng</a></li>
                  <li><a href="#">Máy hàn</a></li>
                  <li><a href="#">Khác</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-12 boxcatecontent">
              <div class="boximagecate-home">
                <a href="#"><img src="image/cateimage.jpg"/></a>
              </div>
              <div class="boxnamecate-home">
                <h2>Máy nén khí</h2>
                <ul class="listcate-home">
                  <li><a href="#">Máy nén khí mini</a></li>
                  <li><a href="#">Máy nén khí piston</a></li>
                  <li><a href="#">Máy nén khí trục vít</a></li>
                  <li><a href="#">Máy nén khí đầu nổ</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-12 boxcatecontent">
              <div class="boximagecate-home">
                <a href="#"><img src="image/cateimage.jpg"/></a>
              </div>
              <div class="boxnamecate-home">
                <h2>Thiết bị sửa chữa vỏ</h2>
                <ul class="listcate-home">
                  <li><a href="#">Bộ dụng cụ vá vỏ</a></li>
                  <li><a href="#">Thiết bị sửa chữa ngành vỏ</a></li>
                  <li><a href="#">Máy tháo vỏ</a></li>
                  <li><a href="#">Thiết bị hỗ trợ</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-12 boxcatecontent">
              <div class="boximagecate-home">
                <a href="#"><img src="image/cateimage.jpg"/></a>
              </div>
              <div class="boxnamecate-home">
                <h2>Máy xịt rửa áp lực cao</h2>
                <ul class="listcate-home">
                  <li><a href="#">Máy rửa xe gia đình</a></li>
                  <li><a href="#">Máy rửa xe</a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-12 boxcatecontent">
              <div class="boximagecate-home">
                <a href="#"><img src="image/cateimage.jpg"/></a>
              </div>
              <div class="boxnamecate-home">
                <h2>Thiết bị điện cầm tay</h2>
                <ul class="listcate-home">
                  <li><a href="#">Súng bắn đinh, bắn ghim</a></li>
                  <li><a href="#">Súng siết bu lông bằng điện</a></li>
                  <li><a href="#">Máy khoan</a></li>
                  <li><a href="#">Máy cắt, máy mài</a></li>
                  <li><a href="#">Máy cưa, máy bào, máy đánh bóng</a></li>
                  <li><a href="#">Máy hàn</a></li>
                  <li><a href="#">Khác</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- end danh mục nổi bật -->
<!-- đối tác -->
<div class="wrappartner-home">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-sm-12 col-xs-12">
        <div id="partner" class="owl-carousel" style="opacity: 1;">
          <div class="item">
            <a href="#"><img src="image/partner.jpg" alt="slide" class="img-responsive" /></a>
          </div>
          <div class="item">
            <a href="#"><img src="image/partner.jpg" alt="slide" class="img-responsive" /></a>
          </div>
          <div class="item">
            <a href="#"><img src="image/partner.jpg" alt="slide" class="img-responsive" /></a>
          </div>
          <div class="item">
            <a href="#"><img src="image/partner.jpg" alt="slide" class="img-responsive" /></a>
          </div>
          <div class="item">
            <a href="#"><img src="image/partner.jpg" alt="slide" class="img-responsive" /></a>
          </div>
          <div class="item">
            <a href="#"><img src="image/partner.jpg" alt="slide" class="img-responsive" /></a>
          </div>
          <div class="item">
            <a href="#"><img src="image/partner.jpg" alt="slide" class="img-responsive" /></a>
          </div>
          <div class="item">
            <a href="#"><img src="image/partner.jpg" alt="slide" class="img-responsive" /></a>
          </div>
        </div>
        <script type="text/javascript"><!--
          $('#partner').owlCarousel({
            items: 6,
            lazyLoad : true,
            autoPlay: 3000,
            navigation: true,
            navigationText: ['<i class="fa fa-chevron-left fa-lg"></i>', '<i class="fa fa-chevron-right fa-lg"></i>'],
            pagination: false
          });
          --></script>
      </div>
    </div>
  </div>
</div>
<!-- end đối tác -->

<?php echo $footer; ?>