<?php

// Make sure we are called from index.php
if (!defined('SECURITY')) die('Hacking attempt');

// Include additional file not set in autoloader
require_once(CLASS_DIR . '/tools.class.php');

function getCalcVal ($array,$currency) {
    foreach ($array as $item) {
        if($currency == $item[0])
            return $item;
    }
}

$calc = array();

$aData = $tools->getApi($config['price']['url'], $config['price']['target']);
$calc['DGC'] = getCalcVal($aData, 'DGC');
$calc['EAC'] = getCalcVal($aData, 'EAC');
$calc['DOGE'] = getCalcVal($aData, 'DOGE');
$calc['FST'] = getCalcVal($aData, 'FST');

$smarty->assign("CALC", $calc);
$smarty->assign("CONTENT", "default.tpl");

?>
