<form action="{$smarty.server.PHP_SELF}" method="post">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input type="hidden" name="do" value="updateAccount">

    <div class="col-md-6">
        <div class="box border">
            <div class="box-title"><h4>Account Details</h4></div>
            <div class="box-body">
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
                    <input class="form-control" type="text" name="email" value="{nocache}{$GLOBAL.userdata.email|escape}{/nocache}"
                           size="20"/>
                </div>
                <div class="form-group">
                    <label>Payment Address</label>
                    <input class="form-control" type="text" name="paymentAddress"
                           value="{nocache}{$smarty.request.paymentAddress|default:$GLOBAL.userdata.coin_address|escape}{/nocache}"
                           size="40"/>
                </div>
                <div class="form-group">
                    <label>Donation Percentage</label>
                    <font size="1"> Donation amount in percent (example: 0.5)</font>
                    <input class="form-control" type="text" name="donatePercent"
                           value="{nocache}{$smarty.request.donatePercent|default:$GLOBAL.userdata.donate_percent|escape}{/nocache}"
                           size="4"/>
                </div>
                <div class="form-group">
                    <label>Automatic Payout Threshold</label>
                    <font size="1">{$GLOBAL.config.ap_threshold.min}
                        -{$GLOBAL.config.ap_threshold.max} {$GLOBAL.config.currency}. Set to '0' for no auto
                        payout.</font>
                    <input class="form-control" type="text" name="payoutThreshold"
                           value="{$smarty.request.payoutThreshold|default:$GLOBAL.userdata.ap_threshold|escape}"
                           size="{$GLOBAL.config.ap_threshold.max|strlen}"
                           maxlength="{$GLOBAL.config.ap_threshold.max|strlen}"/>
                </div>
                <div class="form-group">
                    <label>Anonymous Account</label>
                    Hide username on website from others. Admins can still get your user information.
                    <label class="checkbox" for="is_anonymous">
                        <input class="ios-switch" type="hidden" name="is_anonymous" value="0"/>
                        <input class="ios-switch" type="checkbox" name="is_anonymous" value="1" id="is_anonymous"
                               {if $GLOBAL.userdata.is_anonymous}checked{/if} />

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
                    <input class="btn btn-inverse" type="submit" value="Update Account" class="alt_btn">
                </div>
            </div>
        </div>
    </div>
</form>

{if !$GLOBAL.config.disable_payouts && !$GLOBAL.config.disable_manual_payouts}
<form action="{$smarty.server.PHP_SELF}" method="post">
    <input class="form-control" type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input class="form-control" type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input class="form-control" type="hidden" name="do" value="cashOut">

    <div class="col-md-6">
        <div class="box border">
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
                    <input class="btn btn-inverse" type="submit" value="Cash Out" class="alt_btn">
                </div>
            </div>
        </div>
    </div>
</form>
{/if}

<form action="{$smarty.server.PHP_SELF}" method="post"><input class="form-control" type="hidden" name="act" value="updatePassword">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input type="hidden" name="do" value="updatePassword">

    <div class="col-md-6">
        <div class="box border">
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
                    <input class="btn btn-inverse" type="submit" value="Change Password" class="alt_btn">
                </div>
            </div>
        </div>
    </div>
</form>


<form action="{$smarty.server.PHP_SELF}" method="post">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input type="hidden" name="do" value="genPin">

    <div class="col-md-6">
        <div class="box border">
            <div class="box-title"><h4>Reset PIN</h4></div>
            <div class="box-body">
                <div class="form-group">
                    <label>Current Password</label>
                    <input class="form-control" type="password" name="currentPassword"/>
                </div>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-inverse" type="submit" class="alt_btn" value="Reset PIN">
                </div>
            </div>
        </div>
    </div>
</form>
