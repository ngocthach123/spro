<?php 
class ControllerContentCat extends Controller { 
	private $error = array();
 
	public function index() {
		$this->load->language('content/cat');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('content/cat');
		 
		$this->getList();
	}

	public function insert() {
		$this->load->language('content/cat');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('content/cat');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_content_cat->addcat($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('content/cat', 'token=' . $this->session->data['token'], 'SSL')); 
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('content/cat');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('content/cat');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			
			$this->model_content_cat->editcat($this->request->get['cat_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('content/cat', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('content/cat');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('content/cat');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $cat_id) {
				$this->model_content_cat->deletecat($cat_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('content/cat', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
   		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('content/cat', 'token=' . $this->session->data['token'], 'SSL'),
   		);
									
		$data['insert'] = $this->url->link('content/cat/insert', 'token=' . $this->session->data['token'], 'SSL');
		$data['delete'] = $this->url->link('content/cat/delete', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['categories'] = array();
		
		$results = $this->model_content_cat->getCategories(0);

		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('content/cat/update', 'token=' . $this->session->data['token'] . '&cat_id=' . $result['cat_id'], 'SSL')
			);
					
			$data['categories'][] = array(
				'cat_id' => $result['cat_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['cat_id'], $this->request->post['selected']),
				'action'      => $action,
                
			);
		}
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
 
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('content/cat_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');		
		$data['text_enabled'] = $this->language->get('text_enabled');
    	$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');
		$data['text_form'] = $this->language->get('text_form');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_parent'] = $this->language->get('entry_parent');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_top'] = $this->language->get('entry_top');
		$data['entry_column'] = $this->language->get('entry_column');		
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_layout'] = $this->language->get('entry_layout');
		
		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_top'] = $this->language->get('help_top');
		$data['help_column'] = $this->language->get('help_column');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

    	$data['tab_general'] = $this->language->get('tab_general');
    	$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
	
 		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('content/cat', 'token=' . $this->session->data['token'], 'SSL'),
   		);
		
		if (!isset($this->request->get['cat_id'])) {
			$data['action'] = $this->url->link('content/cat/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('content/cat/update', 'token=' . $this->session->data['token'] . '&cat_id=' . $this->request->get['cat_id'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('content/cat', 'token=' . $this->session->data['token'], 'SSL');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['cat_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$cat_info = $this->model_content_cat->getcat($this->request->get['cat_id']);
    	}
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['cat_description'])) {
			$data['cat_description'] = $this->request->post['cat_description'];
		} elseif (isset($this->request->get['cat_id'])) {
			$data['cat_description'] = $this->model_content_cat->getcatDescriptions($this->request->get['cat_id']);
		} else {
			$data['cat_description'] = array();
		}

		$categories = $this->model_content_cat->getCategories(0);

		// Remove own id from list
		if (!empty($cat_info)) {
			foreach ($categories as $key => $cat) {
				if ($cat['cat_id'] == $cat_info['cat_id']) {
					unset($categories[$key]);
				}
			}
		}

		$data['categories'] = $categories;

		if (isset($this->request->post['parent_id'])) {
			$data['parent_id'] = $this->request->post['parent_id'];
		} elseif (!empty($cat_info)) {
			$data['parent_id'] = $cat_info['parent_id'];
		} else {
			$data['parent_id'] = 0;
		}
						
		$this->load->model('setting/store');
		
		$data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['cat_store'])) {
			$data['cat_store'] = $this->request->post['cat_store'];
		} elseif (isset($this->request->get['cat_id'])) {
			$data['cat_store'] = $this->model_content_cat->getcatStores($this->request->get['cat_id']);
		} else {
			$data['cat_store'] = array(0);
		}			
		
		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($cat_info)) {
			$data['keyword'] = $cat_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($cat_info)) {
			$data['image'] = $cat_info['image'];
		} else {
			$data['image'] = '';
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($cat_info) && is_file(DIR_IMAGE . $cat_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($cat_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        $this->load->model('content/cat');
        $this->load->model('content/news');		
		$data['categories'] = $this->model_content_cat->getCategories(0);
        
		if (isset($this->request->post['top'])) {
			$data['top'] = $this->request->post['top'];
		} elseif (!empty($cat_info)) {
			$data['top'] = $cat_info['top'];
		} else {
			$data['top'] = 0;
		}
		
		if (isset($this->request->post['column'])) {
			$data['column'] = $this->request->post['column'];
		} elseif (!empty($cat_info)) {
			$data['column'] = $cat_info['column'];
		} else {
			$data['column'] = 1;
		}
				
		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($cat_info)) {
			$data['sort_order'] = $cat_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($cat_info)) {
			$data['status'] = $cat_info['status'];
		} else {
			$data['status'] = 1;
		}
				
		if (isset($this->request->post['cat_layout'])) {
			$data['cat_layout'] = $this->request->post['cat_layout'];
		} elseif (isset($this->request->get['cat_id'])) {
			$data['cat_layout'] = $this->model_content_cat->getcatLayouts($this->request->get['cat_id']);
		} else {
			$data['cat_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/cat_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'content/cat')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['cat_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
					
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'content/cat')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
 
		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}
}
?>