<?php
class ControllerModuleManufacturers extends Controller {
	public function index($setting) {
		$this->load->language('product/manufacturer');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_brands'] = $this->language->get('text_brands');
		$data['text_index'] = $this->language->get('text_index');
		
		$data['brands'] = array();
		
		$this->load->model('catalog/manufacturer');

//		$datadb['limit'] = 50;
//		$datadb['start'] = 0;
		$datadb = array();
		//$results = $this->model_catalog_manufacturer->getManufacturersByOrder();
		$results = $this->model_catalog_manufacturer->getManufacturers($datadb);
		//echo "<pre>"; print_r($setting);
		$this->load->model('tool/image');
		
		foreach ($results as $result) {
				
				if (is_numeric(utf8_substr($result['name'], 0, 1))) {
					$key = '0 - 9';
				} else {
					$key = utf8_substr(utf8_strtoupper($result['name']), 0, 1);
				}
				
				if (!isset($data['brands'][$key])) {
					$data['brands'][$key]['name'] = $key;
				}
	
			$data['brands'][$key]['manufacturer'][] = array(
				'name'  => $result['name'],
				'image'  => $this->model_tool_image->resize($result['image'], 130, 100),
				'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
			);
		}
		return $this->load->view('module/manufacturers.tpl', $data);
	}
	
}
