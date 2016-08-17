<?php 
class ControllerContentCat extends Controller {  
	public function index() { 
		$this->load->language('content/cat');
		
		$this->load->model('content/cat');
		
		$this->load->model('content/news');
		
		$this->load->model('tool/image'); 
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}
					
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
   		);	

		if (isset($this->request->get['catid'])) {
			$catid = '';
		
			$parts = explode('_', (string)$this->request->get['catid']);
		
			foreach ($parts as $catid_id) {
				if (!$catid) {
					$catid = $catid_id;
				} else {
					$catid .= '_' . $catid_id;
				}									
				$cat_info = $this->model_content_cat->getcat($catid_id);
			
				if ($cat_info) {
	       			$data['breadcrumbs'][] = array(
   	    				'text'      => $cat_info['name'],
						'href'      => $this->url->link('content/cat', 'catid=' . $catid)
        			);
				}
			}		
		
			$catid = array_pop($parts);
		} else {
			$catid = 0;
		}
        
		$data['catidd'] = $catid ;
        
        
		$cat_info = $this->model_content_cat->getcat($catid);
	     
		if ($cat_info) {
	  		$this->document->setTitle($cat_info['name']);
			$this->document->setDescription($cat_info['meta_description']);
			$this->document->setKeywords($cat_info['meta_keyword']);
			
			$data['heading_title'] = $cat_info['name'];
			
			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');			
			$data['text_display'] = $this->language->get('text_display');
			$data['text_list'] = $this->language->get('text_list');
			$data['text_grid'] = $this->language->get('text_grid');
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');
					
			$data['button_continue'] = $this->language->get('button_continue');
			
			if ($cat_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($cat_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
			} else {
				$data['thumb'] = '';
			}
			
            if($cat_info['image']){
                $data['img'] = $cat_info['image'];
			}else {
			     $data['img']="";
			}   
                					
			$data['description'] = html_entity_decode($cat_info['description'], ENT_QUOTES, 'UTF-8');
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			} 
								
			$data['categories'] = array();
			
			$results = $this->model_content_cat->getCategories($catid);
            
			//print_r($results);exit;
			foreach ($results as $result) {
				$filter_data = array(
					'filter_catid'  => $result['cat_id'],
					'filter_sub_cat' => true	
				);
							
				$news_total = $this->model_content_news->getTotalnewss($filter_data);
				
				$data['categories'][] = array(
					'name'  => $result['name'],
					'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . '_' . $result['cat_id'] . $url)
				);
			}

			$data['newss'] = array();
			
			$filter_data = array(
				'filter_cat_id' 	=> 	$catid, 
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
	       
			$news_total = $this->model_content_news->getTotalnewss($filter_data); 
		   
			$results = $this->model_content_news->getnewss($filter_data);
			
            $dem= 0;
			foreach ($results as $result) {
				$dem ++;
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}
				
                if($result['date_added']){
				    $date = explode(" ",$result['date_added']);
                    $date1 = $date[0];
                    $date2 = $date[1];                    
				}
				
				$data['newss'][] = array(
					'news_id'  => $result['news_id'],
					'image'       => $image,
					'thumb'       => $image,
                    'cauhoithuonggap' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
                    'date1'       => $date1,
                    'date2'       => $date2,
                    'dem'       => $dem,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['meta_description'], ENT_QUOTES, 'UTF-8')), 0, 300) . '..',
                    'description1' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 700) . '..',
					'comments'     => sprintf($this->language->get('text_comments'), (int)$result['comments']),
					'href'        => $this->url->link('content/news','&catid=' . $catid .'&news_id=' . $result['news_id']),
				);
			}

			$url = '';
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
							
			$data['sorts'] = array();
			
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . '&sort=p.sort_order&order=ASC' . $url)
			);
			
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . '&sort=pd.name&order=DESC' . $url)
			);
			
			if ($this->config->get('config_comment_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . '&sort=rating&order=DESC' . $url)
				); 
				
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$url = '';
	
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$data['limits'] = array();
			
			$data['limits'][] = array(
				'text'  => $this->config->get('config_content_limit'),
				'value' => $this->config->get('config_content_limit'),
				'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . $url . '&limit=' . $this->config->get('config_content_limit'))
			);
						
			$data['limits'][] = array(
				'text'  => 25,
				'value' => 25,
				'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . $url . '&limit=25')
			);
			
			$data['limits'][] = array(
				'text'  => 50,
				'value' => 50,
				'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . $url . '&limit=50')
			);

			$data['limits'][] = array(
				'text'  => 75,
				'value' => 75,
				'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . $url . '&limit=75')
			);
			
			$data['limits'][] = array(
				'text'  => 100,
				'value' => 100,
				'href'  => $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . $url . '&limit=100')
			);
						
			$url = '';
	
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
					
			$pagination = new Pagination();
			$pagination->total = $news_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('content/cat', 'catid=' . $this->request->get['catid'] . $url . '&page={page}');
		
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($news_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($news_total - $limit)) ? $news_total : ((($page - 1) * $limit) + $limit), $news_total, ceil($news_total / $limit));
			
			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
			    $this->document->addLink($this->url->link('content/cat', 'catid=' . $cat_info['cat_id'], true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('content/cat', 'catid=' . $cat_info['cat_id'], true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('content/cat', 'catid=' . $cat_info['cat_id'] . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($news_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('content/cat', 'catid=' . $cat_info['cat_id'] . '&page='. ($page + 1), true), 'next');
			}
			
			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;
		
			$data['continue'] = $this->url->link('common/home');
			
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			$this->response->setOutput($this->load->view('content/cat', $data));
									
    	} else {
			$url = '';
			
			if (isset($this->request->get['catid'])) {
				$url .= '&catid=' . $this->request->get['catid'];
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
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('content/cat', $url)
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$data['heading_title'] = $this->language->get('text_error');

      		$data['text_error'] = $this->language->get('text_error');

      		$data['button_continue'] = $this->language->get('button_continue');

      		$data['continue'] = $this->url->link('common/home');
			
			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
			
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
  	}
}
?>