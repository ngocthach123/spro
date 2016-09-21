<!-- footer -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-3 col-sm-3 col-xs-12">
        <h5>Thông tin liên hệ</h5>
        <ul class="list-unstyled inforfooter">
          <li><a><span class="boxiconfooter"><i class="fa fa-home"></i></span> &nbsp;<?php echo $address;?></a></li>
          <li><a><span class="boxiconfooter"><i class="fa fa-phone"></i></span> &nbsp;<?php echo $phone;?></a></li>
          <li><a><span class="boxiconfooter"><i class="fa fa-envelope"></i></span> &nbsp;<?php echo $email;?></a></li>
        </ul>
      </div>
      <div class="col-md-6 col-sm-6 col-xs-12">
        <div class="col-md-4 col-sm-4 col-xs-12">
          <h5>Tài khoản của bạn</h5>
          <ul class="list-unstyled inforfooterother">
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
            <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
          </ul>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
          <h5>Thông tin chung</h5>
          <ul class="list-unstyled inforfooterother">
            <?php foreach ($informations as $information) { ?>
            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
          <h5>Hợp tác và liên kết</h5>
          <ul class="list-unstyled inforfooterother">
            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
            <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
          </ul>
        </div>
      </div>
      <div class="col-md-3 col-sm-3 col-xs-12">
        <?php echo $header_top;?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-3 col-sm-3 col-xs-12 socialfooter">
        <a href="<?php echo $link_facebook;?>"><i class="fa fa-facebook"></i></a>
        <a href=""><i class="fa fa-twitter"></i></a>
        <a href=""><i class="fa fa-dribbble"></i></a>
        <a href="<?php echo $link_google;?>"><i class="fa fa-google-plus"></i></a>
        <a href=""><i class="fa fa-skype"></i></a>
        <a href=""><i class="fa fa-youtube"></i></a>
      </div>
      <div class="col-md-9 col-sm-9 col-xs-12">

      </div>
    </div>
  </div>
  <!-- hot tag -->
  <div class="wraphottag">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
          <p class="txthottag">Hot Tags</p>
          <p><?php echo $footer_top;?><p>
        </div>
      </div>
    </div>
  </div>
  <!-- end hot tag -->
  <!-- name company -->
  <div class="wrapnamecompany">
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-sm-8 col-xs-12">
          Copyright &copy; 2016 <?php echo $owner;?><br>
          Developed By TGMSS.COM
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
          <?php echo $content_bottom_2; ?>
          <?php echo $tab_1; ?>
        </div>
      </div>
    </div>
  </div>
  <!-- end name company -->
</footer>
<script type="text/javascript" src="catalog/view/javascript/jquery/backtotop/backtotop.js"></script>
<a href="#0" class="cd-top"><i class="fa fa-arrow-up"></i></a>
</body>
</html>