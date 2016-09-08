<?php echo $header; ?>

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCvwryvPG1-OcPRLrMb89YcrFRlTbJQ69g&libraries=places"></script>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <div class="bdathangsteptwo">
            <h1><?php echo $heading_title; ?></h1>
            <div class="left-dathangsteptwo">
                <div class="bthongtinkhmuahang">
                    <?php if(!$logged): ?>
                        <p>Bạn đã có tài khoản tại Spro.vn? <a href="#" id="btn-login">Click vào đây để Đăng Nhập</a></p>
                    <?php endif;?>

                    <b>Thông tin thanh toán và nhận hàng</b>
                    <div class="ndthongtinkhmuahang" id="collapse-payment-address">

                    </div>
                </div>
            </div>
            <div class="right-dathangsteptwo">
                <div class="bphuongtienphuongthuc">
                    <div class="bphuongtienvc">
                        <div class="txtphuongtienvc">
                            Phương tiện vận chuyển
                        </div>
                        <div class="typephuongtienvc" id="collapse-shipping-method">
                            Vui lòng điền thông tin thanh toán trước.
                        </div>
                    </div>
                    <div class="bphuongthuctt">
                        <div class="txtphuongthuctt">
                            Phương thức thanh toán
                        </div>
                        <div class="typephuongthuctt" id="collapse-payment-method">
                           Vui lòng điền thông tin thanh toán trước.
                        </div>
                    </div>
                </div>
                <div class="btxtchitietdonhang">
                    Chi tiết đơn hàng
                </div>
                <div class="bthanhtoansanpham">
                    <div class="head-bthanhtoansanpham">
                        <div class="tsp-h">
                            Sản phẩm
                        </div>
                        <div class="gsp-h">
                            Giá
                        </div>
                        <div class="slsp-h">
                            Số lượng
                        </div>
                        <div class="ttsp-h">
                            Thành tiền
                        </div>
                    </div>
                    <div class="wbcontent-bthanhtoansanpham">
                        <?php foreach ($products as $product): ?>
                            <div class="content-bthanhtoansanpham">
                                <div class="tsp-c">
                                    <div class="img-tsp-c">
                                        <img src="<?php echo $product['thumb']; ?>"/>
                                    </div>
                                    <div class="name-tsp-c">
                                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>

                                        <?php if ($product['option']) { ?>
                                        <?php foreach ($product['option'] as $option) { ?>
                                        <br />
                                        <small><img src="image/icon-gift.png"/>: <a class="lkquakhuyenmai""><?php echo $option['text']; ?></a></small>
                                        <?php } ?>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="gsp-c">
                                    <?php echo $product['price']; ?>
                                </div>
                                <div class="slsp-c product_id1">
                                    <div class="qty-slsp-c"><input type="text" value="<?php echo $product['quantity']; ?>" readonly="readonly"/></div>
                                </div>
                                <div class="ttsp-c">
                                    <?php echo $product['total']; ?>
                                </div>
                            </div>
                        <?php endforeach;?>
                    </div>
                    <div class="footer-bthanhtoansanpham">
                        <div class="wrapbtongtienthanhtoan">
                            <div class="btongtienthanhtoan">
                                <div id="ajax-total">
                                    <?php foreach ($totals as $total) { ?>
                                    <div class="wbtongtientt">
                                        <div class="left-wbtongtientt">
                                            <?php echo $total['title']; ?>
                                        </div>
                                        <div class="right-wbtongtientt">
                                            <?php echo $total['text']; ?>
                                        </div>
                                    </div>
                                    <?php }?>
                                </div>
                                <a href="" class="btntongtientt" id="btn-confirm">Xác nhận đơn hàng</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--

<?php if (!$logged) { ?>
$(document).ready(function() {
    $('#btn-login').click(function(e){
        e.preventDefault();

        $.ajax({
            url: 'index.php?route=checkout/login',
            dataType: 'html',
            success: function(html) {
//                $('.left-dathangsteptwo').prepend(html).fadeIn('slow');
                $(html).hide().prependTo(".left-dathangsteptwo").fadeIn("slow");
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
        $(this).parent().remove();
    });
});

        // Checkout
        $.ajax({
            url: 'index.php?route=checkout/guest',
            dataType: 'html',
            success: function(html) {
                $('.alert, .text-danger').remove();

                $('.ndthongtinkhmuahang').html(html);

            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

        var flag = 1;
        $(document).ajaxStop(function(){
            if(flag && $('#input-payment-address-1').val() != ''){
                $('#input-payment-address-1').trigger('blur');
                flag=0;
            }
        });

<?php } else { ?>
    $(document).ready(function() {
        $.ajax({
            url: 'index.php?route=checkout/payment_address',
            dataType: 'html',
            success: function(html) {
                $('#collapse-payment-address').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    var flag_n = 1;

    $(document).ajaxStop(function(){
        var selected = $("input[type='radio'][name='payment_address']:checked");
        if(flag_n && selected.length >0){
            if(selected.val() == 'existing') {
                $('#address_id').trigger('change');
                flag_n = 0;
            }
        }
    });

    $(document).delegate('.radio-address', 'change', function(){
        if($(this).val() == 'existing') {
            $('#address_id').trigger('change');
        }else if($('#input-payment-address-1').val() != ''){
            $('#input-payment-address-1').trigger('change');
        }
    });
<?php } ?>

// Login
$(document).delegate('#button-login', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/login/save',
        type: 'post',
        data: $('#collapse-checkout-option :input'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-login').button('loading');
		},
        complete: function() {
            $('#button-login').button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#collapse-checkout-option').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
		   }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

// Register
$(document).delegate('#button-register', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/register/save',
        type: 'post',
        data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address textarea, #collapse-payment-address select'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
		},
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#button-register').button('reset');

                if (json['error']['warning']) {
                    $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

				for (i in json['error']) {
					var element = $('#input-payment-' + i.replace('_', '-'));

					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
            } else {
                <?php if ($shipping_required) { ?>
                var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').prop('value');

                if (shipping_address) {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
                        success: function(html) {
							// Add the shipping address
                            $.ajax({
                                url: 'index.php?route=checkout/shipping_address',
                                dataType: 'html',
                                success: function(html) {
                                    $('#collapse-shipping-address .panel-body').html(html);

									$('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            });

							$('#collapse-shipping-method .panel-body').html(html);

							$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?> <i class="fa fa-caret-down"></i></a>');

   							$('a[href=\'#collapse-shipping-method\']').trigger('click');

							$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
							$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
							$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_address',
                        dataType: 'html',
                        success: function(html) {
                            $('#collapse-shipping-address .panel-body').html(html);

							$('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');

							$('a[href=\'#collapse-shipping-address\']').trigger('click');

							$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
							$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
							$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
                <?php } else { ?>
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-payment-method .panel-body').html(html);

						$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');

						$('a[href=\'#collapse-payment-method\']').trigger('click');

						$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
                <?php } ?>

                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
                    complete: function() {
                        $('#button-register').button('reset');
                    },
                    success: function(html) {
                        $('#collapse-payment-address .panel-body').html(html);

						$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$(document).delegate('.shipping_method', 'change', function(){
    refresh_total();
});

// Guest
$(document).delegate('#input-payment-address-1, .hasError, #input-payment-zone, #input-payment-city, #address_id', 'blur change', function() {
    <?php if (!$logged) { ?>
        shipping_method_guest();
    <?php }else { ?>
        shipping_method_login();
    <?php };?>
});

$('#btn-confirm').click(function(e){
    e.preventDefault();

    if($("input[type='text']").hasClass('hasError')){
        $('#input-payment-address-1').trigger('blur');
        return false;
    }else {

        $.ajax({
            url: "<?php echo $logged ? 'index.php?route=checkout/payment_address/save' : 'index.php?route=checkout/guest/save';?>",
            type: 'post',
            data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
            dataType: 'json',
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }

                    for (i in json['error']) {
                        var element = $('#input-payment-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).before('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().parent().addClass('has-error');
                } else {

                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method/save',
                        type: 'post',
                        data: $('#collapse-shipping-method input[type=\'radio\']:checked, #collapse-payment-address textarea'),
                        dataType: 'json',
                        success: function (json) {
                            $('.alert, .text-danger').remove();

                            if (json['redirect']) {
                                location = json['redirect'];
                            } else if (json['error']) {
                                $('#button-shipping-method').button('reset');

                                if (json['error']['warning']) {
                                    $('#collapse-shipping-method').prepend('<div class="alert alert-danger">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                }
                            } else {

                                $.ajax({
                                    url: 'index.php?route=checkout/payment_method/save',
                                    type: 'post',
                                    data: $('#collapse-payment-method input[type=\'radio\']:checked, #collapse-payment-method input[type=\'checkbox\']:checked, #collapse-payment-address textarea'),
                                    dataType: 'json',
                                    success: function (json) {
                                        $('.alert, .text-danger').remove();

                                        if (json['redirect']) {
                                            location = json['redirect'];
                                        } else if (json['error']) {
                                            $('#button-payment-method').button('reset');

                                            if (json['error']['warning']) {
                                                $('#collapse-payment-method').prepend('<div class="alert alert-danger">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                            }
                                        } else {
                                            $.ajax({
                                                url: 'index.php?route=checkout/confirm',
                                                dataType: 'html',
                                                success: function (html) {
                                                    $('#content').html(html);
                                                },
                                                error: function (xhr, ajaxOptions, thrownError) {
                                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                }
                                            });
                                        }
                                    },
                                    error: function (xhr, ajaxOptions, thrownError) {
                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                                });
                            }
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });

                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

    }
});

function shipping_method_guest(){
    $.ajax({
        url: 'index.php?route=checkout/guest/save',
        type: 'post',
        data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
        dataType: 'json',
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {

                if (json['error']['warning']) {
                    $('#collapse-payment-address').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                for (i in json['error']) {
                    var element = $('#input-payment-' + i.replace('_', '-'));

                    if ($(element).parent().hasClass('input-group')) {
                        $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                    } else {
                        $(element).before('<div class="text-danger">' + json['error'][i] + '</div>');
                        // Highlight any found errors
                        $(element).addClass('hasError');
                    }
                }
            } else {

                $('.hasError').removeClass('hasError');

                <?php if ($shipping_required) { ?>
                var shipping_address = $('#collapse-payment-address input[name=\'shipping_address\']:checked').prop('value');

                if (shipping_address){
                //***************CAL DISTANCE*****************
                var address = $("input[name='address_1']").val();
                address += ', '+ $("select[name='city'] option:selected").html();
                address += ', '+ $("select[name='zone_id'] option:selected").html()+', Việt Nam';

                var source, destination;
                var directionsDisplay;

                if(address != '' && $("#source").val() != ''){
                var mumbai = new google.maps.LatLng(18.9750, 72.8258);
                var mapOptions = {
                zoom: 7,
                center: mumbai
            };

                //*********DIRECTIONS AND ROUTE**********************//
                source = document.getElementById("source").value;
                destination = address;

                //*********DISTANCE AND DURATION**********************//
                var service = new google.maps.DistanceMatrixService();
                service.getDistanceMatrix({
                origins: [source],
                destinations: [destination],
                travelMode: google.maps.TravelMode.DRIVING,
                unitSystem: google.maps.UnitSystem.METRIC,
                avoidHighways: false,
                avoidTolls: false
            }, function (response, status) {
                if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                var distance = response.rows[0].elements[0].distance.value;
                var duration = response.rows[0].elements[0].duration.text;
                //CHANGE M TO KM
                distance = distance/1000;
                distance = distance.toFixed(2);

                //send
                $.ajax({
                url: 'index.php?route=checkout/shipping_method',
                dataType: 'html',
                data:{
                    distance: distance,
                    zone_id:  $("select[name='zone_id']").val()
                },
                success: function(html) {
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                    $('#collapse-payment-method').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });

                // Add the shipping address
                $.ajax({
                url: 'index.php?route=checkout/guest_shipping',
                dataType: 'html',
                success: function(html) {
                 },
                error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
            });

                $('#collapse-shipping-method').html(html);

                refresh_total(); //cap nhat gia van chuyen
            },
                error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
            });

            } else {
                alert("Unable to find the distance via road.");
            }
            });
            }

                //***************END CAL DISTANCE*****************

            } else {
                $.ajax({
                url: 'index.php?route=checkout/guest_shipping',
                dataType: 'html',
                success: function(html) {
                $('#collapse-shipping-address .panel-body').html(html);

                $('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');

                $('a[href=\'#collapse-shipping-address\']').trigger('click');

                $('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
                $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
                $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
            },
                error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
            });
            }
                <?php } else { ?>
                $.ajax({
                url: 'index.php?route=checkout/payment_method',
                dataType: 'html',
                success: function(html) {
                $('#collapse-payment-method .panel-body').html(html);

                $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');

                $('a[href=\'#collapse-payment-method\']').trigger('click');

                $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
            },
                error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
            });
                <?php } ?>
            }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
            });
}

function shipping_method_login(){
    $.ajax({
        url: 'index.php?route=checkout/payment_address/validate',
        type: 'post',
        data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
        dataType: 'json',
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                for (i in json['error']) {
                    var element = $('#input-payment-' + i.replace('_', '-'));

                    if ($(element).parent().hasClass('input-group')) {
                        $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                    } else {
                        $(element).before('<div class="text-danger">' + json['error'][i] + '</div>');
                    }
                }

                // Highlight any found errors
                $('.text-danger').parent().parent().addClass('has-error');
            } else {
                <?php if($shipping_required) { ?>
                //***************CAL DISTANCE*****************
                var address ='';
                var selected = $("input[type='radio'][name='payment_address']:checked");
                if(selected.length >0){
                    if(selected.val() == 'existing'){
                        address = $("select[name='address_id'] option:selected").html();
                    }
                    if(selected.val() == 'new'){
                        address = $("input[name='address_1']").val();
                        address += ', '+ $("select[name='city'] option:selected").html();
                        address += ', '+ $("select[name='zone_id'] option:selected").html();
                    }
                }

                var source, destination;
                var directionsDisplay;

                if(address != '' && $("#source").val() != ''){
                var mumbai = new google.maps.LatLng(18.9750, 72.8258);
                var mapOptions = {
                zoom: 7,
                center: mumbai
            };

                //*********DIRECTIONS AND ROUTE**********************//
                source = document.getElementById("source").value;
                destination = address;

                //*********DISTANCE AND DURATION**********************//
                var service = new google.maps.DistanceMatrixService();
                service.getDistanceMatrix({
                origins: [source],
                destinations: [destination],
                travelMode: google.maps.TravelMode.DRIVING,
                unitSystem: google.maps.UnitSystem.METRIC,
                avoidHighways: false,
                avoidTolls: false
            }, function (response, status) {
                if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                var distance = response.rows[0].elements[0].distance.value;
                var duration = response.rows[0].elements[0].duration.text;
                //CHANGE M TO KM
                distance = distance/1000;
                distance = distance.toFixed(2);

                //send
                $.ajax({
                url: 'index.php?route=checkout/shipping_method',
                dataType: 'html',
                data:{
                distance: distance,
                },
                success: function(html) {

                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                    $('#collapse-payment-method').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });

                $('#collapse-shipping-method').html(html);
                refresh_total(); //cap nhat gia van chuyen
            },
                error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
            });

            } else {
                alert("Unable to find the distance via road.");
            }
            });
            }

                <?php } else { ?>
                $.ajax({
                url: 'index.php?route=checkout/payment_method',
                dataType: 'html',
                success: function(html) {
                $('#collapse-payment-method .panel-body').html(html);

                $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');

                $('a[href=\'#collapse-payment-method\']').trigger('click');

                $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
            },
                error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
            });
                <?php } ?>

//                $.ajax({
//                    url: 'index.php?route=checkout/payment_address',
//                    dataType: 'html',
//                    success: function(html) {
//                    $('#collapse-payment-address .panel-body').html(html);
//                },
//                    error: function(xhr, ajaxOptions, thrownError) {
//                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
//                }
//                });
            }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
            });
}

function refresh_total(){
    $.ajax({
        url: 'index.php?route=checkout/shipping_method/save',
        type: 'post',
        data: $('#collapse-shipping-method input[type=\'radio\']:checked, #collapse-payment-address textarea'),
        dataType: 'json',
        success: function(json) {

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#button-shipping-method').button('reset');

                if (json['error']['warning']) {
                    $('#collapse-shipping-method .panel-body').prepend('<div class="alert alert-danger">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/checkout/get_total',
                    type: 'get',
                    dataType: 'html',
                    success: function (html) {
                        $('#ajax-total').html(html);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

//--></script>
<?php echo $footer; ?>
