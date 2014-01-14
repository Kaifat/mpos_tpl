<div class="col-md-6">
    <div class="box border">
        <div class="box-title"><h4>Last Found Blocks</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-striped table-hover">
                <thead>
                <tr>
                    <th align="center">Block</th>
                    <th>Finder</th>
                    <th align="center">Time</th>
                    <th align="right" style="padding-right: 25px;">Actual Shares</th>
                </tr>
                </thead>
                <tbody>
                {assign var=rank value=1}
                {section block $BLOCKSFOUND}
                <tr class="{cycle values="odd,even"}">
                    {if ! $GLOBAL.website.blockexplorer.disabled}
                        <td align="center"><a href="{$GLOBAL.website.blockexplorer.url}{$BLOCKSFOUND[block].blockhash}"
                                              target="_new">{$BLOCKSFOUND[block].height}</a></td>
                        {else}
                        <td align="center">{$BLOCKSFOUND[block].height}</td>
                    {/if}
                    <td>{if $BLOCKSFOUND[block].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}
                        anonymous{else}{$BLOCKSFOUND[block].finder|default:"unknown"|escape}{/if}</td>
                    <td align="center">{$BLOCKSFOUND[block].time|date_format:"%d/%m %H:%M:%S"}</td>
                    <td align="right" style="padding-right: 25px;">{$BLOCKSFOUND[block].shares|number_format}</td>
                </tr>
                {/section}
                </tbody>
            </table>
            </div>
        <div class="toolbox bottom">
        {if $GLOBAL.config.payout_system != 'pps'}
            <ul>
                <li>Note: Round Earnings are not credited until <font color="orange">{$GLOBAL.confirmations}</font>
                    confirms.</font></li>
            </ul>
        {/if}
    </div>
