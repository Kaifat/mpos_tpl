<div class="col-md-6">
    <div class="box border blue">
        <div class="box-title"><h4>Select Coin</h4></div>
        <form action="{$smarty.server.PHP_SELF}" method="post">
            <div class="box-body">
                <div class="form-group">
                    <div class="submit_link">
                        <input class="btn btn-success btn-block" type="submit" value="EarthCoin" class="alt_btn">
                    </div>
                </div>
                <div class="form-group">
                    <div class="submit_link">
                        <input class="btn btn-success btn-block" type="submit" value="DogeCoin" class="alt_btn">
                    </div>
                </div>
                <div class="form-group">
                    <div class="submit_link">
                        <input class="btn btn-success btn-block" type="submit" value="DigitalCoin" class="alt_btn">
                    </div>
                </div>
                <div class="form-group">
                    <div class="submit_link">
                        <input class="btn btn-success btn-block" type="submit" value="FastCoin" class="alt_btn">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>






<div class="col-md-6">
    <div class="box border blue">
        <div class="box-title"><h4>Mining and Profit Calculator</h4></div>
        <div class="login-box-inline">
            <form action="{$smarty.server.PHP_SELF}" method="post">
                <div class="box-body">
                    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                    <input type="hidden" name="do" value="add">

                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Hash Rate (KH/s):</label>
                                <i class="fa fa-user"></i>
                                <input class="form-control" type="text" name="username" placeholder="1000.00" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Power (Watts):</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" placeholder="500.00" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Power Cost ($/kWh):</label>
                                <i class="fa fa-lightbulb-o"></i>
                                <input class="form-control" type="text" name="username" placeholder="0.10" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Pool Fees %:</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" placeholder="0.00" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Difficulty:</label>
                                <i class="fa fa-user"></i>
                                <input class="form-control" type="text" name="username" placeholder="0.31337267" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Block Reward:</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" placeholder="50.00000000" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Exchange Rate:</label>
                                <i class="fa fa-user"></i>
                                <input class="form-control" type="text" name="username" placeholder="0.00000480" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Hardware Costs (USD):</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" placeholder="0.00" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="toolbox bottom">
                    <div class="submit_link">
                        <input class="btn btn-info" type="submit" value="Calculate" class="alt_btn">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="box border blue">
        <div class="box-title"><h4>Summary</h4></div>
        <div class="box-body center">
        <p>Days to generate one block mining solo: <strong><span>0.02</span> Day(s)</strong> (can vary greatly depending on your luck)</p>
        <p>Days to generate one BTC: <strong><span>64.91</span> Day(s)</strong> (can vary greatly depending on the current exchange rates)
        </p>
        <p>Days to break even: <strong><span>0.00</span> Day(s)</strong> (can vary greatly depending on the current exchange rates)
        </p>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="box border blue">
        <div class="box-title"><h4>Estimated Expected Earnings</h4></div>
        <div class="box-body">
            <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-striped">
                <thead>
                <tr>
                    <th align="center">Time Frame</th>
                    <th><span>ALF</span> Coins</th>
                    <th>BTC (ANC/BTC at 0.00469115)</th>
                    <th align="center">USD (BTC at $962.31)</th>
                    <th>Power Cost (in USD)</th>
                    <th>Pool Fees (in USD)</th>
                    <th>Profit (in USD)</th>
                </tr>
                </thead>
                <tbody style="font-size:12px;">
                <tr>
                    <td>Hourly</td>
                </tr>
                <tr>
                    <td>Daily</td>
                </tr>
                <tr>
                    <td>Weekly</td>
                </tr>
                <tr>
                    <td>Monthly</td>
                </tr>
                <tr>
                    <td>Annually</td>
                </tr>
                {section transaction $TRANSACTIONS}
                <tr class="{cycle values="odd,even"}">
                    <td align="center">{$TRANSACTIONS[transaction].id}</td>
                    <td>{$TRANSACTIONS[transaction].timestamp}</td>
                    <td>{$TRANSACTIONS[transaction].type}</td>
                    <td align="center">
                        {if $TRANSACTIONS[transaction].type == 'Credit_PPS' OR
                        $TRANSACTIONS[transaction].type == 'Fee_PPS' OR
                        $TRANSACTIONS[transaction].type == 'Donation_PPS' OR
                        $TRANSACTIONS[transaction].type == 'Debit_MP' OR
                        $TRANSACTIONS[transaction].type == 'Debit_AP' OR
                        $TRANSACTIONS[transaction].type == 'TXFee' OR
                        $TRANSACTIONS[transaction].confirmations >= $GLOBAL.confirmations
                        }<span class="confirmed">Confirmed</span>
                            {else if $TRANSACTIONS[transaction].confirmations == -1}<span class="orphan">Orphaned</span>
                            {else}<span class="unconfirmed">Unconfirmed</span>{/if}
                    </td>
                    <td><a href="#"
                           onClick="alert('{$TRANSACTIONS[transaction].coin_address|escape}')">{$TRANSACTIONS[transaction].coin_address|truncate:20:"...":true:true}</a>
                    </td>
                    {if ! $GLOBAL.website.transactionexplorer.disabled}
                        <td><a href="{$GLOBAL.website.transactionexplorer.url}{$TRANSACTIONS[transaction].txid|escape}"
                               title="{$TRANSACTIONS[transaction].txid|escape}">{$TRANSACTIONS[transaction].txid|truncate:20:"...":true:true}</a>
                        </td>
                        {else}
                        <td><a href="#" onClick="alert('{$TRANSACTIONS[transaction].txid|escape}')"
                               title="{$TRANSACTIONS[transaction].txid|escape}">{$TRANSACTIONS[transaction].txid|truncate:20:"...":true:true}</a>
                        </td>
                    {/if}
                    <td>{if $TRANSACTIONS[transaction].height == 0}n/a{else}<a
                            href="{$smarty.server.PHP_SELF}?page=statistics&action=round&height={$TRANSACTIONS[transaction].height}">{$TRANSACTIONS[transaction].height}</a>{/if}
                    </td>
                    <td><font
                            color="{if $TRANSACTIONS[transaction].type == 'Credit' or $TRANSACTIONS[transaction].type == 'Credit_PPS' or $TRANSACTIONS[transaction].type == 'Bonus'}green{else}red{/if}">{$TRANSACTIONS[transaction].amount|number_format:"8"}
                    </td>
                </tr>
                {/section}
                </tbody>
            </table>
        </div>
        <div class="toolbox bottom">
            <p style="margin-left: 25px; font-size: 11px;"><b>Debit_AP</b> = Auto Threshold Payment,&nbsp;&nbsp;&nbsp;<b>Debit_MP</b> = Manual Payment,&nbsp;&nbsp;&nbsp;<b>Donation</b> = Donation,&nbsp;&nbsp;&nbsp;<b>Fee</b> = Pool Fees (if applicable)</p>
        </div>
    </div>
</div>

