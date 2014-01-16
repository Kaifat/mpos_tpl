<div class="col-md-4">
    <div class="box border blue">
        <div class="box-title"><h4>Balance Summary</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                <tr>
                    <td align="left">Wallet Balance</td>
                    <td align="left">{$BALANCE|number_format:"8"}</td>
                </tr>
                <tr>
                    <td align="left">Locked for users</td>
                    <td align="left">{$LOCKED|number_format:"8"}</td>
                </tr>
                <tr>
                    <td align="left">Unconfirmed</td>
                    <td align="left">{$UNCONFIRMED|number_format:"8"}</td>
                </tr>
                <tr>
                    <td align="left">Liquid Assets</td>
                    <td align="left">{($BALANCE - $LOCKED)|number_format:"8"}</td>
                </tr>
            {if $NEWMINT >= 0}
                <tr>
                    <td align="left">PoS New Mint</td>
                    <td align="left">{$NEWMINT|number_format:"8"}</td>
                </tr>
            {/if}
            </table>
        </div>
    </div>
</div>

<div class="col-md-8">
    <div class="box border blue">
        <div class="box-title"><h4>Monitoring</h4></div>
        <div class="box-body">
            <table id="datatable2" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                <thead>
                <th align="center">Version</th>
                <th align="center">Protocol Version</th>
                <th align="center">Wallet Version</th>
                <th align="center">Connections</th>
                <th align="center">Errors</th>
                </thead>
                <tbody>
                <tr>
                    <td align="center">{$COININFO.version|default:""}</td>
                    <td align="center">{$COININFO.protocolversion|default:""}</td>
                    <td align="center">{$COININFO.walletversion|default:""}</td>
                    <td align="center">{$COININFO.connections|default:""}</td>
                    <td align="center"><font
                            color="{if $COININFO.errors}red{else}green{/if}">{$COININFO.errors|default:"OK"}</font></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
