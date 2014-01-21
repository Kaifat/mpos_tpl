<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

// Instantiate class, we are using mysqlng
$mysqli = new mysqli($config['db']['host'], $config['db']['user'], $config['db']['pass'], $config['db']['name'], $config['db']['port']);

/* check connection */
if (mysqli_connect_errno()) {
  die("Failed to connect to database");
}

/* изменение набора символов на utf8 */
if (!mysqli_set_charset($mysqli, "utf8")) {
    die("Failed to set charset utf-8");
}

?>
