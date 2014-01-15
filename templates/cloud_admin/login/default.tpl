<div class="col-md-6">
    <div class="box border">
        <div class="box-title"><h4>Login with existing account</h4></div>
        <form action="{$smarty.server.PHP_SELF}?page=login" method="post" id="loginForm">
            <input type="hidden" name="to"
                   value="{($smarty.request.to|default:"{$smarty.server.PHP_SELF}?page=dashboard")|escape}"/>
            <div class="box-body">
                <div class="form-group">
                    <label>Username or E-Mail</label>
                    <input class="form-control" type="text" name="username" size="22" maxlength="100"
                           value="{$smarty.request.username|default:""|escape}" placeholder="Your username or email"
                           required/>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input class="form-control" type="password" name="password" size="22" maxlength="100"
                           placeholder="Your password"
                           required/>
                </div>
                <div class="clear"></div>
            </div>
            <div class="toolbox bottom">
            <div class="submit_link">
                <a href="{$smarty.server.PHP_SELF}?page=password"><font size="1">Forgot your
                    password?</font></a>
                <input class="btn btn-inverse" type="submit" value="Login" class="alt_btn"/>
            </div>
        </form>
    </div>
</div>
