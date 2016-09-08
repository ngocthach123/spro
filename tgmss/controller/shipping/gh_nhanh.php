<?php
class ControllerShippingGhnhanh extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('shipping/gh_nhanh');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('gh_nhanh', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/shipping', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_none'] = $this->language->get('text_none');

		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_total'] = $this->language->get('help_total');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_shipping'),
			'href' => $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('shipping/gh_nhanh', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('shipping/gh_nhanh', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->post['gh_nhanh_total'])) {
			$data['gh_nhanh_total'] = $this->request->post['gh_nhanh_total'];
		} else {
			$data['gh_nhanh_total'] = $this->config->get('gh_nhanh_total');
		}

		if (isset($this->request->post['gh_nhanh_geo_zone_id'])) {
			$data['gh_nhanh_geo_zone_id'] = $this->request->post['gh_nhanh_geo_zone_id'];
		} else {
			$data['gh_nhanh_geo_zone_id'] = $this->config->get('gh_nhanh_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['gh_nhanh_status'])) {
			$data['gh_nhanh_status'] = $this->request->post['gh_nhanh_status'];
		} else {
			$data['gh_nhanh_status'] = $this->config->get('gh_nhanh_status');
		}

		if (isset($this->request->post['gh_nhanh_sort_order'])) {
			$data['gh_nhanh_sort_order'] = $this->request->post['gh_nhanh_sort_order'];
		} else {
			$data['gh_nhanh_sort_order'] = $this->config->get('gh_nhanh_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('shipping/gh_nhanh', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'shipping/gh_nhanh')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}