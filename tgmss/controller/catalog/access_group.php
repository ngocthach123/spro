<?php
class ControllerCatalogAccessGroup extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('catalog/access_group');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/access_group');

        $this->getList();
    }

    public function add() {
        $this->load->language('catalog/access_group');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/access_group');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_access_group->addAccessGroup($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/access_group', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('catalog/access_group');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/access_group');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_access_group->editAccessGroup($this->request->get['group_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/access_group', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('catalog/access_group');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/access_group');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $group_id) {
                $this->model_catalog_access_group->deleteAccessGroup($group_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/access_group', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'name';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

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
            'href' => $this->url->link('catalog/access_group', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('catalog/access_group/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('catalog/access_group/delete', 'token=' . $this->session->data['token'] . $url, true);

        $data['access_groups'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $attribute_total = $this->model_catalog_access_group->getTotalAccessGroups();

        $results = $this->model_catalog_access_group->getAccessGroups($filter_data);

        foreach ($results as $result) {
            $data['access_groups'][] = array(
                'group_id'    => $result['group_id'],
                'name'            => $result['name'],
                'edit'            => $this->url->link('catalog/access_group/edit', 'token=' . $this->session->data['token'] . '&group_id=' . $result['group_id'] . $url, true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_attribute_group'] = $this->language->get('column_attribute_group');
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

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('catalog/attribute', 'token=' . $this->session->data['token'] . '&sort=ad.name' . $url, true);
        $data['sort_attribute_group'] = $this->url->link('catalog/attribute', 'token=' . $this->session->data['token'] . '&sort=attribute_group' . $url, true);

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $attribute_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/access_group', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($attribute_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($attribute_total - $this->config->get('config_limit_admin'))) ? $attribute_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $attribute_total, ceil($attribute_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/access_group_list', $data));
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['group_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_access'] = $this->language->get('entry_access');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        }

        $url = '';

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
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/attribute', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['group_id'])) {
            $data['action'] = $this->url->link('catalog/access_group/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('catalog/access_group/edit', 'token=' . $this->session->data['token'] . '&group_id=' . $this->request->get['group_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('catalog/access_group', 'token=' . $this->session->data['token'] . $url, true);

        if (isset($this->request->get['group_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $access_group_info = $this->model_catalog_access_group->getAccessGroup($this->request->get['group_id']);
        }

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->request->post['product_access'])) {
            $products_access = $this->request->post['product_access'];
        } elseif (isset($this->request->get['group_id'])) {
            $products_access = $this->model_catalog_access_group->getProductAccess($this->request->get['group_id']);
        } else {
            $products_access = array();
        }

        $data['products_access'] = array();

        $this->load->model('catalog/product');

        foreach ($products_access as $product_id) {
            $access_info = $this->model_catalog_product->getProduct($product_id);

            if ($access_info) {
                $data['products_access'][] = array(
                    'product_id' => $access_info['product_id'],
                    'name'       => $access_info['name']
                );
            }
        }

        if (isset($this->request->post['group_name'])) {
            $data['group_name'] = $this->request->post['group_name'];
        } elseif (!empty($access_group_info)) {
            $data['group_name'] = $access_group_info['name'];
        } else {
            $data['group_name'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/access_form', $data));
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'catalog/attribute')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['group_name']) {
            $this->error['name'] = $this->language->get('error_name');
        }


        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'catalog/attribute')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}