<?php  
class ControllerModuleCat extends Controller {
	public function index($setting) {
		$this->load->language('module/cat');

    	$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['catid'])) {
			$parts = explode('_', (string)$this->request->get['catid']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['cat_id'] = $parts[0];
		} else {
			$data['cat_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

        if(isset($this->request->get['news_id'])){
            $data['newid'] = $this->request->get['news_id'];
        } else {
            $data['newid'] =0;
        }					

		$this->load->model('content/cat');

		$this->load->model('content/news');

		$data['categories'] = array();

		$categories = $this->model_content_cat->getCategories(0);

		foreach ($categories as $cat) {
			
			$children_data = array();
			
			$filter_data = array(
				'filter_cat_id'  => $cat['cat_id'],
				'filter_sub_cat' => true,
				'start'=>0,
				'limit'=>100
            );    
				
			$children = $this->model_content_news->getnewss($filter_data);

			foreach ($children as $child) {
				$children_data[] = array(
					'news_id' => $child['news_id'],
					'name'        => $child['name'],
					'href'        => $this->url->link('content/news','&catid=' . $cat['cat_id'] .'&news_id=' . $child['news_id'])
				);								
			}

			$data['categories'][] = array(
				'cat_id' => $cat['cat_id'],
				'name'        => $cat['name'],
				'children'    => $children_data,
				'href'        => $this->url->link('content/cat', 'catid=' . $cat['cat_id'])
			);			
		}

		return $this->load->view('module/cat', $data);
  	}
}
?>