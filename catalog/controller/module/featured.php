<?php
class ControllerModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('module/featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		if (!empty($setting['product'])) {
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price_cal = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
						$price = $this->currency->format($price_cal, $this->session->data['currency']);
					} else {
						$price = false;
						$price_cal = 0;
					}

					if ((float)$product_info['special']) {
						$special_cal = $this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'));
						$special = $this->currency->format($special_cal, $this->session->data['currency']);

						if($price) {$specialper = (($price_cal - $special_cal)/$price_cal) * 100;
							$specialper = ceil($specialper);
						}

					} else {
						$special = false;
						$specialper = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					$coupon = $this->model_catalog_product->getProductCoupon($product_info['product_id']);

					if($coupon){
						if($coupon['type'] == 'P' && $coupon['discount']){
							$coupon['price'] = $price_cal - ($price_cal * ($coupon['discount']/100));
							$coupon['price'] = $this->currency->format($coupon['price'], $this->session->data['currency']);
						}else{
							$coupon['price'] = $price_cal- $coupon['discount'];
							$coupon['price'] = $this->currency->format($coupon['price'], $this->session->data['currency']);
						}
					}

					$data['products'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'specialper'     => $specialper,
						'coupon' => $coupon ? $coupon : 0,
						'count_reviews' => $product_info['reviews'],
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
		}

		if ($data['products']) {
			return $this->load->view('module/featured', $data);
		}
	}
}