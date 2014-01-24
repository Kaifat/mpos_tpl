<div class="col-md-6">
    <div class="box border blue">
        <form action="{$smarty.server.PHP_SELF}" method="post">
            <input type="hidden" name="token" value="{$smarty.request.token|escape}">
            <input type="hidden" name="page" value="{$smarty.request.page|escape}">
            <input type="hidden" name="action" value="{$smarty.request.action|escape}">
            <input type="hidden" name="do" value="resetPassword">
            <div class="box-title"><h4>Password reset</h4></div>
            <div class="box-body">
                <div class="form-group">
                    <label>New Password</label>
                    <input class="form-control" type="password" name="newPassword" required>
                </div>
                <div class="form-group">
                    <label>Repeat New Password</label>
                    <input class="form-control" type="password" name="newPassword2" required>
                </div>
                <div class="clear"></div>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-info" type="submit" value="Change Password" >
                </div>
            </div>
        </form>
    </div>
</div>
