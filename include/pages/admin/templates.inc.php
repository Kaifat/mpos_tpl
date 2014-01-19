<?php

// Make sure we are called from index.php
if (!defined('SECURITY')) die('Hacking attempt');

// Check user to ensure they are admin
if (!$user->isAuthenticated() || !$user->isAdmin($_SESSION['USERDATA']['id'])) {
  header("HTTP/1.1 404 Page not found");
  die("404 Page not found");
}

$aThemes = $template->getThemes();
$aTemplates = $template->getTemplatesTree($aThemes);
$aActiveTemplates = $template->cachedGetActiveTemplates();

$aFlatTemplatesList = array();
foreach($aThemes as $sTheme) {
  $templates = $template->getTemplateFiles($sTheme);
  $aFlatTemplatesList = array_merge($aFlatTemplatesList, $templates);
}

//Fetch current slug and template
$sTemplate = @$_REQUEST['template'];
if(!in_array($sTemplate, $aFlatTemplatesList)) {
  $sTemplate = $aFlatTemplatesList[0];
}

$sOriginalTemplate = $template->getTemplateContent($sTemplate);

if (@$_REQUEST['do'] == 'save') {
  if ($template->updateEntry(@$_REQUEST['template'], @$_REQUEST['content'], @$_REQUEST['active'])) {
    $_SESSION['POPUP'][] = array('CONTENT' => 'Page updated', 'TYPE' => 'success');
  } else {
    $_SESSION['POPUP'][] = array('CONTENT' => 'Page update failed: ' . $template->getError(), 'TYPE' => 'warning');
  }
}

$oDatabaseTemplate = $template->getEntry($sTemplate);

if ( $oDatabaseTemplate === false ) {
  $_SESSION['POPUP'][] = array('CONTENT' => 'Can\'t fetch template from Database. Have you created `templates` table? Run 005_create_templates_table.sql from sql folder', 'TYPE' => 'warning');
}

// prepare JSON for fuelux.tree.js
function prepareJson($files) {
    $res = array();
    foreach ($files as $file => $value) {
        $res[$file] = array();
        if (is_array($value)) {
            $res[$file]['type'] = 'folder';
            $res[$file]['name'] = $file;
            $res[$file]['additionalParameters'] = array(
                'children' => prepareJson($value)
            );
        } else {
            $res[$file]['name'] = '<i class="fa fa-file"></i>' . $file;
            $res[$file]['type'] = 'item';
        }
    }
    return $res;
}
$jsonTemplates = json_encode(prepareJson($aTemplates));

$smarty->assign("TEMPLATES", $aTemplates);
$smarty->assign("JSON_TEMPLATES", $jsonTemplates);
$smarty->assign("ACTIVE_TEMPLATES", $aActiveTemplates);
$smarty->assign("CURRENT_TEMPLATE", $sTemplate);
$smarty->assign("ORIGINAL_TEMPLATE", $sOriginalTemplate);
$smarty->assign("DATABASE_TEMPLATE", $oDatabaseTemplate);
$smarty->assign("CONTENT", "default.tpl");
?>
