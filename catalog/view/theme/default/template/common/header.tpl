<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/responsive.css" rel="stylesheet">

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<!---------------------------------live search---------------------------------->
  <?php if ($live_search_ajax_status):?>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/live_search.css" />
  <script type="text/javascript"><!--
    var live_search = {
      selector: '#search',
      text_no_matches: 'No matches.',
      height: '50px',
      delay: 400
    }

    $(document).ready(function() {
      var html = '';
      html += '<div id="live-search">';
      html += '	<ul>';
      html += '	</ul>';
      html += '</div>';

      $(live_search.selector).after(html);
      $('input[name=\'search\']').autocomplete({
        'source': function(request, response) {
          if ($(live_search.selector + ' input[type=\'text\']').val() == '') {
            $('#live-search').css('display','none');
          }
          else{
            var html = '';
            html += '<li style="text-align: center;height:10px;">';
            html +=		'	<img class="loading" src="catalog/view/theme/default/image/loading.gif" />';
            html +=	'</li>';
            $('#live-search ul').html(html);

            $('#live-search').css('display','block');

          }
          var filter_name = $(live_search.selector + ' input[type=\'text\']').val();

          if (filter_name.length>0) {
            $.ajax({
              url: 'index.php?route=product/live_search&filter_name=' +  encodeURIComponent(request),
              dataType: 'json',
              success: function(products) {
                $('#live-search ul li').remove();
                if (!$.isEmptyObject(products)) {
                  var show_image = <?php echo $live_search_show_image;?>;
                var show_price = <?php echo $live_search_show_price;?>;
                var show_description = <?php echo $live_search_show_description;?>;

                $.each(products, function(index,product) {
                  var html = '';

                  html += '<li>';
                  html += '<a href="' + product.url + '" title="' + product.name + '">';
                  if(product.image && show_image){
                  html += '	<div class="product-image"><img alt="' + product.name + '" src="' + product.image + '"></div>';
                }
                  html += '	<div class="product-name">' + product.name ;
                  if(show_description){
                  html += '<p>' + product.extra_info + '</p>';
                }
                  html += '</div>';
                  if(show_price){
                  if (product.special) {
                  html += '	<div class="product-price"><span class="special">' + product.price + '</span><span class="price">' + product.special + '</span></div>';
                } else {
                  html += '	<div class="product-price"><span class="price">' + product.price + '</span></div>';
                }
                }
                  html += '<span style="clear:both"></span>';
                  html += '</a>';
                  html += '</li>';
                  $('#live-search ul').append(html);
                });
                } else {
                  var html = '';
                  html += '<li style="text-align: center;height:10px;">';
                  html +=		live_search.text_no_matches;
                  html +=	'</li>';

                  $('#live-search ul').html(html);
                }
                $('#live-search ul li').css('height',live_search.height);
										$('#live-search').css('display','block');
										return false;
									}
								});
							}
						},
						'select': function(product) {
							$('input[name=\'search\']').val(product.name);
                }
                });

                $(document).bind( "mouseup touchend", function(e){
					  var container = $('#live-search');
					  if (!container.is(e.target) && container.has(e.target).length === 0)
					  {
					    container.hide();
					  }
					});

                 var vwidth = $('#search').width() - $('#btn-search-top').width();
                $('#live-search').css('width',vwidth);

				});

    //--></script>
  <?php endif;?>
  <!--------------------------------- end live search---------------------------------->
</head>
<body class="<?php echo $class; ?>">
<!-- information top -->
<nav id="top">
  <div class="container">
	<div class="nav pull-left bscrolinfo">
		<div id="scrollinfor" class="owl-carousel" style="opacity: 1;">
			<?php for($i = 1;$i < 4;$i++) { ?>
			<div class="item">
				<li><a href="#"><i class="fa fa-phone-square"></i></a> <span class="hidden-xs hidden-sm hidden-md">Điện thoại: <?php echo $phone; ?></span>
					&nbsp;&nbsp;
					<a href="#"><i class="fa fa-envelope"></i></a> <span class="hidden-xs hidden-sm hidden-md"> Email: <?php echo $email; ?></span>
				</li>
			</div>
			<?php } ?>
		</div>
		<script type="text/javascript"><!--
		$('#scrollinfor').owlCarousel({
			autoPlay: true,
			navigation : false,
			pagination: false,
			slideSpeed : 300,
			paginationSpeed : 400,
			singleItem: true
		});
		--></script>
	</div>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li class="dropdown top-account"><span class="top-iconuser"><i class="fa fa-user"></i></span> <a href="#" title="Tài khoản" class="dropdown-toggle" data-toggle="dropdown"><span class="hidden-xs hidden-sm hidden-md"><?php echo $logged ? $customer_name : 'Đăng nhập tài khoản' ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
              <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
              <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
              <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
              <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
              <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $order; ?>" title="Kiểm tra đơn hàng" class="wrap-ic"><i class="ic-order"></i> <span class="hidden-xs">Kiểm tra đơn hàng</span></a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- end information top -->
<!-- logo -->
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-6 searchbar">
        <?php echo $search; ?>
      </div>
      <div class="col-sm-3 top-info">
        <div class="row">
          <div class="col-md-6 col-sm-6 col-xs-12 wrap-ic-cart">
            <?php echo $cart; ?>
          </div>
          <div class="col-md-6 col-sm-6 col-xs-12 wrap-hot-line">
            <div id="hotline">Hotline<br><span><?php echo $hotline;?></span></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- end logo -->
<!-- category -->
<nav id="menu" class="navbar">
  <div class="container">
    <div class="row">
      <div class="col-md-3 col-sm-3 col-xs-12">
        <div id="menucategory-top">
          <div class="txtmenucategory-top"><i class="fa fa-bars"></i>&nbsp; Tất cả danh mục</div>
           <?php echo $header_top;?>
        </div>
      </div>
      <div class="col-md-9 col-sm-9 col-xs-12">
        <div class="navbar-header"><span id="category" class="visible-xs">text_category</span>
          <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li class="dropdown"><a href="<?php echo $home; ?>" class="dropdown-toggle" data-toggle="dropdown">Trang chủ</a></li>
            <li><a href="<?php echo $news_sale;?>">Khuyến mãi</a></li>
            <li><a href="<?php echo $thanh_ly;?>">Hàng thanh lý</a></li>
            <li><a href="<?php echo $news;?>">Tin tức</a></li>
            <li><a href="<?php echo $contact;?>">Liên hệ</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</nav>
<!-- end category -->
