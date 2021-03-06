<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
  die('Hacking attempt');

class User extends Base {
  protected $table = 'accounts';
  protected $tableHybridAuth = 'authentications';
  private $userID = false;
  private $user = array();

  // get and set methods
  private function getHash($string) {
    return hash('sha256', $string.$this->salt);
  }
  public function getUserName($id) {
    return $this->getSingle($id, 'username', 'id');
  }
  public function getUserNameByEmail($email) {
    return $this->getSingle($email, 'username', 'email', 's');
  }
  public function getUserId($username, $lower=false) {
    return $this->getSingle($username, 'id', 'username', 's', $lower);
  }
  public function getUserEmail($username, $lower=false) {
    return $this->getSingle($username, 'email', 'username', 's', $lower);
  }
  public function getUserNoFee($id) {
    return $this->getSingle($id, 'no_fees', 'id');
  }
  public function getUserDonatePercent($id) {
    return $this->getDonatePercent($id);
  }
  public function getUserAdmin($id) {
    return $this->getSingle($id, 'is_admin', 'id');
  }
  public function getUserLocked($id) {
    return $this->getSingle($id, 'is_locked', 'id');
  }
  public function getUserIp($id) {
    return $this->getSingle($id, 'loggedIp', 'id');
  }
  public function getEmail($email) {
    return $this->getSingle($email, 'email', 'email', 's');
  }
  public function getUserFailed($id) {
   return $this->getSingle($id, 'failed_logins', 'id');
  }
  public function getUserPinFailed($id) {
   return $this->getSingle($id, 'failed_pins', 'id');
  }
  public function isNoFee($id) {
    return $this->getUserNoFee($id);
  }
  public function isLocked($id) {
    return $this->getUserLocked($id);
  }
  public function isAdmin($id) {
    return $this->getUserAdmin($id);
  }
  public function changeNoFee($id) {
    $field = array('name' => 'no_fees', 'type' => 'i', 'value' => !$this->isNoFee($id));
    return $this->updateSingle($id, $field);
  }
  public function changeLocked($id) {
    $field = array('name' => 'is_locked', 'type' => 'i', 'value' => !$this->isLocked($id));
    return $this->updateSingle($id, $field);
  }
  public function changeAdmin($id) {
    $field = array('name' => 'is_admin', 'type' => 'i', 'value' => !$this->isAdmin($id));
    return $this->updateSingle($id, $field);
  }
  public function setUserFailed($id, $value) {
    $field = array( 'name' => 'failed_logins', 'type' => 'i', 'value' => $value);
    return $this->updateSingle($id, $field);
  }
  public function setUserPinFailed($id, $value) {
    $field = array( 'name' => 'failed_pins', 'type' => 'i', 'value' => $value);
    return $this->updateSingle($id, $field);
  }
  private function incUserFailed($id) {
    $field = array( 'name' => 'failed_logins', 'type' => 'i', 'value' => $this->getUserFailed($id) + 1);
    return $this->updateSingle($id, $field);
  }
  private function incUserPinFailed($id) {
    $field = array( 'name' => 'failed_pins', 'type' => 'i', 'value' => $this->getUserPinFailed($id) + 1);
    return $this->updateSingle($id, $field);
  }
  private function setUserIp($id, $ip) {
    $field = array( 'name' => 'loggedIp', 'type' => 's', 'value' => $ip );
    return $this->updateSingle($id, $field);
  }
  public function changeAvatar($id, $avatar) {
    $field = array('name' => 'avatar', 'type' => 's', 'value' => $avatar);
    return $this->updateSingle($id, $field);
  }

    /**
     * Fetch all users for administrative tasks
     * @param none
     * @return data array All users with db columns as array fields
     **/
    public function getUsers($filter='%') {
        $stmt = $this->mysqli->prepare("SELECT * FROM " . $this->getTableName() . " WHERE username LIKE ?");
        if ($this->checkStmt($stmt) && $stmt->bind_param('s', $filter) && $stmt->execute() && $result = $stmt->get_result()) {
            return $result->fetch_all(MYSQLI_ASSOC);
        }
    }

    /**
     * @param $userName
     * @return string
     */
    public function generateUsername($userName, $vkUid = null)
    {
        $userName .= rand(1, 100);
        if ($this->getUserId($userName) || !$this->isNewVkUser($userName, $vkUid)) {
            $userName = $this->generateUsername($userName);
        }
        return $userName;
    }

    /**
     * @return string
     */
    public function generatePassword()
    {
        //Initialize the random password
        $password = '';
        //Initialize a random desired length
        $desired_length = rand(8, 12);
        for($length = 0; $length < $desired_length; $length++) {
            //Append a random ASCII character (including symbols)
            $password .= chr(rand(32, 126));
        }

        return $password;
    }

    /**
     * @param $accountId
     * @return int
     */
    public function getHybridAuth($accountId)
    {
        $retval = 0;
        $this->debug->append("STA " . __METHOD__, 4);
        $sql = "SELECT id FROM $this->tableHybridAuth WHERE account_id = ?";
        $sql .= " LIMIT 1";
        $stmt = $this->mysqli->prepare($sql);
        if ($this->checkStmt($stmt)) {
            $stmt->bind_param('i', $accountId);
            $stmt->execute();
            $stmt->bind_result($retval);
            $stmt->fetch();
            $stmt->close();
        }

        return $retval;
    }

    /**
     * @param $vkUserName
     * @param $vkUid
     * @return bool
     */
    public function isNewVkUser($vkUserName, $vkUid)
    {
        $retval = 0;
        $this->debug->append("STA " . __METHOD__, 4);
        $sql = "SELECT ac.id
          FROM $this->table AS ac
          LEFT JOIN $this->tableHybridAuth as ha ON ha.account_id = ac.id
          WHERE LOWER(ac.username) = LOWER(?) AND ha.provider_uid = ? LIMIT 1";

        $stmt = $this->mysqli->prepare($sql);
        if ($this->checkStmt($stmt)) {
            $stmt->bind_param('si', $vkUserName, $vkUid);
            $stmt->execute();
            $stmt->bind_result($retval);
            $stmt->fetch();
            $stmt->close();
        }

        return ($retval) ? false : true;
    }

    /**
     * @param $provider
     * @param $userData
     * @return bool
     */
    public function doHybridAuth($provider, $userData)
    {
        // check present email (fix for Vkontakte)
        $vkUid = null;
        $isNewVkUser = false;
        if (empty($userData->email) && $provider == 'Vkontakte') {
            $vkUid = $userData->identifier;
            $username = $this->ru2lat($userData->lastName.$userData->firstName);
            $isNewVkUser = $this->isNewVkUser($username, $vkUid);
        }
        // check if user present
        if ($isNewVkUser || ($provider !== 'Vkontakte' && !$username = $this->getUserNameByEmail($userData->email))) {

            if (!empty($userData->email)) {
                // create user account
                $usernameTemp = explode('@', $userData->email);
                $username = str_replace('.', '_', $usernameTemp[0]);
                $username = str_replace('-', '_', $username);
            }

            // check unic username
            if ($this->getUserId($username)) {
                $username = $this->generateUsername($username, $vkUid);
            }
            // generate password
            $password1 = $this->generatePassword();
            $password2 = $password1;
            $pin = '1111';
            $tac = '1';
            $token = '';

            if (!$this->register($username, $password1, $password2, $pin, $userData->email, $userData->email,$tac, $token, $isNewVkUser)) {
                $_SESSION['POPUP'][] = array('CONTENT' => 'Unable to create account: ' . $this->getError(), 'TYPE' => 'warning');
                return false;
            }
        }

        // after registration (if not registered)
        $account_id = $this->getUserId($username);
        // check present in tableHybridAuth
        if (!$this->getHybridAuth($account_id)) {
            // BIND User Account with Hybrid Auth
            if (!$this->registerHybridAuth($account_id, $provider, $userData->identifier, $userData->email,
                $userData->displayName, $userData->firstName, $userData->lastName,
                $userData->photoURL, $userData->profileURL, $userData->webSiteURL)) {
                    $_SESSION['POPUP'][] = array('CONTENT' => 'Unable to create '.$provider.' account: ' . $this->getError(), 'TYPE' => 'warning');
                return false;
            }
        }

        $accountUserData = $this->getUserData($account_id);
        if (empty($accountUserData['avatar'])) {
            $avatar = $userData->photoURL;
//            $avatar = $accountUserData['photo_url'];
        } else {
            $avatar = '/uploads/avatar/' . $accountUserData['avatar'];
        }
        $this->user = array(
            'username' => $username,
            'id' => $account_id,
            'is_admin' => $accountUserData['is_admin'],
            'avatar' => $avatar
        );
        $this->createSession($username);
        if ($this->setUserIp($this->getUserId($username), $_SERVER['REMOTE_ADDR']))
            return true;
    }

  /**
   * Check user login
   * @param username string Username
   * @param password string Password
   * @return bool
   **/
  public function checkLogin($username, $password) {
    $this->debug->append("STA " . __METHOD__, 4);
    $this->debug->append("Checking login for $username with password $password", 2);
    if (empty($username) || empty($password)) {
      $this->setErrorMessage("Invalid username or password.");
      return false;
    }
    if (filter_var($username, FILTER_VALIDATE_EMAIL)) {
      $this->debug->append("Username is an e-mail: $username", 2);
      if (!$username = $this->getUserNameByEmail($username)) {
        $this->setErrorMessage("Invalid username or password.");
        return false;
      }
    }
    if ($this->isLocked($this->getUserId($username))) {
      $this->setErrorMessage('Account locked.');
      return false;
    }

    if ($this->checkUserPassword($username, $password)) {
      $this->createSession($username);
      if ($this->setUserIp($this->getUserId($username), $_SERVER['REMOTE_ADDR']))
        return true;
    }
    $this->setErrorMessage("Invalid username or password");
    if ($id = $this->getUserId($username)) {
      $this->incUserFailed($id);
      // Check if this account should be locked
      if (isset($this->config['maxfailed']['login']) && $this->getUserFailed($id) >= $this->config['maxfailed']['login']) {
        $this->changeLocked($id);
        if ($token = $this->token->createToken('account_unlock', $id)) {
          $aData['token'] = $token;
          $aData['username'] = $username;
          $aData['email'] = $this->getUserEmail($username);;
          $aData['subject'] = 'Account auto-locked';
          $this->mail->sendMail('notifications/locked', $aData);
        }
      }
    }

    return false;
  }

  /**
   * Check the users PIN for confirmation
   * @param userID int User ID
   * @param pin int PIN to check
   * @return bool
   **/
  public function checkPin($userId, $pin=false) {
    $this->debug->append("STA " . __METHOD__, 4);
    $this->debug->append("Confirming PIN for $userId and pin $pin", 2);
    $stmt = $this->mysqli->prepare("SELECT pin FROM $this->table WHERE id=? AND pin=? LIMIT 1");
    $pin_hash = $this->getHash($pin);
    if ($stmt->bind_param('is', $userId, $pin_hash) && $stmt->execute() && $stmt->bind_result($row_pin) && $stmt->fetch()) {
      $this->setUserPinFailed($userId, 0);
      return $pin_hash === $row_pin;
    }
    $this->incUserPinFailed($userId);
    // Check if this account should be locked
    if (isset($this->config['maxfailed']['pin']) && $this->getUserPinFailed($userId) >= $this->config['maxfailed']['pin']) {
      $this->changeLocked($userId);
      if ($token = $this->token->createToken('account_unlock', $userId)) {
        $username = $this->getUserName($userId);
        $aData['token'] = $token;
        $aData['username'] = $username;
        $aData['email'] = $this->getUserEmail($username);;
        $aData['subject'] = 'Account auto-locked';
        $this->mail->sendMail('notifications/locked', $aData);
      }
      $this->logoutUser();
    }
    return false;
  }

  public function generatePin($userID, $current) {
    $this->debug->append("STA " . __METHOD__, 4);
    $username = $this->getUserName($userID);
    $email = $this->getUserEmail($username);
    $current = $this->getHash($current);
    $newpin = intval( '0' . rand(1,9) . rand(0,9) . rand(0,9) . rand(0,9) );
    $aData['username'] = $username;
    $aData['email'] = $email;
    $aData['pin'] = $newpin;
    $newpin = $this->getHash($newpin);
    $aData['subject'] = 'PIN Reset Request';
    $stmt = $this->mysqli->prepare("UPDATE $this->table SET pin = ? WHERE ( id = ? AND pass = ? )");

    if ($this->checkStmt($stmt) && $stmt->bind_param('sis', $newpin, $userID, $current) && $stmt->execute()) {
      if ($stmt->errno == 0 && $stmt->affected_rows === 1) {
        if ($this->mail->sendMail('pin/reset', $aData)) {
          return true;
        } else {
          $this->setErrorMessage('Unable to send mail to your address');
          return false;
        }
      }
    }
    $this->setErrorMessage( 'Unable to generate PIN, current password incorrect?' );
    return false;
}

  /**
   * Get all users that have auto payout setup
   * @param none
   * @return data array All users with payout setup
   **/
  public function getAllAutoPayout() {
    $this->debug->append("STA " . __METHOD__, 4);
    $stmt = $this->mysqli->prepare("
      SELECT
        id, username, coin_address, ap_threshold
      FROM " . $this->getTableName() . "
      WHERE ap_threshold > 0
      AND coin_address IS NOT NULL
      ");
    if ( $this->checkStmt($stmt) && $stmt->execute() && $result = $stmt->get_result()) {
      return $result->fetch_all(MYSQLI_ASSOC);
    }
    $this->debug->append("Unable to fetch users with AP set");
    return false;
  }

  /**
   * Fetch users coin address
   * @param userID int UserID
   * @return data string Coin Address
   **/
  public function getCoinAddress($userID) {
    $this->debug->append("STA " . __METHOD__, 4);
    return $this->getSingle($userID, 'coin_address', 'id');
  }

  /**
   * Fetch users donation value 
   * @param userID int UserID
   * @return data string Coin Address
   **/
  public function getDonatePercent($userID) {
    $this->debug->append("STA " . __METHOD__, 4);
    $dPercent = $this->getSingle($userID, 'donate_percent', 'id');
    if ($dPercent > 100) $dPercent = 100;
    if ($dPercent < 0) $dPercent = 0;
    return $dPercent;
  }

  /**
   * Update the accounts password
   * @param userID int User ID
   * @param current string Current password
   * @param new1 string New password
   * @param new2 string New password confirmation
   * @return bool
   **/
  public function updatePassword($userID, $current, $new1, $new2) {
    $this->debug->append("STA " . __METHOD__, 4);
    if ($new1 !== $new2) {
      $this->setErrorMessage( 'New passwords do not match' );
      return false;
    }
    if ( strlen($new1) < 8 ) {
      $this->setErrorMessage( 'New password is too short, please use more than 8 chars' );
      return false;
    }
    $current = $this->getHash($current);
    $new = $this->getHash($new1);
    $stmt = $this->mysqli->prepare("UPDATE $this->table SET pass = ? WHERE ( id = ? AND pass = ? )");
    if ($this->checkStmt($stmt)) {
      $stmt->bind_param('sis', $new, $userID, $current);
      $stmt->execute();
      if ($stmt->errno == 0 && $stmt->affected_rows === 1) {
        return true;
      }
      $stmt->close();
    }
    $this->setErrorMessage( 'Unable to update password, current password wrong?' );
    return false;
  }

  /**
   * Update account information from the edit account page
   * @param userID int User ID
   * @param address string new coin address
   * @param threshold float auto payout threshold
   * @param donat float donation % of income
   * @return bool
   **/
  public function updateAccount($userID, $address, $threshold, $donate, $email, $is_anonymous) {
    $this->debug->append("STA " . __METHOD__, 4);
    $bUser = false;

    // number validation checks
    if (!is_numeric($threshold)) {
      $this->setErrorMessage('Invalid input for auto-payout');
      return false;
    } else if ($threshold < $this->config['ap_threshold']['min'] && $threshold != 0) {
      $this->setErrorMessage('Threshold below configured minimum of ' . $this->config['ap_threshold']['min']);
      return false;
    } else if ($threshold > $this->config['ap_threshold']['max']) {
      $this->setErrorMessage('Threshold above configured maximum of ' . $this->config['ap_threshold']['max']);
      return false;
    }
    if (!is_numeric($donate)) {
      $this->setErrorMessage('Invalid input for donation');
      return false;
    } else if ($donate < 0) {
      $this->setErrorMessage('Donation below allowed 0% limit');
      return false;
    } else if ($donate > 100) {
      $this->setErrorMessage('Donation above allowed 100% limit');
      return false;
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      $this->setErrorMessage('Invalid email address');
      return false;
    }
    if (!empty($address)) {
      if ($this->bitcoin->can_connect() === true) {
        try {
          $aStatus = $this->bitcoin->validateaddress($address);
          if (!$aStatus['isvalid']) {
            $this->setErrorMessage('Invalid coin address');
            return false;
          }
        } catch (Exception $e) {
          $this->setErrorMessage('Unable to verify coin address');
          return false;
        }
      } else {
        $this->setErrorMessage('Unable to connect to RPC server for coin address validation');
        return false;
      }
    }

    // Number sanitizer, just in case we fall through above
    $threshold = min($this->config['ap_threshold']['max'], max(0, floatval($threshold)));
    $donate = min(100, max(0, floatval($donate)));

    // We passed all validation checks so update the account
    $stmt = $this->mysqli->prepare("UPDATE $this->table SET coin_address = ?, ap_threshold = ?, donate_percent = ?, email = ?, is_anonymous = ? WHERE id = ?");
    if ($this->checkStmt($stmt) && $stmt->bind_param('sddsii', $address, $threshold, $donate, $email, $is_anonymous, $userID) && $stmt->execute())
      return true;
    // Catchall
    $this->setErrorMessage('Failed to update your account');
    $this->debug->append('Account update failed: ' . $this->mysqli->error);
    return false;
  }

    /**
     * * Update the accounts avatar
     * @param $userID int
     * @param $avatar string
     * @return string
     */
    public function updateAvatar($userID, $avatar) {
        $this->debug->append("STA " . __METHOD__, 4);
        if (empty($avatar)) {
            $this->setErrorMessage( 'Select Avatar please' );
            return false;
        }

        $stmt = $this->mysqli->prepare("SELECT avatar FROM $this->table WHERE id = ?");
        if ($this->checkStmt($stmt) && $stmt->bind_param('i', $userID) && $stmt->execute() && $stmt->bind_result($row_avatar)) {
            $stmt->fetch();
            $stmt->close();
        }

        // update
        $stmt = $this->mysqli->prepare("UPDATE $this->table SET avatar = ? WHERE id = ?");
        if ($this->checkStmt($stmt)) {
            $stmt->bind_param('si', $avatar, $userID);
            $stmt->execute();
            if ($stmt->errno == 0 && $stmt->affected_rows === 1) {
                return $row_avatar;
            }
            $stmt->close();
        }
        $this->setErrorMessage( 'Unable to update avatar' );
        return false;
    }

    /**
     * @param $userID
     * @param $c_skype
     * @param $c_vk
     * @param $c_icq
     * @return bool
     */
    public function updateContacts($userID, $c_skype, $c_vk, $c_icq) {
        $this->debug->append("STA " . __METHOD__, 4);
        $stmt = $this->mysqli->prepare("UPDATE $this->table SET c_skype = ?, c_vk = ?, c_icq = ?  WHERE id = ?");
        if ($this->checkStmt($stmt)) {
            $stmt->bind_param('ssii', $c_skype, $c_vk, $c_icq, $userID);
            $stmt->execute();
            if ($stmt->errno == 0 && $stmt->affected_rows === 1) {
                return true;
            }
            $stmt->close();
        }
        $this->setErrorMessage( 'Unable to update contacts' );
        return false;
    }

  /**
   * Check API key for authentication
   * @param key string API key hash
   * @return bool
   **/
  public function checkApiKey($key) {
    $this->debug->append("STA " . __METHOD__, 4);
    $stmt = $this->mysqli->prepare("SELECT api_key, id FROM $this->table WHERE api_key = ? LIMIT 1");
    if ($this->checkStmt($stmt) && $stmt->bind_param("s", $key) && $stmt->execute() && $stmt->bind_result($api_key, $id) && $stmt->fetch()) {
      if ($api_key === $key)
        return $id;
    }
    header("HTTP/1.1 401 Unauthorized");
    die('Access denied');
  }

  /**
   * Check a password for a user
   * @param username string Username
   * @param password string Password
   * @return bool
   **/
  private function checkUserPassword($username, $password) {
    $this->debug->append("STA " . __METHOD__, 4);
    $user = array();
    $password_hash = $this->getHash($password);
    $stmt = $this->mysqli->prepare(
        "SELECT  ac.username, ac.id, ac.is_admin, ac.avatar, ha.photo_url
        FROM $this->table AS ac
        LEFT JOIN $this->tableHybridAuth as ha ON ha.account_id = ac.id
        WHERE LOWER(ac.username) = LOWER(?) AND ac.pass = ? LIMIT 1");

    if ($this->checkStmt($stmt) && $stmt->bind_param('ss', $username, $password_hash) && $stmt->execute() && $stmt->bind_result($row_username, $row_id, $row_admin, $row_avatar, $photo_url)) {
      $stmt->fetch();
      $stmt->close();
      // Store the basic login information
      $this->user = array(
          'username' => $row_username,
          'id' => $row_id,
          'is_admin' => $row_admin,
          'avatar' => (empty($row_avatar)) ? $photo_url : '/uploads/avatar/' . $row_avatar
      );
      return strtolower($username) === strtolower($row_username);
    }
    return false;
  }

  /**
   * Create a PHP session for a user
   * @param username string Username to create session for
   * @return none
   **/
  private function createSession($username) {
    $this->debug->append("STA " . __METHOD__, 4);
    $this->debug->append("Log in user to _SESSION", 2);
    session_regenerate_id(true);
    $_SESSION['AUTHENTICATED'] = '1';
    // $this->user from checkUserPassword
    $_SESSION['USERDATA'] = $this->user;
  }

  /**
   * Log out current user, destroy the session
   * @param none
   * @return true
   **/
  public function logoutUser($from="") {
    $this->debug->append("STA " . __METHOD__, 4);
    // Unset all of the session variables
    $_SESSION = array();
    // As we're killing the sesison, also kill the cookie!
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
    }
    // Destroy the session.
    session_destroy();
    // Enforce generation of a new Session ID and delete the old
    session_regenerate_id(true);
    // Enforce a page reload and point towards login with referrer included, if supplied
    $port = ($_SERVER["SERVER_PORT"] == "80" or $_SERVER["SERVER_PORT"] == "443") ? "" : (":".$_SERVER["SERVER_PORT"]);
    $location = @$_SERVER['HTTPS'] ? 'https://' . $_SERVER['SERVER_NAME'] . $port . $_SERVER['PHP_SELF'] : 'http://' . $_SERVER['SERVER_NAME'] . $port . $_SERVER['PHP_SELF'];
    if (!empty($from)) $location .= '?page=login&to=' . urlencode($from);
    // if (!headers_sent()) header('Location: ' . $location);
    exit('<meta http-equiv="refresh" content="0; url=' . $location . '"/>');
  }

  /**
   * Get all users for admin panel
   **/
  public function getAllUsers($filter='%') {
    $this->debug->append("STA " . __METHOD__, 4);
    $stmt = $this->mysqli->prepare("
      SELECT
      a.id AS id,
      a.username AS username
      FROM " . $this->getTableName() . " AS a
      WHERE a.username LIKE ?
      GROUP BY username");
    if ($this->checkStmt($stmt) && $stmt->bind_param('s', $filter) && $stmt->execute() && $result = $stmt->get_result()) {
      while ($row = $result->fetch_assoc()) {
        $aData[$row['id']] = $row['username'];
      }
      return $aData;
    }
    return false;
  }

  /**
   * Fetch this classes table name
   * @return table string This classes table name
   **/
  public function getTableName() {
    $this->debug->append("STA " . __METHOD__, 4);
    return $this->table;
  }

  /**
   * Fetch some basic user information to store for later user
   * @param userID int User ID
   * return data array Database fields as used in SELECT
   **/
  public function getUserData($userID) {
    $this->debug->append("STA " . __METHOD__, 4);
    $this->debug->append("Fetching user information for user id: $userID");
    $stmt = $this->mysqli->prepare("
      SELECT
      ac.id, ac.username, ac.pin, ac.api_key, ac.is_admin, ac.is_anonymous, ac.email, ac.no_fees,
      IFNULL(ac.donate_percent, '0') as donate_percent, ac.coin_address, ac.ap_threshold,
      ac.avatar, ac.c_skype, ac.c_vk, ac.c_icq, ha.photo_url
      FROM $this->table AS ac
      LEFT JOIN $this->tableHybridAuth as ha ON ha.account_id = ac.id
      WHERE ac.id = ? LIMIT 0,1");

    if ($this->checkStmt($stmt)) {
      $stmt->bind_param('i', $userID);
      if (!$stmt->execute()) {
        $this->debug->append('Failed to execute statement');
        return false;
      }
      $result = $stmt->get_result();
      $stmt->close();
      return $result->fetch_assoc();
    }
    $this->debug->append("Failed to fetch user information for $userID");
    return false;
  }

  /**
   * Register a new user in the system
   * @param username string Username
   * @param password1 string Password
   * @param password2 string Password verification
   * @param pin int 4 digit PIN code
   * @param email1 string Email address
   * @param email2 string Email confirmation
   * @return bool
   **/
  public function register($username, $password1, $password2, $pin, $email1='', $email2='', $tac='', $strToken='', $byVk = false) {
    $this->debug->append("STA " . __METHOD__, 4);
    if ($tac != 1) {
      $this->setErrorMessage('You need to accept our <a href="'.$_SERVER['PHP_SELF'].'?page=tac" target="_blank">Terms and Conditions</a>');
      return false;
    }
    if (strlen($username) > 40) {
      $this->setErrorMessage('Username exceeding character limit');
      return false;
    }
    if (preg_match('/[^a-z_\-0-9]/i', $username)) {
      $this->setErrorMessage('Username may only contain alphanumeric characters');
      return false;
    }
    if ($this->getEmail($email1)) {
      $this->setErrorMessage( 'This e-mail address is already taken' );
      return false;
    }
    if (strlen($password1) < 8) { 
      $this->setErrorMessage( 'Password is too short, minimum of 8 characters required' );
      return false;
    }
    if ($password1 !== $password2) {
      $this->setErrorMessage( 'Password do not match' );
      return false;
    }

      if (!$byVk) {
        if (empty($email1) || !filter_var($email1, FILTER_VALIDATE_EMAIL)) {
          $this->setErrorMessage( 'Invalid e-mail address' );
          return false;
        }
        if ($email1 !== $email2) {
          $this->setErrorMessage( 'E-mail do not match' );
          return false;
        }
      }
    if (!is_numeric($pin) || strlen($pin) > 4 || strlen($pin) < 4) {
      $this->setErrorMessage( 'Invalid PIN' );
      return false;
    }
    if (isset($strToken) && !empty($strToken)) {
      if ( ! $aToken = $this->token->getToken($strToken, 'invitation')) {
        $this->setErrorMessage('Unable to find token');
        return false;
      }
      // Circle dependency, so we create our own object here
      $invitation = new Invitation();
      $invitation->setMysql($this->mysqli);
      $invitation->setDebug($this->debug);
      $invitation->setUser($this);
      $invitation->setConfig($this->config);
      if (!$invitation->setActivated($aToken['id'])) {
        $this->setErrorMessage('Unable to activate your invitation');
        return false;
      }
      if (!$this->token->deleteToken($strToken)) {
        $this->setErrorMessage('Unable to remove used token');
        return false;
      }
    }
    if ($this->mysqli->query("SELECT id FROM $this->table LIMIT 1")->num_rows > 0) {
      ! $this->setting->getValue('accounts_confirm_email_disabled') ? $is_locked = 1 : $is_locked = 0;
      $is_admin = 0;
      $stmt = $this->mysqli->prepare("
        INSERT INTO $this->table (username, pass, email, pin, api_key, is_locked)
        VALUES (?, ?, ?, ?, ?, ?)
        ");
    } else {
      $is_locked = 0;
      $is_admin = 1;
      $stmt = $this->mysqli->prepare("
        INSERT INTO $this->table (username, pass, email, pin, api_key, is_admin, is_locked)
        VALUES (?, ?, ?, ?, ?, 1, ?)
        ");
    }

    // Create hashed strings using original string and salt
    $password_hash = $this->getHash($password1);
    $pin_hash = $this->getHash($pin);
    $apikey_hash = $this->getHash($username);
    $username_clean = strip_tags($username);

    if ($this->checkStmt($stmt) && $stmt->bind_param('sssssi', $username_clean, $password_hash, $email1, $pin_hash, $apikey_hash, $is_locked) && $stmt->execute()) {
      if (! $this->setting->getValue('accounts_confirm_email_disabled') && $is_admin != 1) {
        if ($token = $this->token->createToken('confirm_email', $stmt->insert_id)) {
          $aData['username'] = $username_clean;
          $aData['token'] = $token;
          $aData['email'] = $email1;
          $aData['subject'] = 'E-Mail verification';
          if (!$this->mail->sendMail('register/confirm_email', $aData)) {
            $this->setErrorMessage('Unable to request email confirmation: ' . $this->mail->getError());
            return false;
          }
          return true;
        } else {
          $this->setErrorMessage('Failed to create confirmation token');
          $this->debug->append('Unable to create confirm_email token: ' . $this->token->getError());
          return false;
        }
      } else {
        return true;
      }
    } else {
      $this->setErrorMessage( 'Unable to register' );
      $this->debug->append('Failed to insert user into DB: ' . $this->mysqli->error);
      if ($stmt->sqlstate == '23000') $this->setErrorMessage( 'Username or email already registered' );
      return false;
    }
    return false;
  }

    /**
     * @param $account_id
     * @param $provider
     * @param $provider_uid
     * @param $email
     * @param $display_name
     * @param $first_name
     * @param $last_name
     * @param $photo_url
     * @param $profile_url
     * @param $website_url
     * @return bool
     */
    public function registerHybridAuth($account_id, $provider, $provider_uid, $email, $display_name, $first_name, $last_name, $photo_url, $profile_url, $website_url)
  {
      $this->debug->append("STA " . __METHOD__, 4);

      $stmt = $this->mysqli->prepare("
        INSERT INTO $this->tableHybridAuth (account_id, provider, provider_uid, email, display_name, first_name, last_name, photo_url, profile_url, website_url)
        VALUES (?, ?, ?, ?, ?, ?, ?, ? ,? ,?)
        ");

      if ($this->checkStmt($stmt) && $stmt->bind_param('isssssssss', $account_id, $provider, $provider_uid, $email, $display_name, $first_name, $last_name, $photo_url, $profile_url, $website_url)) {
          if (!$stmt->execute()) {
              $this->setErrorMessage('Failed to execute statement');
              return false;
          }
          return true;
      }

      $this->setErrorMessage( 'Unable to register' );
      $this->debug->append('Failed to insert user into DB: ' . $this->mysqli->error);
      if ($stmt->sqlstate == '23000') $this->setErrorMessage( 'Username or email already registered' );
      return false;

  }

  /**
   * User a one time token to reset a password
   * @param token string one time token
   * @param new1 string New password
   * @param new2 string New password verification
   * @return bool
   **/
  public function resetPassword($token, $new1, $new2) {
    $this->debug->append("STA " . __METHOD__, 4);
    if ($aToken = $this->token->getToken($token, 'password_reset')) {
      if ($new1 !== $new2) {
        $this->setErrorMessage( 'New passwords do not match' );
        return false;
      }
      if ( strlen($new1) < 8 ) { 
        $this->setErrorMessage( 'New password is too short, please use more than 8 chars' );
        return false;
      }
      $new_hash = $this->getHash($new1);
      $stmt = $this->mysqli->prepare("UPDATE $this->table SET pass = ? WHERE id = ?");
      if ($this->checkStmt($stmt) && $stmt->bind_param('si', $new_hash, $aToken['account_id']) && $stmt->execute() && $stmt->affected_rows === 1) {
        if ($this->token->deleteToken($aToken['token'])) {
          return true;
        } else {
          $this->setErrorMessage('Unable to invalidate used token');
        }
      } else {
        $this->setErrorMessage('Unable to set new password');
      }
    } else {
      $this->setErrorMessage('Invalid token: ' . $this->token->getError());
    }
    $this->debug->append('Failed to update password:' . $this->mysqli->error);
    return false;
  }

  /**
   * Reset a password by sending a password reset mail
   * @param username string Username to reset password for
   * @return bool
   **/
  public function initResetPassword($username) {
    $this->debug->append("STA " . __METHOD__, 4);
    // Fetch the users mail address
    if (empty($username)) {
      $this->serErrorMessage("Username must not be empty");
      return false;
    }
    if (filter_var($username, FILTER_VALIDATE_EMAIL)) {
      $this->debug->append("Username is an e-mail: $username", 2);
      if (!$username = $this->getUserNameByEmail($username)) {
        $this->setErrorMessage("Invalid username or password.");
        return false;
      }
    }
    if (!$aData['email'] = $this->getUserEmail($username, true)) {
      $this->setErrorMessage("Unable to find a mail address for user $username");
      return false;
    }
    if (!$aData['token'] = $this->token->createToken('password_reset', $this->getUserId($username, true))) {
      $this->setErrorMessage('Unable to setup token for password reset');
      return false;
    }
    $aData['username'] = $this->getUserName($this->getUserId($username, true));
    $aData['subject'] = 'Password Reset Request';
    if ($this->mail->sendMail('password/reset', $aData)) {
        return true;
      } else {
        $this->setErrorMessage('Unable to send mail to your address');
        return false;
      }
    return false;
  }

  /**
   * Check if a user is authenticated and allowed to login
   * Checks the $_SESSION for existing data
   * Destroys the session if account is now locked
   * @param none
   * @return bool
   **/
  public function isAuthenticated($logout=true) {
    $this->debug->append("STA " . __METHOD__, 4);
    if (@$_SESSION['AUTHENTICATED'] == true &&
        !$this->isLocked($_SESSION['USERDATA']['id']) &&
        $this->getUserIp($_SESSION['USERDATA']['id']) == $_SERVER['REMOTE_ADDR']
      ) return true;
    // Catchall
    if ($logout == true) $this->logoutUser($_SERVER['REQUEST_URI']);
    return false;
  }

    /**
     * @param $str
     * @return string
     */
    private function ru2lat($str)
    {
        $tr = array(
            "А"=>"a", "Б"=>"b", "В"=>"v", "Г"=>"g", "Д"=>"d",
            "Е"=>"e", "Ё"=>"yo", "Ж"=>"zh", "З"=>"z", "И"=>"i",
            "Й"=>"j", "К"=>"k", "Л"=>"l", "М"=>"m", "Н"=>"n",
            "О"=>"o", "П"=>"p", "Р"=>"r", "С"=>"s", "Т"=>"t",
            "У"=>"u", "Ф"=>"f", "Х"=>"kh", "Ц"=>"ts", "Ч"=>"ch",
            "Ш"=>"sh", "Щ"=>"sch", "Ъ"=>"", "Ы"=>"y", "Ь"=>"",
            "Э"=>"e", "Ю"=>"yu", "Я"=>"ya", "а"=>"a", "б"=>"b",
            "в"=>"v", "г"=>"g", "д"=>"d", "е"=>"e", "ё"=>"yo",
            "ж"=>"zh", "з"=>"z", "и"=>"i", "й"=>"j", "к"=>"k",
            "л"=>"l", "м"=>"m", "н"=>"n", "о"=>"o", "п"=>"p",
            "р"=>"r", "с"=>"s", "т"=>"t", "у"=>"u", "ф"=>"f",
            "х"=>"kh", "ц"=>"ts", "ч"=>"ch", "ш"=>"sh", "щ"=>"sch",
            "ъ"=>"", "ы"=>"y", "ь"=>"", "э"=>"e", "ю"=>"yu",
            "я"=>"ya", " "=>"-", "."=>"", ","=>"", "/"=>"-",
            ":"=>"", ";"=>"","—"=>"", "–"=>"-"
        );
        return strtr($str,$tr);
    }
}

// Make our class available automatically
$user = new User();
$user->setDebug($debug);
$user->setMysql($mysqli);
$user->setSalt(SALT);
$user->setConfig($config);
$user->setMail($mail);
$user->setToken($oToken);
$user->setBitcoin($bitcoin);
$user->setSetting($setting);
$user->setErrorCodes($aErrorCodes);
