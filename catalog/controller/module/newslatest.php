<?php
class ControllerModuleNewsLatest extends Controller {
	public function index($setting) {
		$this->load->language('module/newslatest');
		
      	$data['heading_title'] = $this->language->get('heading_title');
		
		$this->load->model('tool/image');
		
		$data['newss'] = array();
		
        $this->load->model('content/news');
		
        $this->load->model('content/cat');

		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_content_news->getnewss($filter_data);
		
		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}		
				
				$data['newss'][] = array(
					'news_id' => $result['news_id'],
					'thumb'   	 => $image,
					'name'    	 => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'href'    	 => $this->url->link('content/news', 'news_id=' . $result['news_id'])
				);
			}

			return $this->load->view('module/newslatest', $data);
		}
	}
}
?>