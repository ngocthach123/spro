<?php
class ControllerDashboardReviewStore extends Controller {
	public function index() {
		$this->load->language('dashboard/review_store');
		$this->load->model('review/store_review');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_id'] = $this->language->get('column_id');
		$data['column_author'] = $this->language->get('column_author');
		$data['column_text'] = $this->language->get('column_text');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_edit'] = $this->language->get('button_edit');

		$data['token'] = $this->session->data['token'];
		$data['viewall'] = $this->url->link('review/store_review', 'token=' . $data['token'], true);

		// Last 5 Review Product
		$url = '';

		$data['reviewstores'] = array();

		$filter_data = array(
			'sort'  => 'o.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => 5
		);

		$results = $this->model_review_store_review->getReviewsDisble($filter_data);

		foreach ($results as $result) {
			$data['reviewstores'][] = array(
				'review_id'  => $result['review_id'],
				'author'     => $result['author'],
				'text'     => utf8_substr(strip_tags(html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
				'status'     => ($result['status']) ? $this->language->get('text_disabled') : $this->language->get('text_enabled'),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'edit'       => $this->url->link('review/store_review/edit', 'token=' . $this->session->data['token'] . '&review_id=' . $result['review_id'] . $url, 'SSL')
			);
		}

		return $this->load->view('dashboard/review_store', $data);
	}
}