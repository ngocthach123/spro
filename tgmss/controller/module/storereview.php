<?php

class ControllerModuleStoreReview extends Controller
{
    private $error = array();
    private $moduleName 			= 'storereview';
    private $moduleModel 			= 'model_review_store_review';
    private $moduleVersion 			= '1.3.6';

    public function index()
    {
        $this->load->language('module/'.$this->moduleName);

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/module');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (!isset($this->request->get['module_id'])) {
                $this->model_extension_module->addModule('storereview', $this->request->post);
                $module_id =  $this->db->getLastId();
            } else {
                $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
                $module_id =  $this->request->get['module_id'];
            }

            $this->session->data['success'] = $this->language->get('text_success');

            if(!$this->request->post['apply']){
                $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
            }else{
                $this->response->redirect($this->url->link('module/storereview', 'token='. $this->session->data['token'] . '&module_id=' . $module_id , 'SSL'));
            }
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_developer'] = $this->language->get('tab_developer');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['text_load_message'] = $this->language->get('text_load_message');
        $data['text_retry'] = $this->language->get('text_retry');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_layout'] = $this->language->get('entry_layout');
        $data['entry_order'] = $this->language->get('entry_order');
        $data['entry_limit'] = $this->language->get('entry_limit');
        $data['entry_text_limit'] = $this->language->get('entry_text_limit');
        $data['entry_button_all'] = $this->language->get('entry_button_all');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['entry_title'] = $this->language->get('entry_title');
        $data['entry_all_text'] = $this->language->get('entry_all_text');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_apply'] = $this->language->get('button_apply');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['error_message'] = $this->language->get('error_message');
        $data['error_no_message'] = $this->language->get('error_no_message');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        if (!isset($this->request->get['module_id'])) {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'). ' ' .$this->moduleVersion,
                'href' => $this->url->link('module/'.$this->moduleName, 'token=' . $this->session->data['token'], 'SSL')
            );
        } else {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'). ' ' .$this->moduleVersion,
                'href' => $this->url->link('module/'.$this->moduleName, 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
            );
        }

        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('module/'.$this->moduleName, 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $data['action'] = $this->url->link('module/'.$this->moduleName, 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
        }

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $data['token'] = $this->session->data['token'];

        if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
        }

        if (isset($this->request->post['name'])) {
            $data['name'] = $this->request->post['name'];
        } elseif (!empty($module_info)) {
            $data['name'] = $module_info['name'];
        } else {
            $data['name'] = '';
        }

        if (isset($this->request->post['order'])) {
            $data['order'] = $this->request->post['order'];
        } elseif (!empty($module_info)) {
            $data['order'] = $module_info['order'];
        } else {
            $data['order'] = '';
        }

        $data['token'] = $this->session->data['token'];


        if (isset($this->request->post['layout_id'])) {
            $data['layout_id'] = $this->request->post['layout_id'];
        } elseif (!empty($module_info)) {
            $data['layout_id'] = $module_info['layout_id'];
        } else {
            $data['layout_id'] = '';
        }

        if (isset($this->request->post['limit'])) {
            $data['limit'] = $this->request->post['limit'];
        } elseif (!empty($module_info)) {
            $data['limit'] = $module_info['limit'];
        } else {
            $data['limit'] = '3';
        }

        if (isset($this->request->post['text_limit'])) {
            $data['text_limit'] = $this->request->post['text_limit'];
        } elseif (!empty($module_info)) {
            $data['text_limit'] = $module_info['text_limit'];
        } else {
            $data['text_limit'] = '100';
        }

        if (isset($this->request->post['button_all'])) {
            $data['button_all'] = $this->request->post['button_all'];
        } elseif (!empty($module_info)) {
            $data['button_all'] = $module_info['button_all'];
        } else {
            $data['button_all'] = '1';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($module_info)) {
            $data['status'] = $module_info['status'];
        } else {
            $data['status'] = '1';
        }

        if (isset($this->request->post['module_description'])) {
            $data['module_description'] = $this->request->post['module_description'];
        } elseif (!empty($module_info)) {
            $data['module_description'] = $module_info['module_description'];
        } else {
            $data['module_description'] = '';
        }

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/storereview.tpl', $data));
    }

    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'module/'.$this->moduleName)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        return !$this->error;
    }

    public function install() {
        $this->load->model('review/store_review');

        $this->{$this->moduleModel}->install();
    }

    public function uninstall() {
        $this->load->model('review/store_review');
        $this->{$this->moduleModel}->uninstall();
    }

    public function getNotifications() {
        sleep(1);
        $this->load->model('review/store_review');
        $this->load->language('module/'.$this->moduleName);
        $response = $this->{$this->moduleModel}->getNotifications($this->moduleVersion);
        $json = array();
        $json['version'] = $this->moduleVersion;
        if ($response===false) {
            $json['message'] = '';
            $json['error'] = $this->language->get('error_message');
        } else {
            $json['message'] = $response;
            $json['error'] = '';
        }
        $this->response->setOutput(json_encode($json));
    }
}