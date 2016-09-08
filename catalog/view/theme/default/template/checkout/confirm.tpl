<?php if (!isset($redirect)) { ?>

<div class="bdathangstepthree">
  <div class="left-dathangstepthree">
    <div class="bdathangthanhcong">
      <div class="txtdathangthanhcong">
        <span>Cảm ơn bạn!</span><br> Đơn hàng của bạn đang được xử lý
      </div>
      <div class="nddiachigiaohang">
        Mã đơn hàng của bạn là: <span> <?php echo $order_id;?></span><br>
        Bạn sẽ nhận được email xác nhận đơn hàng với thông tin chi tiết và mã theo dõi đơn hàng.<br><br>
        <b>Địa chỉ giao hàng của bạn là:</b><br>
       <?php echo $firstname;?><br>
        <?php echo $address_1;?>, <?php echo $city;?>, <?php echo $zone;?><br>
      </div>

      <?php echo $payment; ?>
    </div>
    <a href="index.php?route=common/home" class="btn-orange"> Tiếp tục</a>
  </div>
  <div class="right-dathangstepthree">
    <div class="btomtatdonhang">
      <div class="head-btomtatdonhang">
        Tóm tắt đơn hàng
      </div>
      <div class="wbcontent-btomtatdonhang">
        <?php foreach ($products as $product): ?>
        <div class="content-btomtatdonhang">
          <div class="tsp-ctt">
            <div class="img-tsp-ctt">
              <img src="<?php echo $product['thumb']; ?>"/><br>
            </div>
            <div class="name-tsp-ctt">
              <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><br>
              Số lượng: <?php echo $product['quantity']; ?><br>

              <?php if ($product['option']) { ?>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              <small><img src="image/icon-gift.png"/>: <a class="lkquakhuyenmai""><?php echo $option['text']; ?></a></small>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
          <div class="ttsp-ctt">
            <?php echo $product['price']; ?>
          </div>
        </div>
        <?php endforeach;?>
      </div>
      <div class="footer-btomtatdonhang">
        <div class="wrapbtongtienthanhtoan">
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
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript"><!--

  $.ajax({
    type: 'get',
    url: 'index.php?route=checkout/success',
    cache: false,
    success: function() {

    }
  });

  //--></script>

<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
