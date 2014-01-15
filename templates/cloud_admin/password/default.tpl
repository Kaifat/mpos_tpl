<div class="col-md-6">
    <div class="box border">
        <form action="" method="POST">
            <input type="hidden" name="page" value="password">
            <input type="hidden" name="action" value="reset">
            <div class="box-title"><h4>Password reset</h4></div>
            <div class="box-body">
                <p>If you have an email set for your account, enter your username to get your password reset</p>
                <div class="form-group">
                    <label>Username or E-Mail</label>
                    <input class="form-control" type="text" name="username"
                           value="{$smarty.post.username|escape|default:""}" size="22" maxlength="100" required>
                </div>
                <div class="clear"></div>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-inverse" type="submit" value="Reset" class="alt_btn">
                </div>
            </div>
        </form>
    </div>
</div>
