<?php foreach ($shipping_methods as $shipping_method) { ?>
  <?php if (!$shipping_method['error']) { ?>
    <?php foreach ($shipping_method['quote'] as $quote) { ?>
      <div class="ghtieuchuanfree">
        <div class="cbphivanchuyen">
          <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
        </div>
        <div class="txtphivanchuyen">
          <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label><br>
        </div>
        <button type="button" class="tooltipshipping" data-toggle="tooltip" data-placement="bottom" title="Giao hàng tiêu chuẩn là hình thức giao hàng phổ biến nhất tại Lazada với mức phí thấp và thời gian giao hàng nhanh chóng. Bạn có thể tìm thêm thông tin tại đây."></button>
      </div>
    <?php } ?>
  <?php } ?>
<?php } ?>
