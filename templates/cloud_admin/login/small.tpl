{if $smarty.session.AUTHENTICATED|default:"0" == 0}

<form role="form" class="form-inline" action="{$smarty.server.PHP_SELF}" method="post" id="loginForm">
    <input type="hidden" name="page" value="login" />
    <input type="hidden" name="to" value="{$smarty.server.PHP_SELF}?page=dashboard" />
    <div class="form-group">
        <label for="inputUsername" class="col-sm-3 control-label">Username</label>
        <div class="col-sm-9">
            <input type="email" placeholder="Username" id="inputUsername" name="username" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword" class="col-sm-3 control-label">Password</label>
        <div class="col-sm-9">
            <input type="password" placeholder="Password" id="inputPassword" name="password" class="form-control">
        </div>
    </div>
    <input type="submit" value="Sign in" class="btn btn-inverse" />
  </form>
{/if}
