{if $smarty.session.AUTHENTICATED|default:"0" == 0}
    <form role="form" class="form-inline" action="{$smarty.server.PHP_SELF}" method="post" id="loginForm">
        <input type="hidden" name="page" value="login"/>
        <input type="hidden" name="to" value="{$smarty.server.PHP_SELF}?page=dashboard"/>

        <div class="form-group">
            <label for="inputUsername" class="sr-only">Username or E-Mail</label>
            <input name="username" type="text" placeholder="Username or E-Mail" id="inputUsername" class="form-control">
        </div>
        <div class="form-group">
            <label for="inputPassword" class="sr-only">Password</label>
            <input name="password" type="password" placeholder="Password" id="inputPassword" class="form-control">
        </div>
        <input class="btn btn-inverse" type="submit" value="Sign in">
        <a href="{$smarty.server.PHP_SELF}?page=register" class="btn btn-info">Sign up</a>
    </form>
{/if}
