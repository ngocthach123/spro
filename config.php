<?php
// HTTP
define('HTTP_SERVER', 'http://spro.gg/');

// HTTPS
define('HTTPS_SERVER', 'http://spro.gg/');

// DIR
define('DIR_APPLICATION', 'E:\Work2\spro/catalog/');
define('DIR_SYSTEM', 'E:\Work2\spro/system/');
define('DIR_IMAGE', 'E:\Work2\spro/image/');
define('DIR_LANGUAGE', 'E:\Work2\spro/catalog/language/');
define('DIR_TEMPLATE', 'E:\Work2\spro/catalog/view/theme/');
define('DIR_CONFIG', 'E:\Work2\spro/system/config/');
define('DIR_CACHE', 'E:\Work2\spro/system/storage/cache/');
define('DIR_DOWNLOAD', 'E:\Work2\spro/system/storage/download/');
define('DIR_LOGS', 'E:\Work2\spro/system/storage/logs/');
define('DIR_MODIFICATION', 'E:\Work2\spro/system/storage/modification/');
define('DIR_UPLOAD', 'E:\Work2\spro/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'spro');
define('DB_PORT', '3306');
define('DB_PREFIX', 'tgm_');

define('positions', serialize(array(
    'tab_1' => array(
        'label' => 'Tab 1',
        'template' => false //you can use the same template file for several positions if you want
    ),
    'tab_2' => array(
        'label' => 'Tab 2',
        'template' => false //you can use the same template file for several positions if you want
    ),
    'tab_3' => array(
        'label' => 'Tab 3',
        'template' => false //you can use the same template file for several positions if you want
    ),
    'content_bottom_2' => array(
        'label' => 'Đáy nội dung 2',
        'template' => false //you can use the same template file for several positions if you want
    ),
    'footer_top' => array(
        'label' => 'Footer top',
        'template' => false //you can use the same template file for several positions if you want
    ),
    'header_top' => array(
        'label' => 'Header top',
        'template' => false //you can use the same template file for several positions if you want
    ),
    'col_right' => array(
        'label' => 'Banner phải',
        'template' => false //you can use the same template file for several positions if you want
    )
)));