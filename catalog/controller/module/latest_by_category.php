<?php
class ControllerModuleLatestByCategory extends Controller {
	public function index($setting) {
		$this->load->language('module/latest_by_category');
		
		$this->load->model('catalog/category');
		$category_info = $this->model_catalog_category->getCategory($setting['category_id']);
		if(!empty($category_info)) {
			$data['heading_title'] = $category_info['name'];
		} else {
			$data['heading_title'] = $this->language->get('heading_title');
		}

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort' 				 	=> 'p.date_added',
			'filter_category_id'	=> $setting['category_id'],
			'order' 				=> 'DESC',
			'start' 				=> 0,
			'limit' 				=> $setting['limit']
		);

		$results = $this->model_catalog_product->getProducts($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price_cal = $this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax'));
					$price = $this->currency->format($price_cal, $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special_cal = $this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'));
					$special = $this->currency->format($special_cal, $this->session->data['currency']);

					if($price_cal) {$specialper = (($price_cal - $special_cal)/$price_cal) * 100;
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

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'specialper'     => $specialper,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}

			$children_data = array();
			$filter = array(
				'start' => 0,
				'limit' => 4
			);
			$children = $this->model_catalog_category->getCategories($setting['category_id'],$filter);
			foreach($children as $child) {
				$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name' => $child['name'],
					'href' => $this->url->link('product/category', 'path=' . $setting['category_id'] . '_' . $child['category_id'])
				);
			}

			$data['childrens'] = $children_data; //sub categories

			return $this->load->view('module/latest_by_category', $data);
		}
	}
}