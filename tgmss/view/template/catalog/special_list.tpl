<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
        <div class="pull-right">
       <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
         </div>
      <h1><span class="iconfa"><i class="fa fa-credit-card"></i></span> <?php echo $heading_title_special; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
      <div class="mess"></div>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading hidden">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
          <div class="row">
              <div class="well">
                  <form method="post" id="form-add-special">
                  <div class="form-group">
                   <input type="text" name="add_name" class="form-control" placeholder="Nhập tên sản phẩm" autocomplete="off"/>
                      <input type="hidden" name="product_id" id="product_id" value="">
                  </div>

                  <div class="form-group">
                      <table class="table table-hover">
                          <thead>
                          <tr>
                              <td class="text-left"><?php echo $column_name; ?></a></td>
                              <td class="text-left"><?php echo $column_price; ?></a></td>
                              <td class="text-left"><?php echo $column_price_sale; ?></a></td>
                              <td class="text-left"><?php echo $entry_customer_group; ?></td>
                              <td class="text-left"><?php echo $entry_date_start; ?></td>
                              <td class="text-left"><?php echo $entry_date_end; ?></td>
                          </tr>
                          </thead>
                          <tbody>
                          <tr>
                              <td class="text-left" id="name_product"></td>
                              <td class="text-left" id="price_product"></td>
                              <td class="text-left"><input type="text" name="price" value="" placeholder="<?php echo $entry_price_special; ?>" class="form-control" /></td>
                              <td class="text-left"><select name="customer_group_id" class="form-control">
                                      <?php foreach ($customer_groups as $customer_group) { ?>
                                        <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                                      <?php } ?>
                                  </select></td>

                              <td class="text-left" style="width: 20%;"><div class="input-group date">
                                      <input type="text" name="date_start" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                              <td class="text-left" style="width: 20%;"><div class="input-group date">
                                      <input type="text" name="date_end" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                          </tr>
                          </tbody>
                      </table>
                  </div>
                      <button class="btn btn-primary pull-right" style="margin-right: 45px" id="btn-add-special">Thêm</button>
                      <div style="clear: both"></div>
                  </form>
              </div>
          </div>
      	<div class="row">
	        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	        	<div class="input-group">
	        	  <span class="input-group-addon" id="sizing-addon1">Tìm kiếm</span>
			      <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" class="form-control" placeholder="Nhập tên sản phẩm cần tìm kiếm...">
			      <span class="input-group-btn">
			        <button type="button" id="button-filter" class="btn btn-filter mtbuttonn"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
			      </span>
			    </div>
	        </div>
       	</div>

        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-center"><?php echo $column_image; ?></td>
                  <td class="text-left"><?php if ($sort == 'pd.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                    <td class="text-left"><?php echo $column_price; ?></td>
                    <td class="text-left"><?php if ($sort == 'p.price') { ?>
                        <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_price; ?>"><?php echo $column_price_sale; ?></a>
                        <?php } ?></td>
                    <td class="text-left"><?php echo $entry_customer_group; ?></td>
                    <td class="text-left"><?php echo $entry_date_start; ?></td>
                    <td class="text-left"><?php echo $entry_date_end; ?></td>

                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if($products) { ?>
                <?php foreach ($products as $product) { ?>
                <tr>
                    <input type="hidden" value="<?php echo $product['product_special_id'];?>" id="product_special_id<?php echo $product['product_id']; ?>"/>

                  <td class="text-center"><?php if (in_array($product['product_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $product['product_special_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $product['product_special_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-center"><?php if ($product['image']) { ?>
                    <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
                    <?php } else { ?>
                    <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
                    <?php } ?></td>
                  <td class="text-left"><?php echo $product['name']; ?></td>

                    <td class="text-left"><?php echo $product['price_origin']; ?></td>

                    <td class="text-left"><input type="text" name="price<?php echo $product['product_id']; ?>" value="<?php echo $product['price']; ?>" placeholder="<?php echo $entry_price_special; ?>" class="form-control" /></td>

                    <td class="text-left"><select name="customer_group_id<?php echo $product['product_id']; ?>" class="form-control">
                            <?php foreach ($customer_groups as $customer_group) { ?>
                            <?php if ($customer_group['customer_group_id'] == $product['customer_group_id']) { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select></td>

                    <td class="text-left" style="width: 20%;"><div class="input-group date">
                            <input type="text" name="date_start<?php echo $product['product_id']; ?>" value="<?php echo $product['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                    <td class="text-left" style="width: 20%;"><div class="input-group date">
                            <input type="text" name="date_end<?php echo $product['product_id']; ?>" value="<?php echo $product['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>

                  <td class="text-right"><a data-id="<?php echo $product['product_id'];?>" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary update-special"><i class="fa fa-refresh"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
<script>

    $("#btn-add-special").click(function(e){
        e.preventDefault();
        if($("#product_id").val()==''){
            html = "<div class='alert alert-danger'><i class='fa fa-exclamation-circle'></i> Bạn chưa chọn sản phẩm<button type='button' class='close' data-dismiss='alert'>&times;</button></div>";
            $(".mess").html(html);

            $('html, body').animate({
                scrollTop: $(".mess").offset().top
            }, 1000);
        }else {
            $.ajax({
                url: "<?php echo html_entity_decode($add);?>",
                type: "post",
                dateType: "text",
                data: $("#form-add-special").serialize(),
                success: function (result) {
                    if (result != '0') {
                        location.reload();

//                        html = "<div class='alert alert-success'><i class='fa fa-check-circle'></i> Thêm thành công <button type='button' class='close' data-dismiss='alert'>&times;</button></div>";
//
//                        $(".mess").html(html);
//
//                        $('html, body').animate({
//                            scrollTop: $(".mess").offset().top
//                        }, 1000);
                    }
                }
            });
        }
    });

    $(".update-special").click(function(){

        var id = $(this).attr('data-id');

        $.ajax({
            url : "<?php echo html_entity_decode($edit);?>",
            type : "post",
            dateType:"text",
            data : {
                product_id : id,
                product_special_id: $("#product_special_id"+id).val(),
                price: $("input[name='price"+id+"']").val(),
                customer_group_id: $("select[name='customer_group_id"+id+"']").val(),
                date_start: $("input[name='date_start"+id+"']").val(),
                date_end: $("input[name='date_end"+id+"']").val(),
            },
            success : function (result){
                if(result!='0'){
                    html = "<div class='alert alert-success'><i class='fa fa-check-circle'></i> Cập nhật thành công <button type='button' class='close' data-dismiss='alert'>&times;</button></div>";

                    $(".mess").html(html);

                    $('html, body').animate({
                        scrollTop: $(".mess").offset().top
                    }, 1000);
                }
            }
        });
    });
</script>

  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	var url = 'index.php?route=catalog/product/special&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_price = $('input[name=\'filter_price\']').val();

	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}

	location = url;
});
//--></script>
  <script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
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
		$('input[name=\'filter_name\']').val(item['label']);
	}
});

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
                              price: item['price']
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
          }
      });

//--></script></div>
<script>
    $('.date').datetimepicker({
        pickTime: false,
    });

</script>
<?php echo $footer; ?>