<?php
class ControllerDashboardDetailsProduct extends Controller {
	public function index() {
		$this->load->language('dashboard/details_product');
		$this->load->model('report/product');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['tag_viewproduct'] = $this->language->get('tag_viewproduct');
		$data['tag_purchaseproduct'] = $this->language->get('tag_purchaseproduct');

		$data['column_id'] = $this->language->get('column_id');
		$data['column_product'] = $this->language->get('column_product');
		$data['column_model'] = $this->language->get('column_model');
		$data['column_view'] = $this->language->get('column_view');
		$data['column_quantity'] = $this->language->get('column_quantity');
		$data['column_total'] = $this->language->get('column_total');

		$data['token'] = $this->session->data['token'];
		$data['viewall'] = $this->url->link('report/product_viewed', 'token=' . $data['token'], true);

		// Last 10 Most View Product
		$data['viewproducts'] = array();

		$filter_datav = array(
			'start' => 0,
			'limit' => 10
		);

		$resultsv = $this->model_report_product->getProductsViewed($filter_datav);

		foreach ($resultsv as $resultv) {
			$data['viewproducts'][] = array(
				'name'    => $resultv['name'],
				'model'   => $resultv['model'],
				'viewed'  => $resultv['viewed'],
			);
		}

		// Last 10 Purchase Product
		$data['purchaseproducts'] = array();

		$filter_datap = array(
			'start'  => 0,
			'limit'  => 10
		);

		$resultsp = $this->model_report_product->getPurchased($filter_datap);

		foreach ($resultsp as $resultp) {
			$data['purchaseproducts'][] = array(
				'name'       => $resultp['name'],
				'model'      => $resultp['model'],
				'quantity'   => $resultp['quantity'],
				'total'      => $this->currency->format($resultp['total'], $this->config->get('config_currency'))
			);
		}

		return $this->load->view('dashboard/details_product', $data);
	}
}