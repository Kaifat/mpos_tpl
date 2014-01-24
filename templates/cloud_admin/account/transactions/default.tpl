{if $DISABLE_TRANSACTIONSUMMARY|default:"0" != 1}

<div class="col-md-12">
    <div class="box border blue">
        <div class="box-title"><h4>Transaction Summary</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-striped table-hover">
                <thead>
                <tr>
                    {foreach $SUMMARY as $type=>$total}
                        <th>{$type}</th>
                    {/foreach}
                </tr>
                </thead>
                <tbody>
                <tr>
                    {foreach $SUMMARY as $type=>$total}
                        <td class="right">{$total|number_format:"8"}</td>
                    {/foreach}
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
{/if}

<div class="col-md-12">
    <div class="box border blue">
        <div class="box-title"><h4>Transaction Filter</h4></div>
        <form action="{$smarty.server.PHP_SELF}">
            <div class="box-body">
                <input type="hidden" name="page" value="{$smarty.request.page|escape}"/>
                <input type="hidden" name="action" value="{$smarty.request.action|escape}"/>

                    <ul class="pager">
                        <li class="previous">
                        {if $smarty.request.start|default:"0" > 0}
                            <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&start={$smarty.request.start|escape|default:"0" - $LIMIT}{if $FILTERS|default:""}{$FILTERS}{/if}"
                               class="btn btn-default"><i class="fa fa-chevron-left fa-2x"></i></a>
                            {else}
                            <i class="icon-left-open"></i>
                        {/if}
                        </li>
                        <li class="next">
                            <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&start={$smarty.request.start|escape|default:"0" + $LIMIT}{if $FILTERS|default:""}{$FILTERS}{/if}"
                               class="btn btn-default"><i class="fa fa-chevron-right fa-2x"></i></a>
                        </li>
                    </ul>

                <div class="row">
                    <div class="form-group col-md-6">
                        <label>Type</label>
                    {html_options class="col-md-12" name="filter[type]" options=$TRANSACTIONTYPES selected=$smarty.request.filter.type|default:""}
                    </div>
                    <div class="form-group col-md-6">
                        <label>Status</label>
                    {html_options class="col-md-12" name="filter[status]" options=$TXSTATUS selected=$smarty.request.filter.status|default:""}
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="toolbox bottom center">
                <div class="submit_link">
                    <input class="btn btn-info" type="submit" value="Filter" >
                </div>
            </div>
        </form>
    </div>
</div>

<div class="col-md-12">
    <div class="box border blue">
        <div class="box-title"><h4>Transaction History</h4></div>
        <div class="box-body">
            <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-striped table-hover">
                <thead>
                <tr>
                    <th align="center">ID</th>
                    <th>Date</th>
                    <th>TX Type</th>
                    <th align="center">Status</th>
                    <th>Payment Address</th>
                    <th>TX #</th>
                    <th>Block #</th>
                    <th>Amount</th>
                </tr>
                </thead>
                <tbody style="font-size:12px;">
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
        <p style="margin-left: 25px; font-size: 12px;"><b>Debit_AP</b> = Auto Threshold Payment,&nbsp;&nbsp;&nbsp;<b>Debit_MP</b> = Manual Payment,&nbsp;&nbsp;&nbsp;<b>Donation</b> = Donation,&nbsp;&nbsp;&nbsp;<b>Fee</b> = Pool Fees (if applicable)</p>
        </div>
    </div>
</div>
