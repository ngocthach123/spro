<?php
class ControllerModulePopup extends Controller {
	public function index($setting) {
		if(!isset($_COOKIE['popup'])){
			static $module = 0;

			$this->load->model('design/banner');
			$this->load->model('tool/image');

			$this->document->addStyle('catalog/view/javascript/fancybox/jquery.fancybox.css');
			$this->document->addScript('catalog/view/javascript/fancybox/jquery.fancybox.pack.js');

			$data['banners'] = array();

			$results = $this->model_design_banner->getBanner($setting['banner_id']);

			foreach ($results as $result) {
				if (is_file(DIR_IMAGE . $result['image'])) {
					$data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
					);
				}
			}

			$data['delay'] = $setting['delay'] == '' ? 0 : (int)$setting['delay']*1000;
			$data['module'] = $module++;

			setcookie('popup','1',time()+3600);

			return $this->load->view('module/popup', $data);
		}
	}
}
