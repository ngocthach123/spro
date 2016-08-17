<?php
class ControllerModuleNewsFeatured extends Controller {
	public function index($setting) {
		$this->load->language('module/newsfeatured');

		$data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('content/news');

		$this->load->model('tool/image');

		$data['newss'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		if (!empty($setting['news'])) {
			$newss = array_slice($setting['news'], 0, (int)$setting['limit']);

			foreach ($newss as $news_id) {
				$news_info = $this->model_content_news->getnews($news_id);

				if ($news_info) {
					if ($news_info['image']) {
						$image = $this->model_tool_image->resize($news_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					$data['newss'][] = array(
						'news_id'  => $news_info['news_id'],
						'thumb'       => $image,
						'name'        => $news_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'href'        => $this->url->link('content/news', 'news_id=' . $news_info['news_id'])
					);
				}
			}
		}

		if ($data['newss']) {
			return $this->load->view('module/newsfeatured', $data);
		}
	}
}