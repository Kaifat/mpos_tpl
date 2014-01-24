<form action="{$smarty.server.PHP_SELF}" method="POST">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input type="hidden" name="do" value="save">

    <div class="col-md-4">
        <div class="box border blue">
            <div class="box-title"><h4>Notification Settings</h4></div>
            <div class="box-body">

                <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                    <tr>
                        <th align="left">Type</th>
                        <th align="center">Active</th>
                    </tr>
                    <tr>
                        <div class="control-group">
                            <div class="controls">
                                <td><label for="data[idle_worker]">IDLE Worker</label></td>
                                <td>
                                    <input type="hidden" name="data[idle_worker]" value="0"/>
                                    <div class="make-switch radio1 radio-no-uncheck-square-o" data-on="warning">
                                        <input id="data[idle_worker]" type="radio" name="data[idle_worker]" value="1"{nocache}{if $SETTINGS['idle_worker']}checked{/if}{/nocache}>
                                    </div>
                                </td>
                            </div>
                        </div>
                    </tr>
                    <tr>
                        <div class="control-group">
                            <div class="controls">
                                <td><label for="data[new_block]">New Blocks</label></td>
                                <td>
                                    <input type="hidden" name="data[new_block]" value="0"/>
                                    <div class="make-switch radio1 radio-no-uncheck-square-o" data-on="warning">
                                    <input id="data[new_block]" type="radio" name="data[new_block]" value="1"{nocache}{if $SETTINGS['new_block']} checked{/if}{/nocache}>
                                    </div>
                                </td>
                            </div>
                        </div>
                    </tr>
                    <tr>
                        <div class="control-group">
                            <div class="controls">
                                <td><label for="data[auto_payout]">Auto Payout</label></td>
                                <td>
                                    <input type="hidden" name="data[auto_payout]" value="0"/>
                                    <div class="make-switch radio1 radio-no-uncheck-square-o" data-on="warning">
                                        <input id="data[auto_payout]" type="radio" name="data[auto_payout]" value="1"{nocache}{if $SETTINGS['auto_payout']}checked{/if}{/nocache}>
                                    </div>
                                </td>
                            </div>
                        </div>
                    </tr>
                    <tr>
                        <div class="control-group">
                            <div class="controls">
                                <td><label for="data[manual_payout]">Manual Payout</label></td>
                                <td>
                                    <input type="hidden" name="data[manual_payout]" value="0"/>
                                    <div class="make-switch radio1 radio-no-uncheck-square-o" data-on="warning">
                                        <input id="data[manual_payout]" type="radio" name="data[manual_payout]" value="1"{nocache}{if $SETTINGS['manual_payout']}checked{/if}{/nocache}>
                                    </div>
                                </td>
                            </div>
                        </div>
                    </tr>


                </table>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-info" type="submit" value="Update" >
                </div>
            </div>
        </div>
    </div>
</form>

<div class="col-md-8">
    <div class="box border blue">
        <div class="box-title"><h4>Notification History</h4></div>
        <div class="box-body">
            <table id="datatable2" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                <thead style="font-size:13px;">
                <tr>
                    <th align="center" style="cursor: pointer;">ID</th>
                    <th align="center" style="cursor: pointer;">Time</th>
                    <th align="center" style="cursor: pointer;">Type</th>
                    <th align="center" style="cursor: pointer;">Active</th>
                </tr>
                </thead>
                <tbody style="font-size:12px;">
                {section notification $NOTIFICATIONS}
                <tr class="{cycle values="odd,even"}">
                    <td align="center">{$NOTIFICATIONS[notification].id}</td>
                    <td align="center">{$NOTIFICATIONS[notification].time}</td>
                    <td align="center">
                        {if $NOTIFICATIONS[notification].type == new_block}New Block
                            {elseif $NOTIFICATIONS[notification].type == auto_payout}Auto Payout
                            {elseif $NOTIFICATIONS[notification].type == idle_worker}IDLE Worker
                            {elseif $NOTIFICATIONS[notification].type == manual_payout}Manual Payout
                        {/if}
                    </td>
                    <td align="center">
                        <i class="icon-{if $NOTIFICATIONS[notification].active}ok{else}cancel{/if}"></i>
                    </td>
                </tr>
                {/section}
                </tbody>
            </table>
        </div>
    </div>
</div>