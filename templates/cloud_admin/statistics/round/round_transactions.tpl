<div class="col-md-6">
    <div class="box border blue">
        <div class="box-title"><h4>Round Transactions</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                <thead>
                <tr>
                    <th>User Name</th>
                    <th>Type</th>
                    <th>Round Shares</th>
                    <th scope="col">Round %</th>
                    <th>Amount</th>
                </tr>
                </thead>
                <tbody>
                {section txs $ROUNDTRANSACTIONS}
                <tr{if $GLOBAL.userdata.username|default:"" == $ROUNDTRANSACTIONS[txs].username}
                        style="background-color:#99EB99;"{else} class="{cycle values="odd,even"}"{/if}>
                    <td>{if $ROUNDTRANSACTIONS[txs].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}
                        anonymous{else}{$ROUNDTRANSACTIONS[txs].username|default:"unknown"|escape}{/if}</td>
                    <td>{$ROUNDTRANSACTIONS[txs].type|default:""}</td>
                    <td>{$ROUNDSHARES[$ROUNDTRANSACTIONS[txs].uid].valid|number_format}</td>
                    <td>{(( 100 / $BLOCKDETAILS.shares) * $ROUNDSHARES[$ROUNDTRANSACTIONS[txs].uid].valid)|default:"0"|number_format:"2"}</td>
                    <td>{$ROUNDTRANSACTIONS[txs].amount|default:"0"|number_format:"8"}</td>
                </tr>
                {/section}
                </tbody>
            </table>
        </div>
    </div>
</div>
