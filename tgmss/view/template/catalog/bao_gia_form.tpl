<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-attribute-group" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_customer; ?></a></li>
              <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_product; ?></a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab-general">

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-report_code"><?php echo $entry_report_code; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="report_code" value="<?php echo $report_code; ?>" placeholder="<?php echo $entry_report_code; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-customer"><?php echo $entry_customer; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="customer" value="<?php echo $customer; ?>" placeholder="<?php echo $entry_customer; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-work_place"><?php echo $entry_work_place; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="work_place" value="<?php echo $work_place; ?>" placeholder="<?php echo $entry_work_place; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-address"><?php echo $entry_address; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="address" value="<?php echo $address; ?>" placeholder="<?php echo $entry_address; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-phone"><?php echo $entry_phone; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="phone" value="<?php echo $phone; ?>" placeholder="<?php echo $entry_phone; ?>" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" class="form-control" />
                  </div>
                </div>

                <!-- tab data -->
              </div>
              <div class="tab-pane" id="tab-option">
                <div class="row">
                  <div class="well">
                    <div class="form-group" style="width: 70%; margin-left: 20px">
                      <input type="text" name="add_name" class="form-control" placeholder="Nhập tên sản phẩm" autocomplete="off"/>
                      <input type="hidden" name="product_id" id="product_id" value="">
                      <input type="hidden" name="tax_id" id="tax_id" value="">
                    </div>

                    <div class="form-group" style="width: 70%; margin-left: 20px">
                      <table class="table">
                        <thead>
                        <tr>
                          <td class="text-left"><?php echo $column_product; ?></a></td>
                          <td class="text-left"><?php echo $column_price; ?></a></td>
                          <td class="text-left"><?php echo $column_quantity; ?></a></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                          <td class="text-left" id="name_product"></td>
                          <td class="text-left" id="price_product"></td>
                          <td class="text-left"><input type="text" name="quantiy" id="product_quantiy" class="form-control"></td>
                        </tr>
                        </tbody>
                      </table>
                      <button class="btn btn-primary pull-right" style="margin-right: 15px" id="btn-add-product">Thêm</button>
                    </div>
                    <div style="clear: both"></div>
                  </div>
                </div>

                <div class="row">
                  <div class="table-responsive">
                      <table class="table table-hover">
                        <thead>
                        <tr>
                          <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                          <td class="text-center"><?php echo $column_image; ?></td>
                          <td class="text-left"><?php echo $column_product; ?></a></td>
                          <td class="text-left col-sm-4"><?php echo $column_desc; ?></a></td>
                          <td class="text-center"><?php echo $column_price; ?></td>
                          <td class="text-left" width="100"><?php echo $entry_quantity; ?></td>
                          <td class="text-center"></td>
                        </tr>
                        </thead>
                        <tbody id="rp_product">
                        <?php if($products) { ?>
                        <?php foreach ($products as $product) { ?>
                        <tr>
                          <input type="hidden" value="<?php echo $product['product_id'];?>" name="product_rp_id[]"/>
                          <input type="hidden" value="<?php echo $product['product_id'];?>" name="tax_class_id[]"/>

                          <td class="text-center">
                            <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                           </td>
                          <td class="text-center"><?php if ($product['image']) { ?>
                            <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
                            <?php } else { ?>
                            <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
                            <?php } ?></td>
                          <td class="text-left"><?php echo $product['name']; ?></td>

                          <td class="text-left"><?php echo $product['specs']; ?></td>

                          <td class="text-center"><?php echo $product['price']; ?></td>

                          <td class="text-left"><input type="text" name="quantity_rp[]" value="<?php echo $product['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>

                          <td class="text-center"><a data-toggle="tooltip" title="Xóa" class="btn btn-danger delete-product"><i class="fa fa-trash-o"></i></a></td>
                        </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr id="no-result">
                          <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                        </tr>
                        <?php } ?>
                        </tbody>
                      </table>
                    </div>
                </div>
              </div>
            </div>
          </form>
      </div>
    </div>
  </div>
</div>

<script>
  $('input[name=\'add_name\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id'],
              price: item['price'],
              special: item['special'],
              tax_class_id: item['tax_class_id'],
              description: item['description'],
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('input[name=\'add_name\']').val('');
      $("#name_product").html(item['label']);
      $("#price_product").html(item['price']);
      $("#product_id").val(item['value']);
      $("#tax_id").val(item['tax_class_id']);

      if(item['special'] != '' && item['special'] != null){
        $("#price_product").html(item['special']);
      }
    }
  });

  $("#btn-add-product").click(function(e){
      e.preventDefault();
      var id =  $("#product_id").val();
      var name = $("#name_product").html();
      var price = $("#price_product").html();
      var quantity = $("#product_quantiy").val();
      var tax_id = $("#tax_id").val();

    if(id!='') {
      html = " <tr><input type='hidden' value='" + id + "' name='product_rp_id[]'/>";
      html += "<input type='hidden' value='" + tax_id + "' name='tax_class_id[]'/>";
      html += "<td class='text-center'><input type='checkbox' name='selected[]' value='" + id + "' /></td>";
      html += "<td class='text-center'></td>";
      html += "<td class='text-left'>" + name + "</td>";
      html += "<td class='text-left'></td>";
      html += "<td class='text-center'>" + price + "</td>";
      html += "<td class='text-left'><input type='text' name='quantity_rp[]' value='" + quantity + "' placeholder='Số lượng' class='form-control' /></td>";
      html += "<td class='text-center'><a data-toggle='tooltip' title='Xóa' class='btn btn-danger delete-product'><i class='fa fa-trash-o'></i></a></td>";
      html += "<tr/>";

      $("#no-result").hide();
      $("#rp_product").prepend(html);

      $(".delete-product").click(function(){
        $(this).parent().parent().remove();
      });

    }

  });

  $(".delete-product").click(function(){
    $(this).parent().parent().remove();
  });
</script>

<?php echo $footer; ?>