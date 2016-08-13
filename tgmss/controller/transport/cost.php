<?php
class ControllerTransportCost extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('transport/cost');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('transport/cost');

        $this->getList();
    }

    protected function getList(){

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('transport/cost', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['delete'] = $this->url->link('transport/cost/delete', 'token=' . $this->session->data['token'] . $url, true);
        $data['add'] = $this->url->link('transport/cost', 'token=' . $this->session->data['token'], true);

        if (!isset($this->request->get['cost_id'])) {
            $data['action'] = $this->url->link('transport/cost/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('transport/cost/edit', 'token=' . $this->session->data['token']. '&cost_id=' . $this->request->get['cost_id'] . $url, true);
        }

        $data['costs'] = array();

        $filter_data = array(
            'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'           => $this->config->get('config_limit_admin'),
        );

        $product_total = $this->model_transport_cost->getTotalCosts($filter_data);

        $results = $this->model_transport_cost->getCosts($filter_data);

        foreach ($results as $result) {

            $data['costs'][] = array(
                'cost_id' => $result['id'],
                'loai_hang'       => $this->language->get("loai_hang_".$result['loai_hang']),
                'khoi_luong'      => $result['khoi_luong'],
                'gia_tri'      => $result['gia_tri'],
                'dai'   => $result['dai'],
                'rong'     => $result['rong'],
                'cao'     => $result['cao'],
                'van_chuyen'     =>  $this->language->get("van_chuyen_".$result['van_chuyen']),
                'gia_van_chuyen'     => $result['gia_van_chuyen'],
                'hang_van_chuyen'     => $this->language->get("hang_van_chuyen_".$result['hang_van_chuyen']),
                'edit'       => $this->url->link('transport/cost/edit', 'token=' . $this->session->data['token'] . '&cost_id=' . $result['id'] . $url, true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_stt'] = $this->language->get('column_stt');
        $data['column_loai_hang'] = $this->language->get('column_loai_hang');
        $data['column_khoi_luong'] = $this->language->get('column_khoi_luong');
        $data['column_gia_don_hang'] = $this->language->get('column_gia_don_hang');
        $data['column_kich_thuoc'] = $this->language->get('column_kich_thuoc');
        $data['column_van_chuyen'] = $this->language->get('column_van_chuyen');
        $data['column_don_vi'] = $this->language->get('column_don_vi');
        $data['column_gia_van_chuyen'] = $this->language->get('column_gia_van_chuyen');
        $data['column_hang'] = $this->language->get('column_hang');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_loai_hang'] = $this->language->get('entry_loai_hang');
        $data['entry_khoi_luong'] = $this->language->get('entry_khoi_luong');
        $data['entry_gia_don_hang'] = $this->language->get('entry_gia_don_hang');
        $data['entry_kich_thuoc'] = $this->language->get('entry_kich_thuoc');
        $data['entry_dai'] = $this->language->get('entry_dai');
        $data['entry_rong'] = $this->language->get('entry_rong');
        $data['entry_cao'] = $this->language->get('entry_cao');
        $data['entry_van_chuyen'] = $this->language->get('entry_van_chuyen');
        $data['entry_don_vi'] = $this->language->get('entry_don_vi');
        $data['entry_gia_van_chuyen'] = $this->language->get('entry_gia_van_chuyen');
        $data['entry_hang'] = $this->language->get('entry_hang');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

        //--------------------edit------------------------
        if (isset($this->request->get['cost_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $cost_info = $this->model_transport_cost->getCost($this->request->get['cost_id']);
        }

        if (isset($this->request->post['loai_hang'])) {
            $data['loai_hang'] = $this->request->post['loai_hang'];
        } elseif (!empty($cost_info)) {
            $data['loai_hang'] = $cost_info['loai_hang'];
        } else {
            $data['loai_hang'] = 0;
        }

        if (isset($this->request->post['khoi_luong'])) {
            $data['khoi_luong'] = $this->request->post['khoi_luong'];
        } elseif (!empty($cost_info)) {
            $data['khoi_luong'] = $cost_info['khoi_luong'];
        } else {
            $data['khoi_luong'] = '';
        }

        if (isset($this->request->post['gia_don_hang'])) {
            $data['gia_don_hang'] = $this->request->post['gia_don_hang'];
        } elseif (!empty($cost_info)) {
            $data['gia_don_hang'] = $cost_info['gia_tri'];
        } else {
            $data['gia_don_hang'] = '';
        }

        if (isset($this->request->post['dai'])) {
            $data['dai'] = $this->request->post['dai'];
        } elseif (!empty($cost_info)) {
            $data['dai'] = $cost_info['dai'];
        } else {
            $data['dai'] = '';
        }

        if (isset($this->request->post['rong'])) {
            $data['rong'] = $this->request->post['rong'];
        } elseif (!empty($cost_info)) {
            $data['rong'] = $cost_info['rong'];
        } else {
            $data['rong'] = '';
        }

        if (isset($this->request->post['cao'])) {
            $data['cao'] = $this->request->post['cao'];
        } elseif (!empty($cost_info)) {
            $data['cao'] = $cost_info['cao'];
        } else {
            $data['cao'] = '';
        }

        if (isset($this->request->post['van_chuyen'])) {
            $data['van_chuyen'] = $this->request->post['van_chuyen'];
        } elseif (!empty($cost_info)) {
            $data['van_chuyen'] = $cost_info['van_chuyen'];
        } else {
            $data['van_chuyen'] = 0;
        }

        if (isset($this->request->post['gia_van_chuyen'])) {
            $data['gia_van_chuyen'] = $this->request->post['gia_van_chuyen'];
        } elseif (!empty($cost_info)) {
            $data['gia_van_chuyen'] = $cost_info['gia_van_chuyen'];
        } else {
            $data['gia_van_chuyen'] = '';
        }

        if (isset($this->request->post['hang_van_chuyen'])) {
            $data['hang_van_chuyen'] = $this->request->post['hang_van_chuyen'];
        } elseif (!empty($cost_info)) {
            $data['hang_van_chuyen'] = $cost_info['hang_van_chuyen'];
        } else {
            $data['hang_van_chuyen'] = 0;
        }

        //--------------------edit------------------------

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

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('transport/cost.tpl', $data));
    }

    public function add() {
        $this->load->language('transport/cost');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('transport/cost');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

            $this->model_transport_cost->addCost($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('transport/cost', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    public function edit() {
        $this->load->language('transport/cost');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('transport/cost');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_transport_cost->editCost($this->request->get['cost_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('transport/cost', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    public function delete() {
        $this->load->language('transport/cost');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('transport/cost');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {

            foreach ($this->request->post['selected'] as $cost_id) {
                $this->model_transport_cost->deleteCost($cost_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('transport/cost', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'transport/cost')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!is_numeric($this->request->post['khoi_luong'])) {
            $this->error['warning'] = $this->language->get('error_value');
        }

        if (!is_numeric($this->request->post['gia_don_hang'])) {
            $this->error['warning'] = $this->language->get('error_value');
        }

        if (!is_numeric($this->request->post['gia_van_chuyen'])) {
            $this->error['warning'] = $this->language->get('error_value');
        }

        if ((utf8_strlen($this->request->post['khoi_luong']) < 1) || (utf8_strlen($this->request->post['khoi_luong']) > 64)) {
            $this->error['warning'] = $this->language->get('error_empty');
        }

        if ((utf8_strlen($this->request->post['gia_don_hang']) < 1) || (utf8_strlen($this->request->post['gia_don_hang']) > 64)) {
            $this->error['warning'] = $this->language->get('error_empty');
        }

        if ((utf8_strlen($this->request->post['gia_van_chuyen']) < 1) || (utf8_strlen($this->request->post['gia_van_chuyen']) > 64)) {
            $this->error['warning'] = $this->language->get('error_empty');
        }

        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'transport/cost')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}