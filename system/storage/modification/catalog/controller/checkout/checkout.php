<?php class ControllerCheckoutCheckout extends Controller {
	public function index() {
		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$this->response->redirect($this->url->link('checkout/cart'));
		}

		// Validate minimum quantity requirements.
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$this->response->redirect($this->url->link('checkout/cart'));
			}
		}

		$this->load->language('checkout/checkout');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		// Required by klarna
		if ($this->config->get('klarna_account') || $this->config->get('klarna_invoice')) {
			$this->document->addScript('http://cdn.klarna.com/public/kitt/toc/v1.0/js/klarna.terms.min.js');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_cart'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_checkout_option'] = sprintf($this->language->get('text_checkout_option'), 1);
		$data['text_checkout_account'] = sprintf($this->language->get('text_checkout_account'), 2);
		$data['text_checkout_payment_address'] = sprintf($this->language->get('text_checkout_payment_address'), 2);
		$data['text_checkout_shipping_address'] = sprintf($this->language->get('text_checkout_shipping_address'), 3);
		$data['text_checkout_shipping_method'] = sprintf($this->language->get('text_checkout_shipping_method'), 4);
		
		if ($this->cart->hasShipping()) {
			$data['text_checkout_payment_method'] = sprintf($this->language->get('text_checkout_payment_method'), 5);
			$data['text_checkout_confirm'] = sprintf($this->language->get('text_checkout_confirm'), 6);
		} else {
			$data['text_checkout_payment_method'] = sprintf($this->language->get('text_checkout_payment_method'), 3);
			$data['text_checkout_confirm'] = sprintf($this->language->get('text_checkout_confirm'), 4);	
		}

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}

		$data['logged'] = $this->customer->isLogged();

		if (isset($this->session->data['account'])) {
			$data['account'] = $this->session->data['account'];
		} else {
			$data['account'] = '';
		}

		$data['shipping_required'] = $this->cart->hasShipping();

		//view cart
		$order_data = array();

		$totals = array();
		$taxes = $this->cart->getTaxes();
		$total = 0;

		// Because __call can not keep var references so we put them into an array.
		$total_data = array(
			'totals' => &$totals,
			'taxes'  => &$taxes,
			'total'  => &$total
		);

		$this->load->model('extension/extension');

		$sort_order = array();

		$results = $this->model_extension_extension->getExtensions('total');

		foreach ($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}

		array_multisort($sort_order, SORT_ASC, $results);

		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);

				// We have to put the totals in an array so that they pass by reference.
				$this->{'model_total_' . $result['code']}->getTotal($total_data);
			}
		}

		$sort_order = array();

		foreach ($totals as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $totals);

		$order_data['totals'] = $totals;

		$data['products'] = array();

		$this->load->model('tool/image');

		foreach ($this->cart->getProducts() as $product) {
			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name'  => $option['name'],
					'text'  => $option['text'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
				);
			}

			$recurring = '';

			if ($product['recurring']) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($product['recurring']['trial']) {
					$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
				}

				if ($product['recurring']['duration']) {
					$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
				} else {
					$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
				}
			}

			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
			} else {
				$image = '';
			}


			$access_total = $product['access_price'] * $product['quantity'];
			$data['products'][] = array(
				'cart_id'    => $product['cart_id'],
				'product_id' => $product['product_id'],
				'name'       => $product['name'],
				'thumb'     => $image,
				'model'      => $product['model'],
				'option'     => $option_data,
				'recurring'  => $recurring,
				'quantity'   => $product['quantity'],
				'subtract'   => $product['subtract'],
				'price'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']),
				'access_price'      => $this->currency->format($product['access_price'], $this->session->data['currency']),
				'total'      => $this->currency->format(($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']) + $access_total, $this->session->data['currency']),
				'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			);
		}

		// Gift Voucher
		$data['vouchers'] = array();

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $voucher) {
				$data['vouchers'][] = array(
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
				);
			}
		}

		$data['totals'] = array();

		foreach ($order_data['totals'] as $total) {
			$data['totals'][] = array(
				'title' => $total['title'],
				'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
			);
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
foreach (unserialize(positions) as $key => $position){$data[$key] = $this->load->controller('common/positions', $key);}
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		unset($this->session->data['payment_method']);
		unset($this->session->data['payment_methods']);

		$this->response->setOutput($this->load->view('checkout/checkout', $data));
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function district() {
		$json = array();

		$this->load->model('localisation/zone');

		$json = $this->model_localisation_zone->getDistrictByZoneId($this->request->get['zone_id']);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function get_total()
	{
		//view cart

		$totals = array();
		$taxes = $this->cart->getTaxes();
		$total = 0;

		// Because __call can not keep var references so we put them into an array.
		$total_data = array(
			'totals' => &$totals,
			'taxes'  => &$taxes,
			'total'  => &$total
		);

		$this->load->model('extension/extension');

		$sort_order = array();

		$results = $this->model_extension_extension->getExtensions('total');

		foreach ($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}

		array_multisort($sort_order, SORT_ASC, $results);

		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);

				// We have to put the totals in an array so that they pass by reference.
				$this->{'model_total_' . $result['code']}->getTotal($total_data);
			}
		}

		$sort_order = array();

		foreach ($totals as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $totals);

		$data['totals'] = array();

		foreach ($totals as $total) {
			$data['totals'][] = array(
				'title' => $total['title'],
				'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
			);
		}

		$this->response->setOutput($this->load->view('checkout/ajax_total', $data));
	}

	public function customfield() {
		$json = array();

		$this->load->model('account/custom_field');

		// Customer Group
		if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->get['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
			$json[] = array(
				'custom_field_id' => $custom_field['custom_field_id'],
				'required'        => $custom_field['required']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}

