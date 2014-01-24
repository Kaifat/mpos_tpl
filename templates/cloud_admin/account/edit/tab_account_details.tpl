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
                            <input class="btn btn-info" type="submit" value="Update Account">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!-- /ACCOUNT DETAILS -->