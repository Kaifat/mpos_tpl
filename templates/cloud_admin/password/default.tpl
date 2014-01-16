<div class="col-md-6">
    <div class="box border blue">
        <div class="box-title"><h4>Password reset</h4></div>
        <div class="box-body">
            <div class="login-box-inline">
                <form action="" method="POST">
                    <input type="hidden" name="page" value="password">
                    <input type="hidden" name="action" value="reset">
                    <p class="center">If you have an email set for your account, enter your username to get your password reset</p>
                    <div class="form-group">
                        <label>Username or E-Mail</label>
                        <i class="fa fa-envelope"></i>
                        <input class="form-control" type="text" name="username"
                               value="{$smarty.post.username|escape|default:""}" size="22" maxlength="100" required>
                    </div>
                    <div class="submit_link form-actions">
                        <input class="btn btn-info btn-block" type="submit" value="Send Me Reset Instructions" class="alt_btn">
                    </div>
                    <div class="login-helpers">
                        <a href="{$smarty.server.PHP_SELF}?page=login"> Back to Login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
