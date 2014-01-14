<div class="col-md-4">
    <div class="box border">
        <div class="box-title"><h4>Account Information</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-hover">
                <tr>
                    <td colspan="2">
                    {if $GLOBAL.userdata.no_fees}
                        You are mining without any pool fees applied and
                        {else if $GLOBAL.fees > 0}
                        You are mining at <font
                            color="orange">{if $GLOBAL.fees < 0.0001}{$GLOBAL.fees|escape|number_format:"8"}{else}{$GLOBAL.fees|escape}{/if}
                        %</font> pool fee and
                        {else}
                        This pool does not apply fees and
                    {/if}
                    {if $GLOBAL.userdata.donate_percent > 0}
                        you donate <font color="green">{$GLOBAL.userdata.donate_percent|escape}%</font>.
                        {else}
                        you are not <a href="{$smarty.server.PHP_SELF}?page=account&action=edit">donating</a>.
                    {/if}
                    </td>
                </tr>
            </table>
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-hover">
                <thead>
                <tr>
                    <th colspan="2"><b>{$GLOBAL.config.currency} Account Balance</b></th>
                </tr>
                </thead>
                <tr>
                    <td align="left" style="font-weight: bold;">Confirmed</td>
                    <td align="right"><span id="b-confirmed" class="confirmed"
                                            style="width: calc(140px); font-size: 12px;">{$GLOBAL.userdata.balance.confirmed|number_format:"6"}</span>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="font-weight: bold;">Unconfirmed</td>
                    <td align="right"><span id="b-unconfirmed" class="unconfirmed"
                                            style="width: calc(140px); font-size: 12px;">{$GLOBAL.userdata.balance.unconfirmed|number_format:"6"}</span>
                    </td>
                </tr>
            </table>
        {if !$DISABLED_DASHBOARD and !$DISABLED_DASHBOARD_API}
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-hover">
                <thead>
                <tr>
                    <th align="left">Worker</th>
                    <th align="right">Hashrate</th>
                    <th align="right" style="padding-right: 10px;">Difficulty</th>
                </tr>
                </thead>
                <tbody id="b-workers">
                <td colspan="3" align="center">No worker information available</td>
                </tbody>
                </tr>
            </table>
        {/if}
        </div>
    </div>
</div>