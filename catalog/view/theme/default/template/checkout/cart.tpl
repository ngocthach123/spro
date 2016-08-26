<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cart">
        <div class="bdathangstepone">
          <div class="left-dathangstepone">
            <h1><?php echo $heading_title; ?></h1>
            <div class="bthanhtoansanpham">
              <div class="head-bthanhtoansanpham">
                <div class="tsp-h">
                  Sản phẩm
                </div>
                <div class="gsp-h">
                  Giá
                </div>
                <div class="slsp-h">
                  Số lượng
                </div>
                <div class="ttsp-h">
                  Thành tiền
                </div>
              </div>
              <div class="wbcontent-bthanhtoansanpham">
                <?php foreach ($products as $product): ?>
                  <div class="content-bthanhtoansanpham">
                  <div class="tsp-c">
                    <div class="img-tsp-c">
                      <?php if ($product['thumb']) { ?>
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
                      <?php } ?>
                    </div>
                    <div class="name-tsp-c">
                      <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>

                      <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                      <?php } ?>

                      <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                      <br />
                      <small><img src="image/icon-gift.png"/>: <a class="lkquakhuyenmai""><?php echo $option['text']; ?></a></small>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="gsp-c">
                    <?php echo $product['price']; ?>
                  </div>
                  <div class="slsp-c product_id<?php echo $product['cart_id']; ?>">
                    <button class="minus" id="<?php echo $product['cart_id']; ?>">Giảm</button>
                    <div class="qty-slsp-c"><input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>"/></div>
                    <button class="plus" id="<?php echo $product['cart_id']; ?>">Tăng</button>
                  </div>
                  <div class="ttsp-c">
                    <?php echo $product['total']; ?>
                    <div class="remove-slsp-c">Hủy</div>
                    <div data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="remove-slsp-c delete-cart" onclick="cart.remove('<?php echo $product['cart_id']; ?>','<?php echo $product['product_id']; ?>');"></div>
                  </div>
                </div>
                <?php endforeach;?>
              </div>
              <div class="footer-bthanhtoansanpham">
                <a href="<?php echo $continue; ?>" class="btnttmh-f">
                  <?php echo $button_shopping; ?>
                </a>
                <a href="#" class="btnxgh-f" id="delete-all">
                  Xóa giỏ hàng
                </a>
                <a onclick="document.getElementById('form-cart').submit()" class="btncngh-f"> Cập nhật giỏ hàng</a>
              </div>
            </div>
          </div>
          <div class="right-dathangstepone">
            <?php foreach ($modules as $module) { ?>
            <?php echo $module; ?>
            <?php } ?>

            <div class="bphigiaohang">
              <h3>Ước tính phí giao hàng</h3>
              <div class="ndphigiaohang">
                <p>Nhập địa chỉ vận chuyển đơn hàng</p>
                Tỉnh/Thành phố<br>
                <select id="zone" name="zone">

                </select><br>
                Quận/Huyện<br>
                <select id="district" name="district">
                  <option>Chọn Quận/Huyện</option>
                </select><br>

                <div id="shipping_cost"></div>

              </div>
            </div>
            <div class="btongtienthanhtoan">

              <?php foreach ($totals as $total) { ?>
              <div class="wbtongtientt">
                <div class="left-wbtongtientt">
                  <?php echo $total['title']; ?>
                </div>
                <div class="right-wbtongtientt">
                  <?php echo $total['text']; ?>
                </div>
              </div>
              <?php } ?>

              <a href="<?php echo $checkout; ?>" class="btntongtientt"><?php echo $button_checkout; ?></a>
            </div>
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCvwryvPG1-OcPRLrMb89YcrFRlTbJQ69g&libraries=places"></script>
<script>
  $.ajax({
    url: 'index.php?route=checkout/checkout/country&country_id=230',
    dataType: 'json',
    success: function(json) {

      html = '<option value="">Chọn Tỉnh/Thành phố</option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected">Chọn Tỉnh/Thành phố</option>';
      }

      $('#zone').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });

  $('#zone').on('change', function() {
    $.ajax({
      url: 'index.php?route=checkout/checkout/district&zone_id=' + this.value,
      dataType: 'json',
      success: function(json) {

        html = '<option value="">Chọn Quận/Huyện</option>';

        if (json && json != '') {
          for (i = 0; i < json.length; i++) {
            html += '<option value="' + json[i]['district_id'] + '"';

            html += '>' + json[i]['name'] + '</option>';
          }
        } else {
          html += '<option value="0" selected="selected">Chọn Quận/Huyện</option>';
        }

        $('#district').html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('#district').on('change', function() {
    //*********DIRECTIONS AND ROUTE**********************//
    var source = '<?php echo $store_address;?>';
    var zone = $("select[name='zone'] option:selected").html();
    var district = $("select[name='district'] option:selected").html();

    var destination = district + ',' + zone + 'Việt Nam';

    //*********DISTANCE AND DURATION**********************//
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix({
      origins: [source],
      destinations: [destination],
      travelMode: google.maps.TravelMode.DRIVING,
      unitSystem: google.maps.UnitSystem.METRIC,
      avoidHighways: false,
      avoidTolls: false
    }, function (response, status) {
      if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
        var distance = response.rows[0].elements[0].distance.value;
        var duration = response.rows[0].elements[0].duration.text;
        //CHANGE M TO KM
        distance = distance / 1000;
        distance = distance.toFixed(2);

        //send

        $.ajax({
          url: 'index.php?route=checkout/shipping_method',
          type: 'get',
          dataType: 'html',
          data: {
            distance: distance,
            view_cart: 1
          },
          success: function (html) {
            $('#shipping_cost').html(html);

          },
          error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });

      } else {
        alert("Không thể tính khoảng cách bằng đường bộ.");
      }
    });
  });
</script>

<script type="text/javascript">
  $(".minus").on("click",function(e){
    e.preventDefault();
    var obj = $(".product_id"+$(this).attr('id'));
    var current_num = obj.find("input").val();
    if (current_num <= 1 ) {
      var qty = 1;
      obj.find("input").val(qty);
    } else {
      var set_num = parseInt(current_num) - 1;
      obj.find("input").val(set_num);
    }
  });

  $(".plus").on("click",function(e){
    e.preventDefault();
    var obj = $(".product_id"+$(this).attr('id'));
    var current_num = obj.find("input").val();
    var set_num = parseInt(current_num) + 1;
    obj.find("input").val(set_num);
  });

  $('#delete-all').click(function(){
    $('.delete-cart').trigger('click');
  });

</script>


<?php echo $footer; ?> 