<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
  die('Hacking attempt');

if (!$user->isAuthenticated()) {
    header("HTTP/1.1 404 Page not found");
    die("404 Page not found");
}

if (empty($_GET['username'])) {
    header("HTTP/1.1 404 Page not found");
    die("404 Page not found");
}

$username = $_GET['username'];

if (!$userId = $user->getUserId($username, true)) {
    header("HTTP/1.1 404 Page not found");
    die("404 Page not found");
}

if ($user->isAuthenticated() && $userId == $_SESSION['USERDATA']['id']) {
    $to = '/index.php?page=account&action=edit';
    $port = ($_SERVER["SERVER_PORT"] == "80" or $_SERVER["SERVER_PORT"] == "443") ? "" : (":".$_SERVER["SERVER_PORT"]);
    $location = @$_SERVER['HTTPS'] === true ? 'https://' . $_SERVER['SERVER_NAME'] . $port . $to : 'http://' . $_SERVER['SERVER_NAME'] . $port . $to;
    if (!headers_sent()) header('Location: ' . $location);
    exit('<meta http-equiv="refresh" content="0; url=' . htmlspecialchars($location) . '"/>');
}

$profileData = $user->getUserData($userId);

// Tempalte specifics
$smarty->assign("profileData", $profileData);
$smarty->assign("CONTENT", "default.tpl");
?>
