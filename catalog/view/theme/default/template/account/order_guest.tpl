<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <form action="" method="post" enctype="multipart/form-data" class="form-horizontal btruongdangky">
        <fieldset>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_order_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="order_id" value="" placeholder="<?php echo $entry_order_id; ?>" id="input-id"  />
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-right">
            <input type="submit" value="Tìm" id="btn-seach-order" class="btn-orange" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script>
  $('#btn-seach-order').click(function(e){
    e.preventDefault();

    if($("input[name ='order_id']").val() == ''){
      html = "<div class='alert alert-danger'> Lỗi: Bạn chưa nhập mã đơn hàng.</div>";
      $('#content').prepend(html);
    }else {
      $.ajax({
        url: 'index.php?route=account/order/info',
        type: 'get',
        dataType: 'html',
        data:{
          order_id : $("input[name ='order_id']").val(),
          ajax_request :1
        },
        success: function (html) {
          $('#content').html(html);
        }
      });
    }

  });

</script>