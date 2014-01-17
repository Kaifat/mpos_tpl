<div class="col-md-12">
    <!-- BOX -->
    <div class="box border blue">
        <div class="box-title">
            <h4><i class="fa fa-user"></i><span class="hidden-inline-mobile">Hello, {$GLOBAL.userdata.username|escape}!</span></h4>
        </div>
        <div class="box-body">
            <div class="tabbable header-tabs user-profile">
                <ul class="nav nav-tabs">
                    <li><a href="#reset_pin" data-toggle="tab"><i class="fa fa-dot-circle-o"></i> <span class="hidden-inline-mobile">Reset Pin</span></a></li>

                    <li><a href="#change_password" data-toggle="tab"><i class="fa fa-lock"></i> <span class="hidden-inline-mobile">Change password</span></a></li>

                    {if !$GLOBAL.config.disable_payouts && !$GLOBAL.config.disable_manual_payouts}
                    <li><a href="#cash_out" data-toggle="tab"><i class="fa fa-dollar"></i> <span class="hidden-inline-mobile">Cash out</span></a></li>
                    {/if}

                    <li><a href="#account_details" data-toggle="tab"><i class="fa fa-edit"></i> <span class="hidden-inline-mobile">Account Details</span></a></li>

                    <li class="active"><a href="#my_account" data-toggle="tab"><i class="fa fa-user"></i>                         <span class="hidden-inline-mobile">My Account</span></a></li>
                </ul>

                <div class="tab-content">
                    <!-- 1 tab - MY ACCOUNT -->
                    <div class="tab-pane fade in active" id="my_account">
                        <div class="row">
                            <!-- PROFILE PIC -->
                            <div class="col-md-3">
                                <div class="list-group">
                                    <div class="list-group-item zero-padding">
                                        {*<img alt="" class="img-responsive" src="/uploads/avatar/{$GLOBAL.userdata.avatar}">*}
                                        <img alt="" class="img-responsive" src="{$PATH}/img/profile/avatar.jpg">

                                    </div>
                                    <div class="list-group-item profile-details">
                                        <h2>{$GLOBAL.userdata.username|escape}</h2>
                                        <p><i class="fa fa-circle text-green"></i> Online</p>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt laoreet dolore magna aliquam tincidunt erat volutpat laoreet dolore magna aliquam tincidunt erat volutpat.</p>
                                        <p><a href="#">www.jenniferblogs.com</a></p>
                                        <ul class="list-inline">
                                            <li><i class="fa fa-facebook fa-2x"></i></li>
                                            <li><i class="fa fa-twitter fa-2x"></i></li>
                                            <li><i class="fa fa-dribbble fa-2x"></i></li>
                                            <li><i class="fa fa-bitbucket fa-2x"></i></li>
                                        </ul>
                                    </div>
                                    <a href="#" class="list-group-item"><i class="fa fa-user fa-fw"></i> Profile</a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge badge-red">9</span>
                                        <i class="fa fa-calendar fa-fw"></i> Events
                                    </a>
                                    <a href="#" class="list-group-item"><i class="fa fa-comment-o fa-fw"></i> Messages</a>
                                    <a href="#" class="list-group-item"><i class="fa fa-picture-o fa-fw"></i> Photos</a>
                                    <a href="#" class="list-group-item"><i class="fa fa-cog fa-fw"></i> Settings</a>
                                </div>
                            </div>
                            <!-- /PROFILE PIC -->
                            <!-- PROFILE DETAILS -->
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="col-md-8">
                                        <form action="{$smarty.server.PHP_SELF}" method="post">
                                            <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                                            <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                                            <input type="hidden" name="do" value="updateContacts">

                                            <div class="box border blue">
                                                <div class="box-title"><h4>Contacts</h4></div>
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <label>Skype</label>
                                                        <input name="c_skype" class="form-control" type="text" value="{$GLOBAL.userdata.c_skype|escape}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>VK</label>
                                                        http://vk.com/<input name="c_vk" class="form-control" type="text" value="{$GLOBAL.userdata.c_vk|escape}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>ICQ</label>
                                                        <input name="c_icq" class="form-control" type="text" value="{if $GLOBAL.userdata.c_icq}{$GLOBAL.userdata.c_icq|escape}{/if}" maxlength="9">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>4 digit PIN</label>
                                                        <input class="form-control" type="password" name="authPin" size="4" maxlength="4"/>
                                                    </div>
                                                </div>
                                                <div class="toolbox bottom">
                                                    <div class="submit_link">
                                                        <input class="btn btn-info" type="submit" value="Update Contacts" class="alt_btn">
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /PROFILE DETAILS -->
                        </div>
                    </div>
                    <!-- /MY ACCOUNT -->

                    <!-- 2 tab - ACCOUNT DETAILS -->
                    <div class="tab-pane fade" id="account_details">
                        <div class="col-md-6">
                            <div class="form">
                                <form action="{$smarty.server.PHP_SELF}" method="post">
                                    <div class="box border blue">
                                        <div class="box-title"><h4>Account Details</h4></div>
                                        <div class="box-body">

                                            <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                                            <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                                            <input type="hidden" name="do" value="updateAccount">

                                            <div class="form-group">
                                                <label>Username</label>
                                                <input class="form-control" type="text" value="{$GLOBAL.userdata.username|escape}" readonly>
                                            </div>

                                            <div class="form-group">
                                                  <label>User Id</label>
                                                  <input class="form-control" type="text" value="{$GLOBAL.userdata.id}" readonly/>
                                            </div>

                                            {if !$GLOBAL.website.api.disabled}
                                            <div class="form-group">
                                                <label>API Key</label>
                                                <a href="{$smarty.server.PHP_SELF}?page=api&action=getuserstatus&api_key={$GLOBAL.userdata.api_key}&id={$GLOBAL.userdata.id}">{$GLOBAL.userdata.api_key}</a>
                                            </div>
                                            {/if}

                                            <div class="form-group">
                                                 <label>E-Mail</label>
                                                 <input class="form-control" type="text" name="email" value="{nocache}{$GLOBAL.userdata.email|escape}{/nocache}" size="20"/>
                                            </div>

                                            <div class="form-group">
                                                 <label>Payment Address</label>
                                                 <input class="form-control" type="text" name="paymentAddress" value="{nocache}{$smarty.request.paymentAddress|default:$GLOBAL.userdata.coin_address|escape}{/nocache}" size="40"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Donation Percentage</label>
                                                <font size="1"> Donation amount in percent (example: 0.5)</font>
                                                <input class="form-control" type="text" name="donatePercent" value="{nocache}{$smarty.request.donatePercent|default:$GLOBAL.userdata.donate_percent|escape}{/nocache}" size="4"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Automatic Payout Threshold</label>
                                                <font size="1">{$GLOBAL.config.ap_threshold.min}-{$GLOBAL.config.ap_threshold.max} {$GLOBAL.config.currency}. Set to '0' for no autopayout.</font>
                                                <input class="form-control" type="text" name="payoutThreshold" value="{$smarty.request.payoutThreshold|default:$GLOBAL.userdata.ap_threshold|escape}" size="{$GLOBAL.config.ap_threshold.max|strlen}" maxlength="{$GLOBAL.config.ap_threshold.max|strlen}"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Anonymous Account</label>
                                                Hide username on website from others. Admins can still get your user information.
                                                <label class="checkbox" for="is_anonymous">
                                                    <input class="ios-switch" type="hidden" name="is_anonymous" value="0"/>
                                                    <input class="ios-switch" type="checkbox" name="is_anonymous" value="1" id="is_anonymous" {if $GLOBAL.userdata.is_anonymous}checked{/if} />
                                                    <div class="switch"></div>
                                                </label>
                                            </div>

                                            <div class="form-group">
                                                <label>4 digit PIN</label>
                                                <font size="1">The 4 digit PIN you chose when registering</font>
                                                <input class="form-control" type="password" name="authPin" size="4" maxlength="4">
                                            </div>
                                        </div>

                                        <div class="toolbox bottom">
                                            <div class="submit_link">
                                                <input class="btn btn-info" type="submit" value="Update Account" class="alt_btn">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <!-- /ACCOUNT DETAILS -->

                    {if !$GLOBAL.config.disable_payouts && !$GLOBAL.config.disable_manual_payouts}
                    <!-- 3 tab - CASH OUT -->
                    <div class="tab-pane fade" id="cash_out">
                        <div class="col-md-6">
                            <form action="{$smarty.server.PHP_SELF}" method="post">
                                <input class="form-control" type="hidden" name="page" value="{$smarty.request.page|escape}">
                                <input class="form-control" type="hidden" name="action" value="{$smarty.request.action|escape}">
                                <input class="form-control" type="hidden" name="do" value="cashOut">

                                <div class="box border blue">
                                    <div class="box-title"><h4>Cash Out</h4></div>
                                    <div class="box-body">
                                        <p style="padding-left:30px; padding-redight:30px; font-size:10px;">
                                            Please note:
                                            a {if $GLOBAL.config.txfee > 0.00001}{$GLOBAL.config.txfee}{else}{$GLOBAL.config.txfee|number_format:"8"}{/if} {$GLOBAL.config.currency}
                                            transaction will apply when processing "On-Demand" manual payments
                                        </p>
                                        <div class="form-group">
                                            <label>Account Balance</label>
                                            <input class="form-control" type="text"
                                                   value="{nocache}{$GLOBAL.userdata.balance.confirmed|escape}{/nocache}" {$GLOBAL.config.currency}
                                                   readonly/>
                                        </div>
                                        <div class="form-group">
                                            <label>Payout to</label>
                                            <input class="form-control" type="text" value="{nocache}{$GLOBAL.userdata.coin_address|escape}{/nocache}" readonly/>
                                        </div>
                                        <div class="form-group">
                                            <label>4 digit PIN</label>
                                            <input class="form-control" type="password" name="authPin" size="4" maxlength="4"/>
                                        </div>
                                    </div>
                                    <div class="toolbox bottom">
                                        <div class="submit_link">
                                            <input class="btn btn-info" type="submit" value="Cash Out" class="alt_btn">
                                        </div>
                                    </div>
                            </div>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- /CASH OUT -->
                    {/if}

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

                    <!-- 5 tab - RESET PIN -->
                    <div class="tab-pane fade" id="reset_pin">
                        <form action="{$smarty.server.PHP_SELF}" method="post">
                            <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                            <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                            <input type="hidden" name="do" value="genPin">

                            <div class="col-md-6">
                                <div class="box border blue">
                                    <div class="box-title"><h4>Reset PIN</h4></div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Current Password</label>
                                            <input class="form-control" type="password" name="currentPassword"/>
                                        </div>
                                    </div>
                                    <div class="toolbox bottom">
                                        <div class="submit_link">
                                            <input class="btn btn-info" type="submit" class="alt_btn" value="Reset PIN">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="clearfix"></div>
                    </div>
                    <!-- /RESET PIN -->

                </div>
            </div>
            <!-- /USER PROFILE -->
        </div>
    </div>
</div>
