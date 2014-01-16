<div class="login-box-inline">
<form action="{$smarty.server.PHP_SELF}" method="post">
    <div class="col-md-6">
        <div class="box border blue">
            <div class="box-title"><h4>Register new account</h4></div>
            <div class="box-body">
                <input type="hidden" name="page" value="{$smarty.request.page|escape}">
            {if $smarty.request.token|default:""}
                <input type="hidden" name="token" value="{$smarty.request.token|escape}"/>
            {/if}
                <input type="hidden" name="action" value="register">

                <div class="form-group">
                    <label>Username</label>
                    <i class="fa fa-user"></i>
                    <input class="form-control" type="text" class="text tiny" name="username"
                           value="{$smarty.post.username|escape|default:""}" size="15" maxlength="20" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <i class="fa fa-lock"></i>
                    <input class="form-control" type="password" class="text tiny" name="password1" value="" size="15" maxlength="100"
                           required>
                    <label>Repeat Password</label>
                    <i class="fa fa-lock"></i>
                    <input class="form-control" type="password" class="text tiny" name="password2" value="" size="15" maxlength="100"
                           required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <i class="fa fa-envelope"></i>
                    <input class="form-control" type="text" name="email1" class="text small" value="{$smarty.post.email1|escape|default:""}"
                           size="15" required>
                    <label>Email Repeat</label>
                    <i class="fa fa-envelope"></i>
                    <input class="form-control" type="text" class="text small" name="email2" value="{$smarty.post.email2|escape|default:""}"
                           size="15" required>
                </div>
                <div class="form-group">
                    <label>PIN</label>
                    <i class="fa fa-lock"></i>
                    <input class="form-control" type="password" class="text pin" name="pin" value="" size="4" maxlength="4"><font size="1">
                    (4 digit number. <b>Remember this pin!</b>)</font>
                </div>
                <div class="form-group">
                    <label>Terms and Conditions</label><a style="width:152px;"
                                                          onclick="TINY.box.show({literal}{url:'?page=tacpop',height:500}{/literal})"><font
                        size="1">Accept Terms and Conditions</font></a>
                    <input type="checkbox" value="1" name="tac" id="tac">
                    <label for="tac" style="margin:1px 0px 0px -20px"></label>
                </div>
                <center>{nocache}{$RECAPTCHA|default:""}{/nocache}</center>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-info" type="submit" value="Register" class="alt_btn">
                </div>
            </div>
        </div>
    </div>
</form>
</div>
