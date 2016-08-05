<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-attribute" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-attribute" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
                <input type="text" name="group_name" value="<?php echo isset($group_name) ? $group_name : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
              <?php if (isset($error_name)) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-access"><?php echo $entry_access; ?></label>
            <div class="col-sm-10">
              <input type="text" name="access" value="" placeholder="<?php echo $entry_access; ?>" id="input-access" class="form-control" />
              <div id="product-access" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($products_access as $product_access) { ?>
                <div id="product-access<?php echo $product_access['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_access['name']; ?>
                  <input type="hidden" name="product_access[]" value="<?php echo $product_access['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
  // Accessories
  $('input[name=\'access\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('input[name=\'access\']').val('');

      $('#product-access' + item['value']).remove();

      $('#product-access').append('<div id="product-access' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_access[]" value="' + item['value'] + '" /></div>');
    }
  });

  $('#product-access').delegate('.fa-minus-circle', 'click', function() {
    $(this).parent().remove();
  });
  //--></script>
<?php echo $footer; ?>
