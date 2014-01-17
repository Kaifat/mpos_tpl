<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

$smarty->assign("SITESTRATUMURL", $config['faq']['stratumurl']);
$smarty->assign("SITESTRATUMPORT", $config['faq']['stratumport']);
$smarty->assign("SITECOINNAME", $config['faq']['coinname']);
$smarty->assign("SITECOINURL", $config['faq']['coinurl']);

// Tempalte specifics
$smarty->assign("CONTENT", "default.tpl");
?>
