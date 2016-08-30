<?php foreach ($customer_groups as $customer_group) { ?>
    <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
        <div class="radion hidden">
            <label>
                <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                <?php echo $customer_group['name']; ?></label>
        </div>
    <?php } else { ?>
        <div class="radio hidden">
            <label>
                <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                <?php echo $customer_group['name']; ?></label>
        </div>
    <?php } ?>
<?php } ?>

<input type="hidden" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />

<input class="iprequired" type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname"/><br>
<input class="iprequired" type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-payment-email"/><br>
<input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone"/><br>

<select name="zone_id" id="input-payment-zone">
</select><br>

<select name="city" id="input-payment-city">
    <option>-- Chọn quận huyện --</option>

</select><br>

<input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1"/><br>

<div class="form-group required hidden">
    <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
    <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control" />
</div>
<div class="form-group required hidden">
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

<input type="hidden" value="<?php echo $store_address;?>" id="source">

<textarea placeholder="Ghi chú" rows="4" name="comment"></textarea><br>
<label><input type="checkbox"/> Giao hàng đến địa chỉ khác</label>

<?php if ($shipping_required) { ?>
<div class="checkbox hidden">
    <label>
        <?php if ($shipping_address) { ?>
        <input type="checkbox" name="shipping_address" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="shipping_address" value="1" checked="checked"/>
        <?php } ?>
        <?php echo $entry_shipping; ?></label>
</div>
<?php } ?>

<script type="text/javascript"><!--

	$('#collapse-payment-address input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('#collapse-payment-address .custom-field').hide();
			$('#collapse-payment-address .custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#payment-custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#payment-custom-field' + custom_field['custom_field_id']).addClass('required');
				} else {
					$('#payment-custom-field' + custom_field['custom_field_id']).removeClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#collapse-payment-address input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>

<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
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

		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
var flags = 1;
	$(document).ajaxStop(function() {
		if($('select[name=\'zone_id\']').val() !='' && flags == 1) {
			$('select[name=\'zone_id\']').trigger('change');
			flags = 0;
		}
	});

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
