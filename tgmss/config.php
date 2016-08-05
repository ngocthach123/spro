<?php
// HTTP
define('HTTP_SERVER', 'http://spro.gg/tgmss/');
define('HTTP_CATALOG', 'http://spro.gg/');

// HTTPS
define('HTTPS_SERVER', 'http://spro.gg/tgmss/');
define('HTTPS_CATALOG', 'http://spro.gg/');

// DIR
define('DIR_APPLICATION', 'E:\Work2\spro/tgmss/');
define('DIR_SYSTEM', 'E:\Work2\spro/system/');
define('DIR_IMAGE', 'E:\Work2\spro/image/');
define('DIR_LANGUAGE', 'E:\Work2\spro/tgmss/language/');
define('DIR_TEMPLATE', 'E:\Work2\spro/tgmss/view/template/');
define('DIR_CONFIG', 'E:\Work2\spro/system/config/');
define('DIR_CACHE', 'E:\Work2\spro/system/storage/cache/');
define('DIR_DOWNLOAD', 'E:\Work2\spro/system/storage/download/');
define('DIR_LOGS', 'E:\Work2\spro/system/storage/logs/');
define('DIR_MODIFICATION', 'E:\Work2\spro/system/storage/modification/');
define('DIR_UPLOAD', 'E:\Work2\spro/system/storage/upload/');
define('DIR_CATALOG', 'E:\Work2\spro/catalog/');
define('DIR_EXCEL', 'E:\Work2\spro/tgmss/excel/');

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
    'footer_top' => array(
        'label' => 'Footer top',
        'template' => false //you can use the same template file for several positions if you want
    )
)));
