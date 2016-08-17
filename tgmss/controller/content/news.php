<?php 
class ControllerContentNews extends Controller {
	private $error = array(); 
     
  	public function index() {
		$this->load->language('content/news');
    	
		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('content/news');
		
		$this->getList();
  	}
  
  	public function insert() {
    	$this->load->language('content/news');

    	$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->load->model('content/news');
		
		$data_dowload = array();
		
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
    	   	if (is_uploaded_file($this->request->files['downloads']['tmp_name'])) {

				$filename = $this->request->files['downloads']['name'] ;
		
				move_uploaded_file($this->request->files['downloads']['tmp_name'], DIR_DOWNLOAD . $this->changeTitle($filename));
                //echo DIR_DOWNLOAD;echo "<br/>";
    			if (file_exists(DIR_DOWNLOAD . $filename)) {
					$data['downloads'] = $this->changeTitle($filename);
					$data['mask'] = $this->request->files['downloads']['name'];
					//echo "1".$data['downloads'];exit;
    			}else{
    				$data['downloads'] = $this->changeTitle($filename);
					$data['mask'] = $this->request->files['downloads']['name'];
    			}
        
    		}
				
			$this->model_content_news->addnews(array_merge($this->request->post, $data_dowload));
	  		
			$this->session->data['success'] = $this->language->get('text_success');
	  
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
					
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->response->redirect($this->url->link('content/news', 'token=' . $this->session->data['token'] . $url, true));
    	}
	
    	$this->getForm();
  	}

  	public function update() {
    	$this->load->language('content/news');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('content/news');
		
		$data_dowload = array();
		
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			if (is_uploaded_file($this->request->files['downloads']['tmp_name'])) {

				$filename = $this->request->files['downloads']['name'] ;
			
				move_uploaded_file($this->request->files['downloads']['tmp_name'], DIR_DOWNLOAD . $this->changeTitle($filename));
				//echo DIR_DOWNLOAD;echo "<br/>";
				if (file_exists(DIR_DOWNLOAD . $filename)) {
					$data['downloads'] = $this->changeTitle($filename);
					$data['mask'] = $this->request->files['downloads']['name'];
					//echo "1".$data['downloads'];exit;
				} else {
					$data['downloads'] = $this->changeTitle($filename);
					$data['mask'] = $this->request->files['downloads']['name'];
				}
	
			} else {
				$result = $this->model_content_news->getnews($this->request->get['news_id']);
				$data['downloads'] = $result['filename']; 
				//echo "2".$data['downloads'];exit;
            }
                
          //print_r($data);exit;
        	$this->model_content_news->editnews($this->request->get['news_id'], array_merge($this->request->post,$data_dowload));
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
		
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
					
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->response->redirect($this->url->link('content/news', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getForm();
  	}

  	public function delete() {
    	$this->load->language('content/news');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('content/news');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $news_id) {
				$this->model_content_news->deletenews($news_id);
	  		}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}	
		
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
					
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->response->redirect($this->url->link('content/news', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getList();
  	}

  	public function copy() {
    	$this->load->language('content/news');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('content/news');
		
		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $news_id) {
				$this->model_content_news->copynews($news_id);
	  		}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}
		
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
					
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->response->redirect($this->url->link('content/news', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getList();
  	}
	
  	protected function getList() {				
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}
        
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }
        
        
        if (isset($this->request->get['filter_category'])) {
			$filter_category = $this->request->get['filter_category'];
		} else {
			$filter_category = null;
		}
		
		if (isset($this->request->get['filter_date'])) {
			$filter_date = $this->request->get['filter_date'];
		} else {
			$filter_date = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.date_available';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
						
		$url = '';
						
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
		
        if (isset($this->request->get['filter_category'])) {
			$url .= '&filter_category=' . $this->request->get['filter_category'];
		}		

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
        
        if (isset($this->request->get['filter_date'])) {
            $url .= '&filter_date=' . $this->request->get['filter_date'];
        }
						
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('content/news', 'token=' . $this->session->data['token'] . $url, true)    
   		);
		
		$data['insert'] = $this->url->link('content/news/insert', 'token=' . $this->session->data['token'] . $url, true);
		
		$data['copy'] = $this->url->link('content/news/copy', 'token=' . $this->session->data['token'] . $url, true);	
		
		$data['delete'] = $this->url->link('content/news/delete', 'token=' . $this->session->data['token'] . $url, true);
		
		$filter_data = array(
			'filter_name'	  => $filter_name, 
			'filter_status'   => $filter_status,
            'filter_cat_id' => $filter_category,
            'filter_date'      => $filter_date, 
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin')
		);

		$this->load->model('tool/image');
		
		$news_total = $this->model_content_news->getTotalnewss($filter_data);
			
		$results = $this->model_content_news->getnewss($filter_data);
		
		$data['newss'] = array();
		
		foreach ($results as $result) {
			
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 40, 40);
			}

			$data['newss'][] = array(
				'news_id' => $result['news_id'],
				'image'      => $image,
				'date_modified'       => $result['date_modified'],
				'name'       => $result['name'],
				'status'     => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'edit'       => $this->url->link('content/news/update', 'token=' . $this->session->data['token'] . '&news_id=' . $result['news_id'] . $url, true)
			);
		}
		
		$this->load->model('content/cat');
		$data['categories'] = $this->model_content_cat->getCategories(0);
		 
		$data['filter_cat_id'] = $filter_category;
				
		$data['heading_title'] = $this->language->get('heading_title');		
				
		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');		
		$data['text_disabled'] = $this->language->get('text_disabled');		
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		
	    $data['column_category']  = $this->language->get('column_category');		
		$data['column_image'] = $this->language->get('column_image');		
		$data['column_name'] = $this->language->get('column_name');			
		$data['column_status'] = $this->language->get('column_status');		
		$data['column_action'] = $this->language->get('column_action');		
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_dated'] = $this->language->get('entry_dated');
		$data['entry_status'] = $this->language->get('entry_status');
		
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_copy'] = $this->language->get('button_copy');		
		$data['button_insert'] = $this->language->get('button_insert');		
		$data['button_delete'] = $this->language->get('button_delete');		
		$data['button_filter'] = $this->language->get('button_filter');
		
		$data['token'] = $this->session->data['token'];
		
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

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}
		
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . $this->request->get['filter_category'];
        }
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
								
		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
					
		$data['sort_name'] = $this->url->link('content/news', 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, true);
		
		$data['sort_status'] = $this->url->link('content/news', 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, true);
		
		$data['sort_order'] = $this->url->link('content/news', 'token=' . $this->session->data['token'] . '&sort=p.sort_order' . $url, true);
		
		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}
        
        if (isset($this->request->get['filter_category'])) {
            $url .= '&filter_category=' . $this->request->get['filter_category'];
        }

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $news_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('content/news', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);
		
		$data['pagination'] = $pagination->render();
		
		$data['results'] = sprintf($this->language->get('text_pagination'), ($news_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($news_total - $this->config->get('config_limit_admin'))) ? $news_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $news_total, ceil($news_total / $this->config->get('config_limit_admin')));
		
		$data['filter_name'] = $filter_name;
		$data['filter_status'] = $filter_status;
		
		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/news_list', $data));
  	}

  	protected function getForm() {
    	$data['heading_title'] = $this->language->get('heading_title');
	
		$data['text_form'] = !isset($this->request->get['news_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_list'] = $this->language->get('text_list');
    	$data['text_enabled'] = $this->language->get('text_enabled');
    	$data['text_disabled'] = $this->language->get('text_disabled');
    	$data['text_none'] = $this->language->get('text_none');
    	$data['text_yes'] = $this->language->get('text_yes');
    	$data['text_no'] = $this->language->get('text_no');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		
        /** download file **/
        $data['entry_filename'] = $this->language->get('entry_filename');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_additional_image'] = $this->language->get('entry_additional_image');
		$data['entry_download'] = $this->language->get('entry_download');		
    	$data['entry_date_available'] = $this->language->get('entry_date_available');
    	$data['entry_cat'] = $this->language->get('entry_cat');
		$data['entry_related'] = $this->language->get('entry_related');	
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_tag'] = $this->language->get('entry_tag');
		$data['entry_layout'] = $this->language->get('entry_layout');
				
		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_category'] = $this->language->get('help_category');
		$data['help_filter'] = $this->language->get('help_filter');
		$data['help_download'] = $this->language->get('help_download');
		$data['help_related'] = $this->language->get('help_related');
		$data['help_tag'] = $this->language->get('help_tag');		
				
    	$data['button_save'] = $this->language->get('button_save');
    	$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_image_add'] = $this->language->get('button_image_add');
		$data['button_remove'] = $this->language->get('button_remove');
		
    	$data['tab_general'] = $this->language->get('tab_general');
    	$data['tab_data'] = $this->language->get('tab_data');
    	$data['tab_image'] = $this->language->get('tab_image');		
		$data['tab_links'] = $this->language->get('tab_links');
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

 		if (isset($this->error['meta_description'])) {
			$data['error_meta_description'] = $this->error['meta_description'];
		} else {
			$data['error_meta_description'] = array();
		}		
   
   		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = array();
		}	
		
	
     	
		if (isset($this->error['date_available'])) {
			$data['error_date_available'] = $this->error['date_available'];
		} else {
			$data['error_date_available'] = '';
		}	

		$url = '';
        
          /* error _download */      
            if (isset($this->error['download'])) {
        			$data['error_download'] = $this->error['download'];
        		} else {
        			$data['error_download'] = '';
        		}
             if(isset($this->request->files['downloads'])){
                $data['filename'] = $this->request->files['downloads']['name'];
             }
              else{                
                $data['filename'] =  '';//$new_info['filename'];
              }  
          /** end download file */  
		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
								
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('content/news', 'token=' . $this->session->data['token'] . $url, 'SSL'),
   		);
									
		if (!isset($this->request->get['news_id'])) {
			$data['action'] = $this->url->link('content/news/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('content/news/update', 'token=' . $this->session->data['token'] . '&news_id=' . $this->request->get['news_id'] . $url, 'SSL');
		}
		
		$data['cancel'] = $this->url->link('content/news', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['news_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$news_info = $this->model_content_news->getnews($this->request->get['news_id']);
    	}

		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['news_description'])) {
			$data['news_description'] = $this->request->post['news_description'];
		} elseif (isset($this->request->get['news_id'])) {
			$data['news_description'] = $this->model_content_news->getnewsDescriptions($this->request->get['news_id']);
		} else {
			$data['news_description'] = array();
		}

		$this->load->model('setting/store');
		
		$data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['news_store'])) {
			$data['news_store'] = $this->request->post['news_store'];
		} elseif (isset($this->request->get['news_id'])) {
			$data['news_store'] = $this->model_content_news->getnewsStores($this->request->get['news_id']);
		} else {
			$data['news_store'] = array(0);
		}	
		
		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($news_info)) {
			$data['keyword'] = $news_info['keyword'];
		} else {
			$data['keyword'] = '';
		}
		
		if (isset($this->request->post['news_tag'])) {
			$data['news_tag'] = $this->request->post['news_tag'];
		} elseif (isset($this->request->get['news_id'])) {
			$data['news_tag'] = $this->model_content_news->getnewsTags($this->request->get['news_id']);
		} else {
			$data['news_tag'] = array();
		}
		
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($news_info)) {
			$data['image'] = $news_info['image'];
		} else {
			$data['image'] = '';
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($news_info) && is_file(DIR_IMAGE . $news_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($news_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
	    	
		// Images
		if (isset($this->request->post['news_image'])) {
			$news_images = $this->request->post['news_image'];
		} elseif (isset($this->request->get['news_id'])) {
			$news_images = $this->model_content_news->getnewsImages($this->request->get['news_id']);
		} else {
			$news_images = array();
		}
		
		$data['news_images'] = array();
		
		foreach ($news_images as $news_image) {
			if (is_file(DIR_IMAGE . $news_image['image'])) {
				$image = $news_image['image'];
				$thumb = $news_image['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}
			
			$data['news_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
				'sort_order' => $news_image['sort_order']
			);
		}
		
		if (isset($this->request->post['date_available'])) {
       		$data['date_available'] = $this->request->post['date_available'];
		} elseif (!empty($news_info)) {
			$data['date_available'] = date('Y-m-d', strtotime($news_info['date_available']));
		} else {
			$data['date_available'] = date('Y-m-d', time() - 86400);
		}
											
		if (isset($this->request->post['sort_order'])) {
      		$data['sort_order'] = $this->request->post['sort_order'];
    	} elseif (!empty($news_info)) {
      		$data['sort_order'] = $news_info['sort_order'];
    	} else {
			$data['sort_order'] = 1;
		}
		
        if (isset($news_info['filename'])) {
			$data['filename'] = $news_info['filename'];
		} else {
			$data['filename'] = '';
		}
           
    	if (isset($this->request->post['status'])) {
      		$data['status'] = $this->request->post['status'];
    	} elseif (!empty($news_info)) {
			$data['status'] = $news_info['status'];
		} else {
      		$data['status'] = 1;
    	}

		$this->load->model('catalog/download');
		
		$data['downloads'] = $this->model_catalog_download->getDownloads();
		
		if (isset($this->request->post['news_download'])) {
			$data['news_download'] = $this->request->post['news_download'];
		} elseif (isset($this->request->get['news_id'])) {
			$data['news_download'] = $this->model_content_news->getnewsDownloads($this->request->get['news_id']);
		} else {
			$data['news_download'] = array();
		}		

		$this->load->model('content/cat');		
		
		$data['categories'] = $this->model_content_cat->getCategories(0);
        
		if (isset($this->request->post['news_cat'])) {
			$data['news_cat'] = $this->request->post['news_cat'];
		} elseif (isset($this->request->get['news_id'])) {
			$data['news_cat'] = $this->model_content_news->getnewsCategories($this->request->get['news_id']);
		} else {
			$data['news_cat'] = array();
		}		
		
		if (isset($this->request->post['news_related'])) {
			$newss = $this->request->post['news_related'];
		} elseif (isset($this->request->get['news_id'])) {		
			$newss = $this->model_content_news->getnewsRelated($this->request->get['news_id']);
		} else {
			$newss = array();
		}
	
		$data['news_relateds'] = array();
		
		foreach ($newss as $news_id) {
			$related_info = $this->model_content_news->getnews($news_id);
			
			if ($related_info) {
				$data['news_relateds'][] = array(
					'news_id' => $related_info['news_id'],
					'name'       => $related_info['name']
				);
			}
		}
		
		if (isset($this->request->post['news_layout'])) {
			$data['news_layout'] = $this->request->post['news_layout'];
		} elseif (isset($this->request->get['news_id'])) {
			$data['news_layout'] = $this->model_content_news->getnewsLayouts($this->request->get['news_id']);
		} else {
			$data['news_layout'] = array();
		}

		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		$route = $this->request->get['route'];		
		
  		if($route == 'content/news/insert'){
			$news_max = $this->model_content_news->getnewsMax();
			if($news_max) {
				$data['now'] = ($news_max['news_id']+1) * ($news_max['news_id']+1);
			} else {
				$data['now'] = 1;
			}
  		} else {
  			$news_info = $this->model_content_news->getnews($this->request->get['news_id']);
  			$data['now'] = $news_info['news_id'] * $news_info['news_id'];
  		}									
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('content/news_form', $data));
  	} 
	
  	protected function validateForm() { 
    	if (!$this->user->hasPermission('modify', 'content/news')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

    	foreach ($this->request->post['news_description'] as $language_id => $value) {
      		if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
        		$this->error['name'][$language_id] = $this->language->get('error_name');
      		}
    	}
		
		 if ($this->request->files['downloads']['name']) {
                
    			if ((strlen(utf8_decode($this->request->files['downloads']['name'])) < 3) || (strlen(utf8_decode($this->request->files['downloads']['name'])) > 128)) {
            		$this->error['downloads'] = $this->language->get('error_filename');
    	  		}	  	
    			
    			if (substr(strrchr($this->request->files['downloads']['name'], '.'), 1) == 'php') {
           	   		$this->error['downloads'] = $this->language->get('error_filetype');
           		}	
    						
    			if ($this->request->files['downloads']['error'] != UPLOAD_ERR_OK) {
    				$this->error['warning'] = $this->language->get('error_upload_' . $this->request->files['downloads']['error']);
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
    	if (!$this->user->hasPermission('modify', 'content/news')) {
      		$this->error['warning'] = $this->language->get('error_permission');  
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
  	
  	protected function validateCopy() {
    	if (!$this->user->hasPermission('modify', 'content/news')) {
      		$this->error['warning'] = $this->language->get('error_permission');  
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
		
	public function autocomplete() {
		$json = array();
		
		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_cat_id'])) {
			$this->load->model('content/news');
			
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}
	
			if (isset($this->request->get['filter_cat_id'])) {
				$filter_cat_id = $this->request->get['filter_cat_id'];
			} else {
				$filter_cat_id = '';
			}
			
			if (isset($this->request->get['filter_sub_cat'])) {
				$filter_sub_cat = $this->request->get['filter_sub_cat'];
			} else {
				$filter_sub_cat = '';
			}
			
			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];	
			} else {
				$limit = 5;	
			}			
						
			$data_filter = array(
				'filter_name'         => $filter_name,
				'filter_cat_id'  => $filter_cat_id,
				'filter_sub_cat' => $filter_sub_cat,
				'start'               => 0,
				'limit'               => $limit
			);
			
			$results = $this->model_content_news->getnewss($data_filter);
			
			foreach ($results as $result) {
	
				$json[] = array(
					'news_id' => $result['news_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);	
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
    function changeTitle($str){
		$str = $this->stripUnicode($str);
		$str = str_replace("?","",$str);
		$str = str_replace("&","",$str);
		$str = str_replace("'","",$str);		
		$str = str_replace("  "," ",$str);
		$str = trim($str);
		$str = mb_convert_case($str , MB_CASE_LOWER , 'utf-8');
		// MB_CASE_UPPER/MB_CASE_TITLE/MB_CASE_LOWER
		$str = str_replace(" ","-",$str);	
		return $str;
	}//#end Changtitle
	
	function stripUnicode($str){
		if(!$str) return false;
		$unicode = array(
		 'a'=>'á|à|?|ã|?|a|?|?|?|?|?|â|?|?|?|?|?',
		 'A'=>'Á|À|?|Ã|?|A|?|?|?|?|?|Â|?|?|?|?|?',
		 'd'=>'d',
		 'D'=>'Ð',
		 'e'=>'é|è|?|?|?|ê|?|?|?|?|?',
		 'E'=>'É|È|?|?|?|Ê|?|?|?|?|?',
		 'i'=>'í|ì|?|i|?',	  
		 'I'=>'Í|Ì|?|I|?',
		 'o'=>'ó|ò|?|õ|?|ô|?|?|?|?|?|o|?|?|?|?|?',
		 'O'=>'Ó|Ò|?|Õ|?|Ô|?|?|?|?|?|O|?|?|?|?|?',
		 'u'=>'ú|ù|?|u|?|u|?|?|?|?|?',
		 'U'=>'Ú|Ù|?|U|?|U|?|?|?|?|?',
		 'y'=>'ý|?|?|?|?',
		 'Y'=>'Ý|?|?|?|?'
		);
		foreach($unicode as $khongdau=>$codau) {
		  $arr = explode("|",$codau);
		  $str = str_replace($arr,$khongdau,$str);
		}
		return $str;
	}
}
?>