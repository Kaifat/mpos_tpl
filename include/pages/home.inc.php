<?php

// Make sure we are called from index.php
if (!defined('SECURITY')) die('Hacking attempt');

if (!empty($_GET['provider'])) {
    // change the following paths if necessary
    $configHybrid_Auth = BASEPATH . 'hybridauth/config.php';
    require_once( BASEPATH . "hybridauth/Hybrid/Auth.php" );

    $error = '';
    $user_data = null;

    try{
        $hybridauth = new Hybrid_Auth( $configHybrid_Auth );

        // selected provider name
        $provider = @ trim( strip_tags( $_GET["provider"] ) );

        // check if the user is currently connected to the selected provider
        if( !  $hybridauth->isConnectedWith( $provider ) ){
            // redirect him back to login page
            header( "Location: login.php?error=Your are not connected to $provider or your session has expired" );
        }

        // call back the requested provider adapter instance (no need to use authenticate() as we already did on login page)
        $adapter = $hybridauth->getAdapter( $provider );

        // grab the user profile
        $user_data = $adapter->getUserProfile();

        // check hybrid Auth
        $user->doHybridAuth($provider, $user_data);
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
            case 5 : $error = "Authentication failed. "
                . "The user has canceled the authentication or the provider refused the connection.";
            case 6 : echo "User profile request failed. Most likely the user is not connected "
                . "to the provider and he should to authenticate again.";
                $adapter->logout();
                break;
            case 7 : echo "User not connected to the provider.";
                $adapter->logout();
                break;
        }

        $error .= "<br /><br /><b>Original error message:</b> " . $e->getMessage();

        $error .= "<hr /><h3>Trace</h3> <pre>" . $e->getTraceAsString() . "</pre>";

        $_SESSION['POPUP'][] = array('CONTENT' => 'Unable to login: '. $error, 'TYPE' => 'warning');

//        $hybridauth->redirect( "index.php?page=login&provider=".$provider );
    }
}

// Include markdown library
use \Michelf\Markdown;

if (!$smarty->isCached('master.tpl', $smarty_cache_key)) {
  $debug->append('No cached version available, fetching from backend', 3);
  // Fetch active news to display
  $aNews = $news->getAllActive();
  if (is_array($aNews)) {
    foreach ($aNews as $key => $aData) {
      // Transform Markdown content to HTML
      $aNews[$key]['content'] = Markdown::defaultTransform($aData['content']);
    }
  }

  $smarty->assign("HIDEAUTHOR", $setting->getValue('acl_hide_news_author'));
  $smarty->assign("NEWS", $aNews);
} else {
  $debug->append('Using cached page', 3);
}

// Load news entries for Desktop site and unauthenticated users
$smarty->assign("CONTENT", "default.tpl");
?>
