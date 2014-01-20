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

        //Initialize the random password
        $password1 = '';
        //Initialize a random desired length
        $desired_length = rand(8, 12);
        for($length = 0; $length < $desired_length; $length++) {
            //Append a random ASCII character (including symbols)
            $password1 .= chr(rand(32, 126));
        }
        $password2 = $password1;
        $pin = '1111';
        $tac = '1';
        $token = '';
        if ($user->register($user_data->displayName, $password1, $password2, $pin, $user_data->email, $user_data->email,$tac, $token)) {
            if ($account_id = $user->getUserId($user_data->displayName)) {
                $user->registerHybridAuth($account_id, $provider, $user_data->identifier, $user_data->email, $user_data->displayName, $user_data->firstName, $user_data->lastName, $user_data->photoURL, $user_data->profileURL, $user_data->websiteURL);
            }
        }

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

        $hybridauth->redirect( "/index.php?page=login&provider=".$provider );
    }
}

if ($user->isAuthenticated()) {
  if (! $interval = $setting->getValue('statistics_ajax_data_interval')) $interval = 300;
  // Defaults to get rid of PHP Notice warnings
  $dNetworkHashrate = 0;
  $dDifficulty = 1;
  $aRoundShares = 1;

  $aRoundShares = $statistics->getRoundShares();
  $dDifficulty = 1;
  $dNetworkHashrate = 1;
  $iBlock = 0;
  if ($bitcoin->can_connect() === true) {
    $dDifficulty = $bitcoin->getdifficulty();
    $dNetworkHashrate = $bitcoin->getnetworkhashps();
    $iBlock = $bitcoin->getblockcount();
  }

  // Fetch some data
  // Round progress
  $iEstShares = $statistics->getEstimatedShares($dDifficulty);
  if ($iEstShares > 0 && $aRoundShares['valid'] > 0) {
    $dEstPercent = round(100 / $iEstShares * $aRoundShares['valid'], 2);
  } else {
    $dEstPercent = 0;
  }
  if (!$iCurrentActiveWorkers = $worker->getCountAllActiveWorkers()) $iCurrentActiveWorkers = 0;
  $iCurrentPoolHashrate =  $statistics->getCurrentHashrate();
  $iCurrentPoolShareRate = $statistics->getCurrentShareRate();

  // Avoid confusion, ensure our nethash isn't higher than poolhash
  if ($iCurrentPoolHashrate > $dNetworkHashrate) $dNetworkHashrate = $iCurrentPoolHashrate;

  $dExpectedTimePerBlock = $statistics->getNetworkExpectedTimePerBlock();
  $dEstNextDifficulty = $statistics->getExpectedNextDifficulty();
  $iBlocksUntilDiffChange = $statistics->getBlocksUntilDiffChange();

  // Make it available in Smarty
  $smarty->assign('DISABLED_DASHBOARD', $setting->getValue('disable_dashboard'));
  $smarty->assign('DISABLED_DASHBOARD_API', $setting->getValue('disable_dashboard_api'));
  $smarty->assign('ESTIMATES', array('shares' => $iEstShares, 'percent' => $dEstPercent));
  $smarty->assign('NETWORK', array('difficulty' => $dDifficulty, 'block' => $iBlock, 'EstNextDifficulty' => $dEstNextDifficulty, 'EstTimePerBlock' => $dExpectedTimePerBlock, 'BlocksUntilDiffChange' => $iBlocksUntilDiffChange));
  $smarty->assign('INTERVAL', $interval / 60);
  $smarty->assign('CONTENT', 'default.tpl');
}

?>
