<?php echo $header; ?>

<div class="slidebanner-home">
  <div class="container">
    <div class="row">
      <div class="wrap-head-slide">
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
<?php echo $footer; ?>