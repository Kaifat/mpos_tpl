<?php

// Make sure we are called from index.php
if (!defined('SECURITY')) die('Hacking attempt');

if (!empty($_GET['provider'])) {
    // change the following paths if necessary
    $configHybrid_Auth = BASEPATH . 'hybridauth/config.php';
    require_once( BASEPATH . "hybridauth/Hybrid/Auth.php" );

    $error = '';

    try{
        // create an instance for Hybridauth with the configuration file path as parameter
        $hybridauth = new Hybrid_Auth( $configHybrid_Auth );

        // set selected provider name
        $provider = @ trim( strip_tags( $_GET["provider"] ) );

        // try to authenticate the selected $provider
        $adapter = $hybridauth->authenticate( $provider );

        // if okey, we will redirect to user profile page
        $hybridauth->redirect( "index.php?provider=".$provider );
    }
    catch( Exception $e ){
        // In case we have errors 6 or 7, then we have to use Hybrid_Provider_Adapter::logout() to
        // let hybridauth forget all about the user so we can try to authenticate again.

        // Display the recived error,
        // to know more please refer to Exceptions handling section on the userguide
        switch( $e->getCode() ){
            case 0 : $error = "Unspecified error."; break;
            case 1 : $error = "Hybriauth configuration error."; break;
            case 2 : $error = "Provider not properly configured."; break;
            case 3 : $error = "Unknown or disabled provider."; break;
            case 4 : $error = "Missing provider application credentials."; break;
            case 5 : $error = "Authentication failed. The user has canceled the authentication or the provider refused the connection."; break;
            case 6 : $error = "User profile request failed. Most likely the user is not connected to the provider and he should to authenticate again.";
                $adapter->logout();
                break;
            case 7 : $error = "User not connected to the provider.";
                $adapter->logout();
                break;
        }

        // well, basically your should not display this to the end user, just give him a hint and move on..
        $error .= "<br /><br /><b>Original error message:</b> " . $e->getMessage();
        $error .= "<hr /><pre>Trace:<br />" . $e->getTraceAsString() . "</pre>";

        $_SESSION['POPUP'][] = array('CONTENT' => 'Unable to login: '. $error, 'TYPE' => 'warning');
    }
} elseif ($setting->getValue('maintenance') && !$user->isAdmin($user->getUserId($_POST['username']))) {
  $_SESSION['POPUP'][] = array('CONTENT' => 'You are not allowed to login during maintenace.');
} else if ($user->checkLogin(@$_POST['username'], @$_POST['password']) ) {
  empty($_POST['to']) ? $to = $_SERVER['PHP_SELF'] : $to = $_POST['to'];
  $port = ($_SERVER["SERVER_PORT"] == "80" or $_SERVER["SERVER_PORT"] == "443") ? "" : (":".$_SERVER["SERVER_PORT"]);
  $location = @$_SERVER['HTTPS'] === true ? 'https://' . $_SERVER['SERVER_NAME'] . $port . $to : 'http://' . $_SERVER['SERVER_NAME'] . $port . $to;
  if (!headers_sent()) header('Location: ' . $location);
  exit('<meta http-equiv="refresh" content="0; url=' . htmlspecialchars($location) . '"/>');
} else if (@$_POST['username'] && @$_POST['password']) {
  $_SESSION['POPUP'][] = array('CONTENT' => 'Unable to login: '. $user->getError(), 'TYPE' => 'warning');
}

// Load login template
$smarty->assign('CONTENT', 'default.tpl');
?>
