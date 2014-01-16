{if $smarty.session.AUTHENTICATED|default:"0" == 0}
<div class="login-box-inline">
    <form role="form" class="form-inline" action="{$smarty.server.PHP_SELF}" method="post" id="loginForm">
        <input type="hidden" name="page" value="login"/>
        <input type="hidden" name="to" value="{$smarty.server.PHP_SELF}?page=dashboard"/>

        <div class="form-group">
            <label for="inputUsername" class="sr-only">Username or E-Mail</label>
            <i class="fa fa-envelope"></i>
            <input name="username" type="text" placeholder="Username or E-Mail" id="inputUsername" class="form-control">
        </div>
        <div class="form-group">
            <label for="inputPassword" class="sr-only">Password</label>
            <i class="fa fa-lock"></i>
            <input name="password" type="password" placeholder="Password" id="inputPassword" class="form-control">
        </div>
        <input class="btn btn-info" type="submit" value="Sign in">
        <a href="{$smarty.server.PHP_SELF}?page=login" class="btn btn-success">Sign up</a>
    </form>
</div>
{/if}
