<ul id="menu">
  <?php foreach ($stores as $store) { ?>
  <li><a href="<?php echo $store['href']; ?>" target="_blank"><i class="fa fa-dashboard fa-fw"></i> <span>Xem website</span></a></li>
  <?php } ?>
  <li id="catalog"><a class="parent"><i class="fa fa-pie-chart fa-fw"></i> <span><?php echo $text_catalog; ?></span></a>
    <ul class="collapse">
      <li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
      <li><a  href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li>
      <li><a href="<?php echo $product_sale; ?>"><?php echo $text_product_sale; ?></a></li>
      <li><a href="<?php echo $virtual_product; ?>"><?php echo $text_virtual_product; ?></a></li>
      <li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>
      <li><a href="<?php echo $access_group; ?>"><?php echo $text_access_group; ?></a></li>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <!-- end review store -->
      <li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
    </ul>
  </li>

  <li><a href="<?php echo $price_report; ?>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <?php echo $text_price_report; ?></a></li>

  <li><a class="parent"><i class="fa fa-envelope" aria-hidden="true"></i> <span><?php echo $text_review; ?></span></a>
    <ul class="collapse">
      <li><a href="<?php echo $review; ?>"><?php echo $text_product_review; ?></a></li>
      <li><a href="<?php echo $href_store_review; ?>"><?php echo $text_store_review; ?></a></li>
    </ul>
  </li>

  <li id="news"><a class="parent"><i class="fa fa-pencil fa-fw"></i> <span>Tin tức</span></a>
    <ul class="collapse">
      <li><a href="<?php echo $news_category; ?>"><?php echo $category_heading_title; ?></a></li>
      <li><a href="<?php echo $article; ?>"><?php echo $article_heading_title; ?></a></li>
      <li><a href="<?php echo $news_review; ?>"><?php echo $review_heading_title; ?></a></li>
      <li><a class="parent hidden">Module</a>
        <ul>
          <li><a href="<?php echo $news_by_category; ?>">Article by category</a></li>
          <li><a href="<?php echo $news_article_category; ?>">Category</a></li>
          <li><a href="<?php echo $news_carousel; ?>">News Carousel By Category</a></li>
        </ul>
      </li>
      <li><a href="<?php echo $news_setting; ?>">Cài đặt</a></li>
    </ul>
  </li>

  <li id="extension"><a class="parent"><i class="fa fa-puzzle-piece fa-fw"></i> <span><?php echo $text_extension; ?></span></a>
    <ul class="collapse">
      <li><a href="<?php echo $installer; ?>"><?php echo $text_installer; ?></a></li>
      <li class="hidden"><a href="<?php echo $modification; ?>"><?php echo $text_modification; ?></a></li>
      <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
      <li><a href="<?php echo $theme; ?>"><?php echo $text_theme; ?></a></li>
      <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
      <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
      <li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
      <?php if ($openbay_show_menu == 1) { ?>
      <li><a class="parent"><?php echo $text_openbay_extension; ?></a>
        <ul class="collapse">
          <li><a href="<?php echo $openbay_link_extension; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
          <li><a href="<?php echo $openbay_link_orders; ?>"><?php echo $text_openbay_orders; ?></a></li>
          <li><a href="<?php echo $openbay_link_items; ?>"><?php echo $text_openbay_items; ?></a></li>
          <?php if ($openbay_markets['ebay'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_ebay; ?></a>
            <ul class="collapse">
              <li><a href="<?php echo $openbay_link_ebay; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_ebay_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_ebay_links; ?>"><?php echo $text_openbay_links; ?></a></li>
              <li><a href="<?php echo $openbay_link_ebay_orderimport; ?>"><?php echo $text_openbay_order_import; ?></a></li>
            </ul>
          </li>
          <?php } ?>
          <?php if ($openbay_markets['amazon'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_amazon; ?></a>
            <ul class="collapse">
              <li><a href="<?php echo $openbay_link_amazon; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazon_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazon_links; ?>"><?php echo $text_openbay_links; ?></a></li>
            </ul>
          </li>
          <?php } ?>
          <?php if ($openbay_markets['amazonus'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_amazonus; ?></a>
            <ul class="collapse">
              <li><a href="<?php echo $openbay_link_amazonus; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazonus_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazonus_links; ?>"><?php echo $text_openbay_links; ?></a></li>
            </ul>
          </li>
          <?php } ?>
          <?php if ($openbay_markets['etsy'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_etsy; ?></a>
            <ul class="collapse">
              <li><a href="<?php echo $openbay_link_etsy; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_etsy_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_etsy_links; ?>"><?php echo $text_openbay_links; ?></a></li>
            </ul>
          </li>
          <?php } ?>
        </ul>
      </li>
      <?php } ?>
    </ul>
  </li>
  <li id="design"><a class="parent"><i class="fa fa-television fa-fw"></i> <span><?php echo $text_design; ?></span></a>
    <ul class="collapse">
      <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
      <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
    </ul>
  </li>
  <li id="sale"><a class="parent"><i class="fa fa-shopping-cart fa-fw"></i> <span><?php echo $text_sale; ?></span></a>
    <ul class="collapse">
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a class="parent"><?php echo $text_voucher; ?></a>
        <ul class="collapse">
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
        </ul>
      </li>
	  <li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
	  <!--        //Newsletter Subscribers-->
	  <li><a href="<?php echo $newssubscribe; ?>"><?php echo $text_newssubscribe; ?></a></li>
	  <!--        //Newsletter Subscribers-->  
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a class="parent"><?php echo $text_paypal ?></a>
        <ul class="collapse">
          <li><a href="<?php echo $paypal_search ?>"><?php echo $text_paypal_search ?></a></li>
        </ul>
      </li>
    </ul>
  </li>
  <li id="customer"><a class="parent"><i class="fa fa-users fa-fw"></i> <span><?php echo $text_customer; ?></span></a>
    <ul class="collapse">
      <li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
      <li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
    </ul>
  </li>
  <li id="system"><a class="parent"><i class="fa fa-cogs fa-fw"></i> <span><?php echo $text_system; ?></span></a>
    <ul class="collapse">
      <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
      <li><a class="parent"><?php echo $text_users; ?></a>
        <ul>
          <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
          <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
          <li><a href="<?php echo $api; ?>"><?php echo $text_api; ?></a></li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_localisation; ?></a>
        <ul class="collapse">
          <li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
          <li><a class="parent"><?php echo $text_tax; ?></a>
            <ul class="collapse">
              <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
              <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
            </ul>
          </li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_tools; ?></a>
        <ul class="collapse">
          <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
		  <li><a href="<?php echo $export_import; ?>"><?php echo $text_export_import; ?></a></li>
          <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
        </ul>
      </li>
    </ul>
  </li>
  <li id="reports"><a class="parent"><i class="fa fa-signal fa-fw"></i> <span><?php echo $text_reports; ?></span></a>
    <ul class="collapse">
      <li><a class="parent"><?php echo $text_sale; ?></a>
        <ul class="collapse">
          <li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
          <li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
          <li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
          <li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
          <li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
        </ul>
      </li>
      <li><a class="parent"><?php echo $text_product; ?></a>
        <ul class="collapse">
          <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
          <li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
        </ul>
      </li>
    </ul>
  </li>
  <li>
    <a href="<?php echo $transport; ?>"><i class="fa fa-truck" aria-hidden="true"></i> <span><?php echo $text_transport; ?></span></a>
  </li>
</ul>

<script>
//  $('a').click(function(e){
//    if($(this).attr("href") && !$(this).attr("target")) {
//      e.preventDefault();
//      var url = $(this).attr('href');

//      $(this).parent().addClass('active');
//      $(this).parent().sibling().removeClass('active');

//      $.ajax({
//        url : url,
//        type : "post", // chọn phương thức gửi là post
//        dateType:"text", // dữ liệu trả về dạng text
//        data : { // Danh sách các thuộc tính sẽ gửi đi
//          ajax : 1
//        },
//        success : function (result){
//          $('#content').html(result);
//          $('#column-left').html($('#content').find("#column-left").html());
//          $('#content').html($('#content').find("#content").html());
//        }
//      });
//url = 'spro.gg';
      //to change the browser URL to the given link location
     // if(url!=window.location){
     //   window.history.pushState({path:url},'',url);
     //}
//stop refreshing to the page given in
//      return false;
//    }
//  });
</script>
