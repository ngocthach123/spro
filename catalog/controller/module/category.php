<?php
class ControllerModuleCategory extends Controller {
	public function index() {
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

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
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
						'name' => $child_2['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data_2) . ')' : ''),
						'href' => $this->url->link('product/category', 'path=' . $child['category_id'] . '_' . $child_2['category_id']),
					);
				}
				//--cap 3

				$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
					'children'    => $children_data_2,
				);
			}

			$filter_data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true
			);

			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
		}

		return $this->load->view('module/category', $data);
	}
}