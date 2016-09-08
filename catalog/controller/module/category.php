<?php
class ControllerModuleCategory extends Controller {
	public function index($layout_id = 0) {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$data['layout_id'] = $layout_id;

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		if($data['category_id'] && isset($this->request->get['route']) && $this->request->get['route']!='common/header'){
			$category = $this->model_catalog_category->getCategory($data['category_id']);

			$children_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);

			foreach($children as $child) {

				//--cap 3
				$children_data_2 = array();
				$children_2 = $this->model_catalog_category->getCategories($child['category_id']);

				foreach($children_2 as $child_2) {
					$filter_data_2 = array('filter_category_id' => $child_2['category_id'], 'filter_sub_category' => true);
					$children_data_2[] = array(
						'category_id' => $child_2['category_id'],
						'name' => $child_2['name'],
						'href' => $this->url->link('product/category', 'path=' . $child['category_id'] . '_' . $child_2['category_id']),
					);
				}
				//--cap 3

				$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name' => $child['name'],
					'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
					'children'    => $children_data_2,
				);
			}

			$data['category'] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'],
				'description' =>$category['description'],
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);

			//manufacturer


			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			if (isset($this->request->get['manu'])) {
				$has_manu = 1;
			}else{
				$has_manu = 0;
			}

			if (isset($this->request->get['min']) && isset($this->request->get['max'])) {
				$has_money = 1;
				$url .= '&min=' . $this->request->get['min'].'&max='.$this->request->get['max'];
			}else{
				$has_money = 0;
			}


			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			}else{
				$filter_name= '';
			}

			$data['action_search'] = $this->url->link('product/category', 'path=' . $this->request->get['path'] .$url);
			$data['filter_name'] = $filter_name;

			$data['manufacturers'] = array();

			$this->load->model('catalog/manufacturer');
			$manufacturers = $this->model_catalog_manufacturer->getCategoryManufacturer($category['category_id']);

			foreach ($manufacturers as $manufacturer_id) {
				$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);

				if ($manufacturer_info) {
					$data['manufacturers'][] = array(
						'manufacturer_id' => $manufacturer_info['manufacturer_id'],
						'name' =>  $manufacturer_info['name'],
						'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] .$url. ($has_manu ==1 && $this->request->get['manu'] == $manufacturer_info['manufacturer_id'] ? '': '&manu=' .$manufacturer_info['manufacturer_id'])),
						'checked' => ($has_manu ==1 && $this->request->get['manu'] == $manufacturer_info['manufacturer_id']) ? 1 : 0,
					);
				}
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			if (isset($this->request->get['manu'])) {
				$url .= '&manu=' . $this->request->get['manu'];
			}

			for($money = 0; $money<50000000; $money +=10000000 ){
				$data['money'][] = array(
					'text'  => number_format($money).'đ'.' - '. number_format(($money+10000000)).' đ',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url .($has_money ==1 && $this->request->get['min'] == $money ? '': '&min='.$money.'&max='.($money+10000000))),
					'checked' => ($has_money ==1 && $this->request->get['min'] == $money) ? 1 : 0,
				);
			}

		}else{

			$categories = $this->model_catalog_category->getCategories(0);

			foreach ($categories as $category) {
				if ($category['category_id'] != '291') { //291 hang thanh ly
					$children_data = array();

					$children = $this->model_catalog_category->getCategories($category['category_id']);

					foreach ($children as $child) {

						//--cap 3
						$children_data_2 = array();
						$children_2 = $this->model_catalog_category->getCategories($child['category_id']);

						foreach ($children_2 as $child_2) {
							$filter_data_2 = array('filter_category_id' => $child_2['category_id'], 'filter_sub_category' => true);
							$children_data_2[] = array(
								'category_id' => $child_2['category_id'],
								'name' => $child_2['name'],
								'href' => $this->url->link('product/category', 'path=' . $child['category_id'] . '_' . $child_2['category_id']),
							);
						}
						//--cap 3

						$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

						$children_data[] = array(
							'category_id' => $child['category_id'],
							'name' => $child['name'],
							'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
							'children' => $children_data_2,
						);
					}

					$filter_data = array(
						'filter_category_id' => $category['category_id'],
						'filter_sub_category' => true
					);

					$data['categories'][] = array(
						'category_id' => $category['category_id'],
						'name' => $category['name'],
						'children' => $children_data,
						'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
					);
				}
			}

		}

		return $this->load->view('module/category', $data);
	}
}