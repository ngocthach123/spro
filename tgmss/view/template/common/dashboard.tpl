<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><span class="iconfa"><i class="fa fa-home"></i></span> <?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">

    <?php if ($warning_news_review) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $warning_news_review; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
      <?php } ?>

    <?php if ($error_install) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_install; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php echo $recent; ?>
        <!-- review store -->
        <?php echo $reviewstore; ?>
        <!-- review product -->
        <?php echo $reviewproduct; ?>
        <!-- details product -->
        <?php echo $detailsproduct; ?>
      </div>
    </div>
    <div class="row hidden">
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $order; ?></div>
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $sale; ?></div>
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $customer; ?></div>
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $online; ?></div>
    </div>
    <div class="row hidden">
      <div class="col-lg-6 col-md-12 col-xs-12 col-sm-12"><?php echo $map; ?></div>
      <div class="col-lg-6 col-md-12 col-xs-12 col-sm-12"><?php echo $chart; ?></div>
    </div>
    <div class="row hidden">
      <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12"><?php echo $activity; ?></div>
      <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12"><?php echo $recent; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>