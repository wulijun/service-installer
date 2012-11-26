<?php
date_default_timezone_set("Asia/Shanghai");
define('SSI_ROOT_PATH' , dirname(__FILE__) . '/..');
define('SSI_REQUEST_ID', ((ip2long($_SERVER['SERVER_ADDR']) << 31 ) + (intval(gettimeofday(true) * 100000) & 0x7FFFFFFF)));

$strUrl = strip_tags($_SERVER['REQUEST_URI']);
$arrUrl = explode('/', $strUrl);
if (! isset($arrUrl[1])) {
	echo 'Access Deny!';
	exit(0);
}
$strModule = $arrUrl[1];
$strConf = SSI_ROOT_PATH . "/{$strModule}/index.php";
if (! file_exists($strConf)) {
	echo 'Access Deny!';
	exit(0);
}

define('SSI_APP_NAME', $strModule);
define('SSI_SRC_PATH', realpath(SSI_ROOT_PATH . '/' . SSI_APP_NAME));
define('SSI_PHP5_PATH', realpath(SSI_ROOT_PATH . '/../php5'));

if ($_GET['xhprof'] == 1) {
    if (! extension_loaded('xhprof')) {
        dl('xhprof.so');
    }
    
    xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY);
    //xhprof_enable(XHPROF_FLAGS_NO_BUILTINS);
}

require $strConf;

if ($_GET['xhprof'] == 1) {
    $xhprof_data = xhprof_disable();

    /**
     * 如果只有一台服务器，则可以用下面这种原生的方式显示结果，如果有多台服务器，则保存的结果文件只在
     * 一台服务器上，点击链接后可能落在另外一台服务器，从而显示不了结果。为了避免这个问题，默认直接
     * 把结果显示在页面下方。    
    include_once SSI_ROOT_PATH . "/webroot/xhprof_lib/utils/xhprof_lib.php";
    include_once SSI_ROOT_PATH . "/webroot/xhprof_lib/utils/xhprof_runs.php";
    $xhprof_runs = new XHProfRuns_Default();
    $xhprofid = $xhprof_runs->save_run($xhprof_data, "xhprof");
    echo "<a target='_blank' href='/xhprof_html/index.php?run={$xhprofid}&source=xhprof>xhprof</a>"; */
    
    include_once SSI_ROOT_PATH . "/webroot/xhprof_html/index_inline.php";
}
