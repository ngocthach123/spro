<?php
class ControllerModuleLatest extends Controller {
	public function index($setting) {
		$this->load->language('module/latest');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProducts($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price_cal = $this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax'));
					$price = $this->currency->format($price_cal, $this->session->data['currency']);
				} else {
					$price = false;
					$price_cal = 0;
				}

				if ((float)$result['special']) {
					$special_cal = $this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'));
					$special = $this->currency->format($special_cal, $this->session->data['currency']);

					if($price) {$specialper = (($price_cal - $special_cal)/$price_cal) * 100;
						$specialper = ceil($specialper);
					}

				} else {
					$special = false;
					$specialper =false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$coupon = $this->model_catalog_product->getProductCoupon($result['product_id']);

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
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'specialper'     => $specialper,
					'coupon' => $coupon ? $coupon : 0,
					'count_reviews' => $result['reviews'],
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$data['banners'] = array();

			$results = $this->model_design_banner->getBanner($setting['banner_id']);

			foreach ($results as $result) {
				if (is_file(DIR_IMAGE . $result['image'])) {
					$data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'image' => ($setting['bannerheight'] && $setting['bannerwidth']) ? $this->model_tool_image->resize($result['image'], $setting['bannerwidth'], $setting['bannerheight']) : 'image/'.$result['image'],
					);
				}
			}

			return $this->load->view('module/latest', $data);
		}
	}
}
