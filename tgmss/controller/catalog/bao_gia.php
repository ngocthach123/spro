<?php
// include autoloader
require_once 'dompdf/autoload.inc.php';
use Dompdf\Dompdf;
use Dompdf\Options;

class ControllerCatalogBaoGia extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('catalog/bao_gia');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/bao_gia');

        $this->getList();
    }

    public function exportpdf(){
        $this->load->model('catalog/bao_gia');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        $this->load->model('user/user');

        if (isset($this->request->get['report_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $data['report_info'] = $this->model_catalog_bao_gia->getReport($this->request->get['report_id']);
            $data['report_info']['date_added'] = date('d-m-Y',strtotime($data['report_info']['date_added']));
            $data['user'] = $this->model_user_user->getUser($data['report_info']['user_id']);

            $data['owner']=$this->config->get('config_owner');
            $data['name']=$this->config->get('config_name');
            $data['address'] = $this->config->get('config_address');
            $data['phone'] = $this->config->get('config_telephone');
            $data['email'] = $this->config->get('config_email');
            $data['fax'] = $this->config->get('config_fax');

            $products = $this->model_catalog_bao_gia->getProductReports($this->request->get['report_id']);

            foreach ($products as $product) {
                $product_info = $this->model_catalog_product->getProduct($product['product_id']);
                $price = $product_info['special'] ? $product_info['special'] : $product_info['price'];
                $sub_total = (int)$product['quantity']* (int)$price;
                if ($product_info) {
                    $data['products'][] = array(
                        'product_id' => $product_info['product_id'],
                        'name'       => $product_info['name'],
                        'price'       =>$this->currency->format($price, $this->session->data['currency']),
                        'image'     =>  $this->model_tool_image->resize($product_info['image'], 100, 100,1),
                        'quantity'  =>$product['quantity'],
                        'sub_total' => $this->currency->format($sub_total, $this->session->data['currency']),
                        'specs' => html_entity_decode($product_info['specs']),
                    );
                }
            }

//            $this->response->setOutput($this->load->view('catalog/form_report', $data));
            // instantiate and use the dompdf class

            $dompdf = new Dompdf(array('enable‌​_remote' => true));
            $html = $this->load->view('catalog/form_report',$data);

            $html = mb_convert_encoding($html, 'HTML-ENTITIES', 'UTF-8');

            $dompdf->loadHtml($html);

// (Optional) Setup the paper size and orientation
            $dompdf->setPaper('A4', 'portrait');

// Render the HTML as PDF
            $dompdf->render();

// Output the generated PDF to Browser
            $dompdf->stream("Bao_gia");

        }
    }

    public function exportexcel(){
        if (isset($this->request->get['report_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {

            require_once 'phpexcel/PHPExcel.php';

            $this->load->model('catalog/bao_gia');
            $this->load->model('catalog/product');
            $this->load->model('tool/image');

            $data['report_info'] = $this->model_catalog_bao_gia->getReport($this->request->get['report_id']);
            $products = $this->model_catalog_bao_gia->getProductReports($this->request->get['report_id']);

            $data['products'] = array();

            foreach ($products as $product) {
                $product_info = $this->model_catalog_product->getProduct($product['product_id']);
                $price = $product_info['special'] ? $product_info['special'] : $product_info['price'];
                $sub_total = (int)$product['quantity']* (int)$price;
                if ($product_info) {
                    $data['products'][] = array(
                        'product_id' => $product_info['product_id'],
                        'name'       => $product_info['name'],
                        'price'       =>$this->currency->format($price, $this->session->data['currency']),
                        'image'     =>  $this->model_tool_image->resize($product_info['image'], 100, 100,1),
                        'quantity'  =>$product['quantity'],
                        'sub_total' => $this->currency->format($sub_total, $this->session->data['currency']),
                        'specs' => html_entity_decode($product_info['specs']),
                    );
                }
            }

                $objPHPExcel = new PHPExcel();

                $objPHPExcel->setActiveSheetIndex(0)
                    ->setCellValue('A1', 'STT')
                    ->setCellValue('B1', 'Tên thiết bị, thông số kỹ thuật')
                    ->setCellValue('C1', 'Số lượng')
                    ->setCellValue('D1', 'Đơn giá (VNĐ)')
                    ->setCellValue('E1', 'Thành tiền (VNĐ)')
                    ->setCellValue('F1', 'Hình ảnh thiết bị');


                //set gia tri cho cac cot du lieu
                $i = 2;
                foreach ($data['products'] as $row) {
                    $objPHPExcel->setActiveSheetIndex(0)
                        ->setCellValue('A' . $i, $i)
                        ->setCellValue('B' . $i, $row['specs'])
                        ->setCellValue('C' . $i, $row['quantity'])
                        ->setCellValue('D' . $i, $row['price'])
                        ->setCellValue('E' . $i, $row['sub_total']);

                    if ($row['image'] != '') {

                        $objDrawing = new PHPExcel_Worksheet_Drawing();    //create object for Worksheet drawing

                        $objDrawing->setName('Customer Signature');        //set name to image
                        $objDrawing->setDescription('Customer Signature'); //set description to image
                        $objDrawing->setPath($row['image']); //var_dump(DIR_IMAGE.$row['image1'].$row['STT']);
                        $objDrawing->setOffsetX(25);                       //setOffsetX works properly
                        $objDrawing->setOffsetY(10);                       //setOffsetY works properly
                        $objDrawing->setCoordinates('F' . $i);        //set image to cell
                        $objDrawing->setWidth(100);                 //set width, height
                        $objDrawing->setHeight(100);

                        $objDrawing->setWorksheet($objPHPExcel->getActiveSheet());  //save

                        $objPHPExcel->getActiveSheet()->getRowDimension($i)->setRowHeight(100);
                    }

                    $i++;
                }
                $styleArray = array(
                    'font' => array(
                        'bold' => true,
                        'startcolor' => array('rgb' => 'f5f5f5'),
                    ));

                $objPHPExcel->getActiveSheet()->getStyle('A1:F1')->applyFromArray($styleArray);

                $style = array(
                    'alignment' => array(
                        'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                        'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
                    )
                );

                $objPHPExcel->getDefaultStyle()->applyFromArray($style);

                foreach (range('A', $objPHPExcel->getActiveSheet()->getHighestDataColumn()) as $col) { //tu dong chinh do rong column
                    $objPHPExcel->getActiveSheet()
                        ->getColumnDimension($col)
                        ->setAutoSize(true);
                }

            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(false);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(50);
            //ghi du lieu vao file,định dạng file excel 2007
                $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
                //		$full_path = 'data.xlsx';//duong dan file
                //		$objWriter->save($full_path);
                // We'll be outputting an excel file
                header('Content-type: application/vnd.ms-excel');
                // It will be called file.xls
                header('Content-Disposition: attachment; filename="Bao_gia.xlsx"');
                // Write file to the browser
                $objWriter->save('php://output');
        }//endif
    }

    public function add() {
        $this->load->language('catalog/bao_gia');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/bao_gia');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $data_post = $this->request->post;
            $data_post['user_id'] = $this->user->getId();

            $this->model_catalog_bao_gia->addReport($data_post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/bao_gia', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('catalog/bao_gia');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/bao_gia');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $data_post = $this->request->post;
            $data_post['user_id'] = $this->user->getId();

            if(isset($this->request->get['report_id'])) {
                $this->model_catalog_bao_gia->editReport($this->request->get['report_id'], $data_post);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/bao_gia', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('catalog/bao_gia');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/bao_gia');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $report_id) {
                $this->model_catalog_bao_gia->deleteReport($report_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/bao_gia', 'token=' . $this->session->data['token'] . $url, true));
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
            'href' => $this->url->link('catalog/bao_gia', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('catalog/bao_gia/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('catalog/bao_gia/delete', 'token=' . $this->session->data['token'] . $url, true);

        $data['reports'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $report_total = $this->model_catalog_bao_gia->getTotalReports();

        $results = $this->model_catalog_bao_gia->getReports($filter_data);

        foreach ($results as $result) {
            $data['reports'][] = array(
                'id'    => $result['id'],
                'customer'            => $result['customer'],
                'phone'            => $result['phone'],
                'email'            => $result['email'],
                'report_code'            => $result['report_code'],
                'date_added'            => date('d-m-Y',strtotime($result['date_added'])),
                'edit'            => $this->url->link('catalog/bao_gia/edit', 'token=' . $this->session->data['token'] . '&report_id=' . $result['id'] . $url, true),
                'exportpdf'            => $this->url->link('catalog/bao_gia/exportpdf', 'token=' . $this->session->data['token'] . '&report_id=' . $result['id'] . $url, true),
                'exportexcel'            => $this->url->link('catalog/bao_gia/exportexcel', 'token=' . $this->session->data['token'] . '&report_id=' . $result['id'] . $url, true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_customer'] = $this->language->get('column_customer');
        $data['column_report_code'] = $this->language->get('column_report_code');
        $data['column_phone'] = $this->language->get('column_phone');
        $data['column_email'] = $this->language->get('column_email');
        $data['column_date'] = $this->language->get('column_date');
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
        $pagination->total = $report_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/bao_gia', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($report_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($report_total - $this->config->get('config_limit_admin'))) ? $report_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $report_total, ceil($report_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/bao_gia_list', $data));
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['report_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['entry_customer'] = $this->language->get('entry_customer');
        $data['entry_work_place'] = $this->language->get('entry_work_place');
        $data['entry_address'] = $this->language->get('entry_address');
        $data['entry_phone'] = $this->language->get('entry_phone');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_report_code'] = $this->language->get('entry_report_code');
        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_quantity'] = $this->language->get('entry_quantity');

        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_product'] = $this->language->get('column_product');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_desc'] = $this->language->get('column_desc');

        $data['tab_customer'] = $this->language->get('tab_customer');
        $data['tab_product'] = $this->language->get('tab_product');

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
            'href' => $this->url->link('catalog/bao_gia', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['report_id'])) {
            $data['action'] = $this->url->link('catalog/bao_gia/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('catalog/bao_gia/edit', 'token=' . $this->session->data['token'] . '&report_id=' . $this->request->get['report_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('catalog/bao_gia', 'token=' . $this->session->data['token'] . $url, true);

        if (isset($this->request->get['report_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $price_report_info = $this->model_catalog_bao_gia->getReport($this->request->get['report_id']);
        }

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->request->post['product_rp_id'])) {
            $products = $this->request->post['product_rp_id'];
        } elseif (isset($this->request->get['report_id'])) {
            $products = $this->model_catalog_bao_gia->getProductReports($this->request->get['report_id']);
        } else {
            $products= array();
        }

        $data['products'] = array();

        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        foreach ($products as $product) {
            $product_info = $this->model_catalog_product->getProduct($product['product_id']);

            if ($product_info) {
                $data['products'][] = array(
                    'product_id' => $product_info['product_id'],
                    'name'       => $product_info['name'],
                    'price'       =>$this->currency->format($product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']),
                    'image'     =>  $this->model_tool_image->resize($product_info['image'], 40, 40),
                    'quantity'  =>$product['quantity'],
                    'specs' => html_entity_decode($product_info['specs']),
                );
            }
        }

        if (isset($this->request->post['customer'])) {
            $data['customer'] = $this->request->post['customer'];
        } elseif (!empty($price_report_info)) {
            $data['customer'] = $price_report_info['customer'];
        } else {
            $data['customer'] = '';
        }

        if (isset($this->request->post['report_code'])) {
            $data['report_code'] = $this->request->post['report_code'];
        } elseif (!empty($price_report_info)) {
            $data['report_code'] = $price_report_info['report_code'];
        } else {
            $data['report_code'] = '';
        }

        if (isset($this->request->post['address'])) {
            $data['address'] = $this->request->post['address'];
        } elseif (!empty($price_report_info)) {
            $data['address'] = $price_report_info['address'];
        } else {
            $data['address'] = '';
        }

        if (isset($this->request->post['phone'])) {
            $data['phone'] = $this->request->post['phone'];
        } elseif (!empty($price_report_info)) {
            $data['phone'] = $price_report_info['phone'];
        } else {
            $data['phone'] = '';
        }

        if (isset($this->request->post['email'])) {
            $data['email'] = $this->request->post['email'];
        } elseif (!empty($price_report_info)) {
            $data['email'] = $price_report_info['email'];
        } else {
            $data['email'] = '';
        }

        if (isset($this->request->post['work_place'])) {
            $data['work_place'] = $this->request->post['work_place'];
        } elseif (!empty($price_report_info)) {
            $data['work_place'] = $price_report_info['work_place'];
        } else {
            $data['work_place'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/bao_gia_form', $data));
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'catalog/bao_gia')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['report_code']) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        if (!$this->request->post['customer']) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'catalog/bao_gia')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}