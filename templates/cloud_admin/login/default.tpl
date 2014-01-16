<div class="col-md-6">
    <div class="box border blue">
        <div class="box-title"><h4>&nbsp</h4></div>
        <div class="box-body">
            <div class="tabbable header-tabs">
                <ul class="nav nav-tabs">
                    <li class="width"><a href="#tab_sign_up" data-toggle="tab"><i class="fa fa-desktop"></i> <span
                            class="hidden-inline-mobile">Sign up</span></a></li>
                    <li class="active"><a href="#tab_sign_in" data-toggle="tab"><i class="fa fa-flask"></i> <span
                            class="hidden-inline-mobile">Sign in</span></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab_sign_in">
                        <div class="login-box-inline">
                            <form action="{$smarty.server.PHP_SELF}?page=login" method="post" id="loginForm">
                                <input type="hidden" name="to"
                                       value="{($smarty.request.to|default:"{$smarty.server.PHP_SELF}?page=dashboard")|escape}"/>

                                <div class="divide-20"></div>
                                <div class="col-md-12">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Username or E-Mail</label>
                                            <i class="fa fa-envelope"></i>
                                            <input class="form-control" type="text" name="username" size="22"
                                                   maxlength="100"
                                                   value="{$smarty.request.username|default:""|escape}"
                                                   placeholder="Your username or email"
                                                   required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <i class="fa fa-lock"></i>
                                            <input class="form-control" type="password" name="password" size="22"
                                                   maxlength="100"
                                                   placeholder="Your password"
                                                   required/>
                                        </div>
                                        <div class="submit_link form-actions">
                                            <label class="checkbox"> <input type="checkbox" class="uniform" value="">
                                                Remember me</label>
                                            <input class="btn btn-danger btn-block" type="submit" value="Login"
                                                   class="alt_btn"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- SOCIAL LOGIN -->
                        <div class="login-box-inline">
                            <div class="divide-20"></div>
                            <div class="center">
                                <strong>Or login using your social account</strong>
                            </div>
                            <div class="divide-20"></div>
                            <div class="social-login center">
                                <a class="btn btn-primary btn-lg">
                                    <i class="fa fa-facebook"></i>
                                </a>
                                <a class="btn btn-info btn-lg">
                                    <i class="fa fa-twitter"></i>
                                </a>
                                <a class="btn btn-danger btn-lg">
                                    <i class="fa fa-google-plus"></i>
                                </a>
                            </div>
                            <!-- /SOCIAL LOGIN -->
                            <div class="login-helpers center">
                                <a href="{$smarty.server.PHP_SELF}?page=password">Forgot Password?</a> <br>
                                Don't have an account with us? <a href="#"
                                                                  onclick="swapScreen('register');return false;">Register
                                now!</a>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab_sign_up">
                        <div class="login-box-inline">
                            <form action="{$smarty.server.PHP_SELF}" method="post">
                                <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                            {if $smarty.request.token|default:""}
                                <input type="hidden" name="token" value="{$smarty.request.token|escape}"/>
                            {/if}
                                <input type="hidden" name="action" value="register">

                                <div class="divide-20"></div>
                                <div class="col-md-12">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Username</label>
                                            <i class="fa fa-user"></i>
                                            <input class="form-control" type="text" class="text tiny"
                                                   name="username"
                                                   value="{$smarty.post.username|escape|default:""}" size="15"
                                                   maxlength="20" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <i class="fa fa-lock"></i>
                                            <input class="form-control" type="password" class="text tiny"
                                                   name="password1" value="" size="15" maxlength="100"
                                                   required>
                                            <label>Repeat Password</label>
                                            <i class="fa fa-lock"></i>
                                            <input class="form-control" type="password" class="text tiny"
                                                   name="password2" value="" size="15" maxlength="100"
                                                   required>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <i class="fa fa-envelope"></i>
                                            <input class="form-control" type="text" name="email1" class="text small"
                                                   value="{$smarty.post.email1|escape|default:""}"
                                                   size="15" required>
                                            <label>Email Repeat</label>
                                            <i class="fa fa-envelope"></i>
                                            <input class="form-control" type="text" class="text small" name="email2"
                                                   value="{$smarty.post.email2|escape|default:""}"
                                                   size="15" required>
                                        </div>
                                        <div class="form-group">
                                            <label>PIN</label>
                                            <i class="fa fa-lock"></i>
                                            <input class="form-control" type="password" class="text pin" name="pin"
                                                   value="" size="4" maxlength="4"><font size="1">
                                            (4 digit number. <b>Remember this pin!</b>)</font>
                                        </div>
                                        <div class="form-group form-actions center">
                                            <label>Terms and Conditions</label><br><a style="width:152px;"
                                                                                      onclick="TINY.box.show({literal}{url:'?page=tacpop',height:500}{/literal})"><font size="1">Accept Terms and Conditions</font></a>
                                            <input type="checkbox" value="1" name="tac" id="tac">
                                            <label for="tac" style="margin:1px 0px 0px -20px"></label>

                                            <center>{nocache}{$RECAPTCHA|default:""}{/nocache}</center>
                                            <div class="divide-20"></div>
                                            <div class="submit_link">
                                                <input class="btn btn-success btn-block" type="submit" value="Register"
                                                       class="alt_btn">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- SOCIAL LOGIN -->
                        <div class="login-box-inline">
                            <div class="divide-20"></div>
                            <div class="center">
                                <strong>Or login using your social account</strong>
                            </div>
                            <div class="divide-20"></div>
                            <div class="social-login center">
                                <a class="btn btn-primary btn-lg">
                                    <i class="fa fa-facebook"></i>
                                </a>
                                <a class="btn btn-info btn-lg">
                                    <i class="fa fa-twitter"></i>
                                </a>
                                <a class="btn btn-danger btn-lg">
                                    <i class="fa fa-google-plus"></i>
                                </a>
                            </div>
                            <!-- /SOCIAL LOGIN -->
                            <div class="login-helpers">
                                <a href="{$smarty.server.PHP_SELF}?page=login"> Back to Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



