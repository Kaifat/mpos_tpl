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