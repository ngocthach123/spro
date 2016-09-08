
<div id="shoppingcart">
    <a href="<?php echo $cart?>"><i class="fa fa-shopping-cart"></i> Giỏ hàng <span class="badgescart top-quantity"><?php echo $items; ?></a></span>
    <?php if ($products || $vouchers): ?>
        <div class="bitemspdincart">
            <div class="head-bitemspdincart">
                Bạn có <?php echo count($products);?> sản phẩm
            </div>
            <div class="content-bitemspdincart">
                <?php foreach ($products as $product): ?>
                    <div class="part-bitemspdincart">
                        <div class="img-bitemspdincart">
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a>
                        </div>
                        <div class="details-bitemspdincart">
                            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                            <input type="text" value="<?php echo $product['quantity']; ?>" readonly="readonly"/><br>
                            <span><?php echo $product['total']; ?></span>
                        </div>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="footer-bitemspdincart">
                <a href="<?php echo $cart; ?>" class="btncartxgh">Xem giỏ hàng</a> <a href="<?php echo $checkout; ?>" class="btncarttt">Thanh toán</a>
            </div>
        </div>
    <?php endif;?>
</div>
