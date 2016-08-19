<?php echo $header; ?>

<div class="slidebanner-home">
  <div class="container">
    <div class="row">
      <div class="col-md-14 col-sm-3 hidden-xs pdslidebanner">&nbsp;</div>
      <div class="col-md-13 col-sm-9 col-xs-12 pdslidebanner bgslidebanner pdleftslidebanner">
        <?php echo $content_top;?>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-12 pdslidebanner bgslidebanner">
        <?php echo $col_right;?>
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
            <?php echo $tab_2;?>
            <?php echo $tab_3;?>
          </div>
        </div>
      </div>
      <!-- end top sản phẩm -->
    <?php echo $content_bottom; ?>
    </div>
  </div>
</div>
<!-- end content home -->
<!-- danh mục nổi bật -->
  <?php echo $content_bottom_2;?>
<!-- end danh mục nổi bật -->
<div class="wrapinformation-home">
  <div class="container">
    <div class="row">
      <div class="col-lg-15 col-sm-15 col-xs-15 information-home">
        <p><img src="image/numberone.png"/></p>
        <p class="txtinformation-home">Chất lượng tuyệt vời<br>Hậu mãi chu đáo</p>
      </div>
      <div class="col-lg-15 col-sm-15 col-xs-15 information-home">
        <p><img src="image/24h7.png"/></p>
        <p class="txtinformation-home">Dịch vụ chăm sóc khách hàng online<br>Từ 8h - 17h ( Thứ 2 - Thứ 6 )<br>và 8h - 12h ( Thứ 7 )</p>
      </div>
      <div class="col-lg-15 col-sm-15 col-xs-15 information-home">
        <p><img src="image/shipping.png"/></p>
        <p class="txtinformation-home">Giao hàng tận nơi<br>Nhanh chóng - Thuận tiện<br>lắp đặt tận nhà</p>
      </div>
      <div class="col-lg-15 col-sm-15 col-xs-15 information-home">
        <p><img src="image/return.png"/></p>
        <p class="txtinformation-home">Đổi trả dễ dàng,<br> nhanh chóng</p>
      </div>
      <div class="col-lg-15 col-sm-15 col-xs-15 information-home">
        <p><img src="image/dollar.png"/></p>
        <p class="txtinformation-home">Thanh toán <br>dễ dàng, bảo mật cao</p>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>