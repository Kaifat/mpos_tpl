<!-- 4 tab - CHANGE PASSWORD -->
<div class="tab-pane fade" id="change_password">
    <form action="{$smarty.server.PHP_SELF}" method="post"><input class="form-control" type="hidden" name="act" value="updatePassword">
        <input type="hidden" name="page" value="{$smarty.request.page|escape}">
        <input type="hidden" name="action" value="{$smarty.request.action|escape}">
        <input type="hidden" name="do" value="updatePassword">

        <div class="col-md-6">
            <div class="box border blue">
                <div class="box-title"><h4>Change Password</h4></div>
                <div class="box-body">
                    <p style="padding-left:30px; padding-redight:30px; font-size:10px;">
                        Note: You will be redirected to login on successful completion of a password change
                    </p>
                    <div class="form-group">
                        <label>Current Password</label>
                        <input class="form-control" type="password" name="currentPassword"/>
                    </div>
                    <div class="form-group">
                        <label>New Password</label>
                        <input class="form-control" type="password" name="newPassword"/>
                    </div>
                    <div class="form-group">
                        <label>New Password Repeat</label>
                        <input class="form-control" type="password" name="newPassword2"/>
                    </div>
                    <div class="form-group">
                        <label>4 digit PIN</label>
                        <input class="form-control" type="password" name="authPin" size="4" maxlength="4"/>
                    </div>
                </div>
                <div class="toolbox bottom">
                    <div class="submit_link">
                        <input class="btn btn-info" type="submit" value="Change Password" class="alt_btn">
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="clearfix"></div>
</div>
<!-- /CHANGE PASSWORD -->