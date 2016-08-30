<form class="form-horizontal">
  <?php if ($addresses) { ?>
  <div class="radio">
    <label>
      <input type="radio" name="payment_address" class="radio-address" value="existing" checked="checked" />
      <?php echo $text_address_existing; ?></label>
  </div>
  <div id="payment-existing">
    <select name="address_id" class="form-control" id="address_id">
      <?php foreach ($addresses as $address) { ?>
      <?php if ($address['address_id'] == $address_id) { ?>
      <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['address_1']; ?>,<?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $address['address_id']; ?>"><?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>,<?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
      <?php } ?>
      <?php } ?>
    </select>
  </div>
  <div class="radio">
    <label>
      <input type="radio" name="payment_address" class="radio-address" value="new" />
      <?php echo $text_address_new; ?></label>
  </div>
  <?php } ?>
  <br />
  <div id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">

  <input type="hidden" name="lastname" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />
  <input type="hidden" name="postcode" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control" />
  <div class="form-group required hidden">
      <label class="col-sm-2 control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
      <div class="col-sm-10">
          <select name="country_id" id="input-payment-country" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
          </select>
      </div>
  </div>


  <input type="text" name="firstname" value="<?php echo $customer_name;?>" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" />
  <input type="text" name="telephone" value="<?php echo $customer_phone;?>" placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone" />

  <select name="zone_id" id="input-payment-zone">
  </select><br>

  <select name="city" id="input-payment-city">
      <option>-- Chọn quận huyện --</option>
  </select><br>
  <input type="text" name="address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1"/>

  <input type="hidden" value="<?php echo $store_address;?>" id="source">

</div>
<textarea placeholder="Ghi chú" rows="4" name="comment"></textarea><br>

</form>
<script type="text/javascript"><!--
$('input[name=\'payment_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
	} else {
		$('#payment-existing').show();
		$('#payment-new').hide();
	}
});
//--></script>

<script type="text/javascript"><!--
$('#collapse-payment-address select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#collapse-payment-address select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

            $('select[name=\'zone_id\']').html(html);
            $('select[name=\'zone_id\']').trigger('change');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

    $('#collapse-payment-address select[name=\'country_id\']').trigger('change');

    $('select[name=\'zone_id\']').on('change', function() {
        $.ajax({
            url: 'index.php?route=checkout/checkout/district&zone_id=' + this.value,
            dataType: 'json',
            success: function(json) {

                html = '<option value="">Chọn Quận/Huyện</option>';

                if (json && json != '') {
                    for (i = 0; i < json.length; i++) {
                        html += '<option value="' + json[i]['name'] + '"';

                        if (json[i]['name'] == '<?php echo $city; ?>') {
                            html += ' selected="selected"';
                        }

                        html += '>' + json[i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected">Chọn Quận/Huyện</option>';
                }

                $('select[name=\'city\']').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
//--></script>