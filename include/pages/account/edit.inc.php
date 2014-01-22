<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
  die('Hacking attempt');

if ($user->isAuthenticated()) {
  if (isset($_POST['do']) && $_POST['do'] == 'genPin') {
    if ($user->generatePin($_SESSION['USERDATA']['id'], $_POST['currentPassword'])) {
      $_SESSION['POPUP'][] = array('CONTENT' => 'Your PIN # has been sent to your email.', 'TYPE' => 'success');
    } else {
      $_SESSION['POPUP'][] = array('CONTENT' => $user->getError(), 'TYPE' => 'warning');
    }
  }
  else {
    if ( @$_POST['do'] && (@$_POST['do'] != 'updateAvatar' && ! $user->checkPin($_SESSION['USERDATA']['id'], @$_POST['authPin']))) {
      $_SESSION['POPUP'][] = array('CONTENT' => 'Invalid PIN. ' . ($config['maxfailed']['pin'] - $user->getUserPinFailed($_SESSION['USERDATA']['id'])) . ' attempts remaining.', 'TYPE' => 'warning');
    } else {
      switch (@$_POST['do']) {
      case 'updateAvatar':
          $valid_exts = array('jpeg', 'jpg', 'png', 'gif');
          $max_file_size = 2 * 1024 * 1024; #2Mb
          $nw = $nh = 300; # image with # height

          if ($_SERVER['REQUEST_METHOD'] === 'POST') {
              if ( isset($_FILES['image']) ) {
                  if (! $_FILES['image']['error'] && $_FILES['image']['size'] < $max_file_size) {
                      $ext = strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION));
                      if (in_array($ext, $valid_exts)) {
                          $avatarFileName = uniqid() . '.' . $ext;
                          $path = BASEPATH . 'uploads/avatar/' . $avatarFileName;
                          $size = getimagesize($_FILES['image']['tmp_name']);

                          $x = (int) $_POST['x'] * $_POST['scalePer'];
                          $y = (int) $_POST['y'] * $_POST['scalePer'];
                          $w = (int) $_POST['w'] ? ($_POST['w'] * $_POST['scalePer']) : $size[0];
                          $h = (int) $_POST['h'] ? ($_POST['h'] * $_POST['scalePer']) : $size[1];

                          $data = file_get_contents($_FILES['image']['tmp_name']);
                          $vImg = imagecreatefromstring($data);
                          $dstImg = imagecreatetruecolor($nw, $nh);
                          imagecopyresampled($dstImg, $vImg, 0, 0, $x, $y, $nw, $nh, $w, $h);
                          imagejpeg($dstImg, $path);
                          imagedestroy($dstImg);

                          $_SESSION['USERDATA']['avatar'] = $path;
                          $_SESSION['POPUP'][] = array('CONTENT' => 'Avatar was updated', 'TYPE' => 'success');

                          $oldAva = $user->updateAvatar($_SESSION['USERDATA']['id'], $avatarFileName);
                          if ($oldAva) {
                              unlink(BASEPATH . 'uploads/avatar/' . $oldAva);
                          }

                      } else {
                          $_SESSION['POPUP'][] = array('CONTENT' => 'Avatar was not updated. Unknown problem!', 'TYPE' => 'warning');
                      }
                  } else {
                      $_SESSION['POPUP'][] = array('CONTENT' => 'Avatar was not updated. File is too small or large!', 'TYPE' => 'warning');
                  }
              } else {
                  $_SESSION['POPUP'][] = array('CONTENT' => 'Avatar was not updated. File not set!', 'TYPE' => 'warning');
              }
          } else {
              $_SESSION['POPUP'][] = array('CONTENT' => 'Avatar was not updated. Bad request!', 'TYPE' => 'warning');
          }
      break;

      case 'updateContacts':
          if ($user->updateContacts($_SESSION['USERDATA']['id'], $_POST['c_skype'], $_POST['c_vk'], $_POST['c_icq'])) {
              $_SESSION['POPUP'][] = array('CONTENT' => 'Contacts updated', 'TYPE' => 'success');
          } else {
              $_SESSION['POPUP'][] = array('CONTENT' => $user->getError(), 'TYPE' => 'warning');
          }
      break;
      case 'cashOut':
        if ($setting->getValue('disable_payouts') == 1 || $setting->getValue('disable_manual_payouts') == 1) {
          $_SESSION['POPUP'][] = array('CONTENT' => 'Manual payouts are disabled.', 'TYPE' => 'info');
        } else {
          $aBalance = $transaction->getBalance($_SESSION['USERDATA']['id']);
          $dBalance = $aBalance['confirmed'];
          if ($dBalance > $config['txfee']) {
            if (!$oPayout->isPayoutActive($_SESSION['USERDATA']['id'])) {
              if ($iPayoutId = $oPayout->createPayout($_SESSION['USERDATA']['id'])) {
                $_SESSION['POPUP'][] = array('CONTENT' => 'Created new manual payout request with ID #' . $iPayoutId);
              } else {
                $_SESSION['POPUP'][] = array('CONTENT' => 'Failed to create manual payout request.', 'TYPE' => 'warning');
              }
            } else {
              $_SESSION['POPUP'][] = array('CONTENT' => 'You already have one active manual payout request.', 'TYPE' => 'warning');
            }
          } else {
            $_SESSION['POPUP'][] = array('CONTENT' => 'Insufficient funds, you need more than ' . $config['txfee'] . ' ' . $config['currency'] . ' to cover transaction fees', 'TYPE' => 'warning');
          }
        }
        break;

      case 'updateAccount':
        if ($user->updateAccount($_SESSION['USERDATA']['id'], $_POST['paymentAddress'], $_POST['payoutThreshold'], $_POST['donatePercent'], $_POST['email'], $_POST['is_anonymous'])) {
          $_SESSION['POPUP'][] = array('CONTENT' => 'Account details updated', 'TYPE' => 'success');
        } else {
          $_SESSION['POPUP'][] = array('CONTENT' => 'Failed to update your account: ' . $user->getError(), 'TYPE' => 'warning');
        }
        break;

      case 'updatePassword':
        if ($user->updatePassword($_SESSION['USERDATA']['id'], $_POST['currentPassword'], $_POST['newPassword'], $_POST['newPassword2'])) {
          $_SESSION['POPUP'][] = array('CONTENT' => 'Password updated', 'TYPE' => 'success');
        } else {
          $_SESSION['POPUP'][] = array('CONTENT' => $user->getError(), 'TYPE' => 'warning');
        }
        break;
      }
    }
  }
}
// Tempalte specifics
$smarty->assign("CONTENT", "default.tpl");
?>
