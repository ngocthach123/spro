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
</head>
<body class="<?php echo $class; ?>">
<!-- information top -->
<nav id="top">
  <div class="container">
    <div class="nav pull-left">
      <ul id="top-support" class="list-inline">
        <li><a href="#"><i class="fa fa-phone-square"></i></a> <span class="hidden-xs hidden-sm hidden-md">Điện thoại: <?php echo $phone; ?></span></li>
        <li><a href="#"><i class="fa fa-envelope"></i></a> <span class="hidden-xs hidden-sm hidden-md"> Email: <?php echo $email; ?></span></li>
      </ul>
    </div>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li class="dropdown top-account"><span class="top-iconuser"><i class="fa fa-user"></i></span> <a href="#" title="Tài khoản" class="dropdown-toggle" data-toggle="dropdown"><span class="hidden-xs hidden-sm hidden-md">Đăng nhập tài khoản</span> <span class="caret"></span></a>
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
        <li><a href="<?php echo $order; ?>" title="Kiểm tra đơn hàng"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md">Kiểm tra đơn hàng</span></a></li>
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
      <div class="col-sm-6">
        <?php echo $search; ?>
      </div>
      <div class="col-sm-3">
        <div class="row">
          <div class="col-md-6 col-sm-6 col-xs-12">
            <?php echo $cart; ?>
          </div>
          <div class="col-md-6 col-sm-6 col-xs-12">
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
          <div id="mainmenucate-top">
            <ul>
              <!-- menu cấp 1 -->
              <li>
                <a href="#">
                  <i class="fa fa-bullseye"></i>&nbsp; Máy nén khí <i class="fa fa-chevron-right"></i>
                </a>
                <ul>
                  <!-- menu cấp 2 -->
                  <li><a href="#"><i class="fa fa-bullseye"></i>&nbsp; Máy nén khí con 1</a>
                    <ul>
                      <!-- menu cấp 3 -->
                      <li><a href="#"><i class="fa fa-bullseye"></i>&nbsp; Máy nén khí 1</a></li>
                      <li><a href="#"><i class="fa fa-bullseye"></i>&nbsp; Máy nén khí 2</a></li>
                      <li><a href="#"><i class="fa fa-bullseye"></i>&nbsp; Máy nén khí 3</a></li>
                      <li><a href="#"><i class="fa fa-bullseye"></i>&nbsp; Máy nén khí 4</a></li>
                      <li><a href="#"><i class="fa fa-bullseye"></i>&nbsp; Máy nén khí 5</a></li>
                      <!-- menu cấp 3 -->
                    </ul>
                  </li>
                  <li><a href="#"><i class="fa fa-bullseye"></i>&nbsp; Máy nén khí con 2</a></li>
                  <!-- end menu cấp 2 -->
                </ul>
              </li>
              <!-- menu cấp 1 -->
              <li>
                <a href="#">
                  <i class="fa fa-bullseye"></i>&nbsp; Máy xịt rửa áp lực cao <i class="fa fa-chevron-right"></i>
                </a>
              </li>
              <li>
                <a href="#"><i class="fa fa-bullseye"></i>&nbsp; Thiết bị sửa chửa ô tô <i class="fa fa-chevron-right"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-bullseye"></i>&nbsp; Thiết bị sửa chửa xe máy <i class="fa fa-chevron-right"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-bullseye"></i>&nbsp; Thiết bị chăm sóc ô tô <i class="fa fa-chevron-right"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-bullseye"></i>&nbsp; Máy vệ sinh công nghiệp <i class="fa fa-chevron-right"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-bullseye"></i>&nbsp; Thiết bị sửa chửa vỏ <i class="fa fa-chevron-right"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-bullseye"></i>&nbsp; Thiết bị điện cầm tay <i class="fa fa-chevron-right"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-bullseye"></i>&nbsp; Thiết bị xây dựng công nghiệp <i class="fa fa-chevron-right"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-bullseye"></i>&nbsp; Dụng cụ khí nén <i class="fa fa-chevron-right"></i></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-md-9 col-sm-9 col-xs-12">
        <div class="navbar-header"><span id="category" class="visible-xs">text_category</span>
          <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Trang chủ</a>
              <div class="dropdown-menu">
                <div class="dropdown-inner">
                  <ul class="list-unstyled">
                    <li><a href="#">child</a></li>
                  </ul>
                </div>
                <a href="#" class="see-all">text_all category['name']</a>
              </div>
            </li>
            <li><a href="#">Khuyến mãi</a></li>
            <li><a href="#">Hàng thanh lý</a></li>
            <li><a href="#">Liên hệ</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</nav>
<!-- end category -->
