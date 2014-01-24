<?php
// Make sure we are called from index.php
if (!defined('SECURITY')) die('Hacking attempt');

if ($setting->getValue('recaptcha_enabled')) {
  // Load re-captcha specific data
  require_once(INCLUDE_DIR . '/lib/recaptchalib.php');
  $rsp = recaptcha_check_answer (
    $setting->getValue('recaptcha_private_key'),
    $_SERVER["REMOTE_ADDR"],
    ( (isset($_POST["recaptcha_challenge_field"])) ? $_POST["recaptcha_challenge_field"] : null ),
    ( (isset($_POST["recaptcha_response_field"])) ? $_POST["recaptcha_response_field"] : null )
  );
}

if ($setting->getValue('disable_invitations') && $setting->getValue('lock_registration')) {
  $_SESSION['POPUP'][] = array('CONTENT' => 'Account registration is currently disabled. Please try again later.', 'TYPE' => 'warning');
} else if ($setting->getValue('lock_registration') && !$setting->getValue('disable_invitations') && !isset($_POST['token'])) {
  $_SESSION['POPUP'][] = array('CONTENT' => 'Only invited users are allowed to register.', 'TYPE' => 'warning');
} else {
  // Check if recaptcha is enabled, process form data if valid
  if($setting->getValue('recaptcha_enabled') && isset($_POST["recaptcha_response_field"]) && $_POST["recaptcha_response_field"]!=''){
    if ($rsp->is_valid) {
      $smarty->assign("RECAPTCHA", recaptcha_get_html($setting->getValue('recaptcha_public_key')));
      isset($_POST['token']) ? $token = $_POST['token'] : $token = '';
      if ($user->register(@$_POST['username'], @$_POST['password1'], @$_POST['password2'], @$_POST['pin'], @$_POST['email1'], @$_POST['email2'], @$_POST['tac'], $token)) {
        ! $setting->getValue('accounts_confirm_email_disabled') ? $_SESSION['POPUP'][] = array('CONTENT' => 'Please check your mailbox to activate this account') : $_SESSION['POPUP'][] = array('CONTENT' => 'Account created, please login');
      } else {
        $_SESSION['POPUP'][] = array('CONTENT' => 'Unable to create account: ' . $user->getError(), 'TYPE' => 'warning');
      }
    } else {
      $smarty->assign("RECAPTCHA", recaptcha_get_html($setting->getValue('recaptcha_public_key'), $rsp->error));
      $_SESSION['POPUP'][] = array('CONTENT' => 'Invalid Captcha, please try again. (' . $rsp->error . ')', 'TYPE' => 'warning');
    }
    // Empty captcha
  } else if ($setting->getValue('recaptcha_enabled')) {
    $smarty->assign("RECAPTCHA", recaptcha_get_html($setting->getValue('recaptcha_public_key'), $rsp->error));
    $_SESSION['POPUP'][] = array('CONTENT' => 'Empty Captcha, please try again.', 'TYPE' => 'warning');
    // Captcha disabled
  } else {
    isset($_POST['token']) ? $token = $_POST['token'] : $token = '';
    if ($user->register(@$_POST['username'], @$_POST['password1'], @$_POST['password2'], @$_POST['pin'], @$_POST['email1'], @$_POST['email2'], @$_POST['tac'], $token)) {
      $setting->getValue('accounts_confirm_email_disabled') ? $_SESSION['POPUP'][] = array('CONTENT' => 'Account created, please login') : $_SESSION['POPUP'][] = array('CONTENT' => 'Please check your mailbox to activate this account');

        empty($_POST['to']) ? $to = $_SERVER['PHP_SELF'] : $to = $_POST['to'];
        $to .= '#tab_sign_in';
        $port = ($_SERVER["SERVER_PORT"] == "80" or $_SERVER["SERVER_PORT"] == "443") ? "" : (":".$_SERVER["SERVER_PORT"]);
        $location = @$_SERVER['HTTPS'] === true ? 'https://' . $_SERVER['SERVER_NAME'] . $port . $to : 'http://' . $_SERVER['SERVER_NAME'] . $port . $to;
        if (!headers_sent()) header('Location: ' . $location);
        exit('<meta http-equiv="refresh" content="0; url=' . htmlspecialchars($location) . '"/>');

    } else {

      $_SESSION['POPUP'][] = array('CONTENT' => 'Unable to create account: ' . $user->getError(), 'TYPE' => 'warning');
    }
  }
}

// We load the default registration template instead of an action specific one
$smarty->assign("CONTENT", "../default.tpl");
?>
