<?php

// Make sure we are called from index.php
if (!defined('SECURITY')) die('Hacking attempt');

// Include additional file not set in autoloader
require_once(CLASS_DIR . '/tools.class.php');

function getCalcVal ($array,$currency) {
    foreach ($array as $item) {
        if($currency == $item['primarycode']) {
            return array(
                'price' => $item['recenttrades'][0]['price'],
                'difficulty' => 0.000,
                'reward' => 15
            );
        }
    }
}

$calc = array();

$aData = $tools->getApi($config['price']['url'], $config['price']['target']);
$calc['DGC'] = getCalcVal($aData['return']['markets'], 'DGC');
$calc['EAC'] = getCalcVal($aData['return']['markets'], 'EAC');
$calc['DOGE'] = getCalcVal($aData['return']['markets'], 'DOGE');
$calc['FST'] = getCalcVal($aData['return']['markets'], 'FST');

$smarty->assign("CALC", $calc);
$smarty->assign("CONTENT", "default.tpl");

?>
