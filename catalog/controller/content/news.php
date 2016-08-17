<?php  
class ControllerContentNews extends Controller {
	private $error = array(); 
	
	public function index() { 
		$this->load->language('content/news');
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('content/cat');	

		if (isset($this->request->get['catid'])) {
			
			$catid = '';

			foreach (explode('_', $this->request->get['catid']) as $catid_id) {
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
		} else {
			$catid = '';
			$cat_id = 0;
		}
		
		$data['catid'] = $catid;

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_tag'])) {

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}

			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}

			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}

			if (isset($this->request->get['filter_catid'])) {
				$url .= '&filter_catid=' . $this->request->get['filter_catid'];
			}	

			$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('content/search', $url)
			);	
		}

		if (isset($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}

		$this->load->model('content/news');

		$this->load->model('tool/image');

		$news_info = $this->model_content_news->getnews($news_id);

        $arrcat_id = $this->model_content_news->getCategories($news_id);

		/* tin tuc cung danh muc */
		// tin tuc lien quan
      	$datalienquan = array(
			'filter_cat_id' => 	$catid, 
            'start' => 0,
            'limit' => 16
		);

		$tintuclienquan = $this->model_content_news->getnewss($datalienquan);

		foreach($tintuclienquan as $tinlq){
			$data['tinlienquan'][] = array(
				'name'    	 => $tinlq['name'],
				'href'    	 => $this->url->link('content/news','&catid=' . $catid .'&news_id=' . $tinlq['news_id'])
			);
		}
		// het tin tuc lien quan 
		
		foreach($arrcat_id as $cat){
			$cat_id = $cat['cat_id'];
		}

		$data['newss'] = array();
		
		if(isset($cat_id)) {
			$cat_id = $cat_id;
		} else {
			$cat_id = 0;
		}
		
		$filter_data = array(
			'filter_cat_id' 	=> 	$cat_id, 
		);

		$news_total = $this->model_content_news->getTotalnewss($filter_data); 
   
		$results = $this->model_content_news->getnewss($filter_data);

		$data['news_info'] = $news_info;

		if ($news_info) {
			
			$url = '';

			if (isset($this->request->get['catid'])) {
				$url .= '&catid=' . $this->request->get['catid'];
			}		

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}

			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}

			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}	

			if (isset($this->request->get['filter_catid'])) {
				$url .= '&filter_catid=' . $this->request->get['filter_catid'];
			}
								
			$data['breadcrumbs'][] = array(
				'text'      => $news_info['name'],
				'href'      => $this->url->link('content/news',  '&news_id=' . $this->request->get['news_id'])
			);			

			$this->document->setTitle($news_info['name']);

			$this->document->setDescription($news_info['meta_description']);

			$this->document->setKeywords($news_info['meta_keyword']);

			$this->document->addLink($this->url->link('content/news', 'news_id=' . $this->request->get['news_id']), 'canonical');
			
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

			$data['heading_title'] = $news_info['name'];
			
			$data['text_share'] = $this->language->get('text_share');
			$data['text_wait'] = $this->language->get('text_wait');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_write'] = $this->language->get('text_write');
			$data['text_note'] = $this->language->get('text_note');
			$data['text_related'] = $this->language->get('text_related');

			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_comment'] = $this->language->get('entry_comment');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('content/comment');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_comment'] = sprintf($this->language->get('tab_comment'), $this->model_content_comment->getTotalcommentsBynewsId($this->request->get['news_id']));
			$data['tab_related'] = $this->language->get('tab_related');
			$data['news_id'] = (int)$this->request->get['news_id'];

			$this->load->model('tool/image');
			
			if ($news_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($news_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = '';
			}
			
			if ($news_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($news_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
			} else {
				$data['thumb'] = '';
			}

            /* download */
            if (file_exists(DIR_DOWNLOAD . $news_info['filename'])) {
				$size = filesize(DIR_DOWNLOAD . $news_info['filename']);
    			$i = 0;
				$suffix = array(
					'B',
    				'KB',
    				'MB',
    				'GB',
    				'TB',
    				'PB',
    				'EB',
    				'ZB',
    				'YB'
    			);
				while (($size / 1024) > 1) {
					$size = $size / 1024;
    				$i++;
    			}
			}

			if(isset($news_info['filename'])){
				$data['hreldownload'] = $this->url->link('content/download', 'news_id='.$news_info['news_id']);
				$data['filename'] = $news_info['filename'];
				$data['text_download'] = $this->language->get('text_download');
			}  

			$data['images'] = array();
			
			$results = $this->model_content_news->getnewsImages($this->request->get['news_id']);
			
			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
				);
			}
			
			$data['comment_status'] = $this->config->get('config_review_status');

			$data['comments'] = sprintf($this->language->get('text_comments'), (int)$news_info['comments']);

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}
			
			$data['share'] = $this->url->link('content/news', 'news_id=' . (int)$this->request->get['news_id']);
			
			$data['description'] = html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8');
            $data['name'] = $news_info['name'];

            if($news_info['date_added']){
				$date= explode(" ",$news_info['date_added']);
                $date1 = $date[0];
                $date2 = $date[1];                    
			}
			
            $data['date1']  = $date1;
			$data['date2']  = $date2;
            $data['href_page'] = $this->url->link('content/news', '&news_id=' . $news_info['news_id']);
			$data['newss'] = array();
			
			$results = $this->model_content_news->getnewsRelated($this->request->get['news_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->config->get('config_comment_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
		
				$data['newss'][] = array(
					'news_id' => $result['news_id'],
					'image'   	 => $result['image'],
					'thumb'   	 => $image,
					'name'    	 => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'rating'     => $rating,
					'comments'    => sprintf($this->language->get('text_comments'), (int)$result['comments']),
					'href'    	 => $this->url->link('content/news', 'news_id=' . $result['news_id']),
				);
			}	
		
			$data['tags'] = array();

			$results = $this->model_content_news->getnewsTags($this->request->get['news_id']);

			foreach ($results as $result) {
				$data['tags'][] = array(
					'tag'  => $result['tag'],
					'href' => $this->url->link('content/search', 'filter_tag=' . $result['tag'])
				);
			}

			$this->model_content_news->updateViewed($this->request->get['news_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('content/news', $data));
		} else {

			$url = '';

			if (isset($this->request->get['catid'])) {
				$url .= '&catid=' . $this->request->get['catid'];
			}		

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}	

			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}

			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}

			if (isset($this->request->get['filter_catid'])) {
				$url .= '&filter_catid=' . $this->request->get['filter_catid'];
			}

      		$data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('content/news', '&news_id=' . $news_id)
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

	public function comment() {
    	$this->load->language('content/news');

		$this->load->model('content/comment');

		$data['text_no_comments'] = $this->language->get('text_no_comments');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  
		
		$data['comments'] = array();

		$comment_total = $this->model_content_comment->getTotalcommentsBynewsId($this->request->get['news_id']);
		
		$results = $this->model_content_comment->getcommentsBynewsId($this->request->get['news_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
        	$data['comments'][] = array(
        		'author'     => $result['author'],
				'text'       => $result['text'],
				'rating'     => (int)$result['rating'],
        		'comments'    => sprintf($this->language->get('text_comments'), (int)$comment_total),
        		'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
        	);
      	}			

		$pagination = new Pagination();
		$pagination->total = $comment_total;
		$pagination->page = $page;
		$pagination->limit = 5; 
		$pagination->url = $this->url->link('content/news/comment', 'news_id=' . $this->request->get['news_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();
		
		$data['results'] = sprintf($this->language->get('text_pagination'), ($comment_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($comment_total - 5)) ? $comment_total : ((($page - 1) * 5) + 5), $comment_total, ceil($comment_total / 5));

		$this->response->setOutput($this->load->view('content/comment', $data));
	}

	public function write() {
		$this->load->language('content/news');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (!$this->request->post['rating']) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}
			
			if (!isset($json['error'])) {
				$this->load->model('content/comment');
				$this->model_content_comment->addcomment($this->request->get['news_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function upload() {
		$this->load->language('content/news');

		$json = array();

		if (!empty($this->request->files['file']['name'])) {
			$filename = basename(html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8'));
			if ((strlen($filename) < 3) || (strlen($filename) > 128)) {
        		$json['error'] = $this->language->get('error_filename');
	  		}	  	

			$allowed = array();

			$filetypes = explode(',', $this->config->get('config_upload_allowed'));

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
       		}	

			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}

		if (!$json) {
			if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
				$file = basename($filename) . '.' . md5(rand());

				// Hide the uploaded file name so people can not link to it directly.
				$json['file'] = $this->encryption->encrypt($file);

				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);
			}

			$json['success'] = $this->language->get('text_upload');
		}	
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));		
	}
}
?>