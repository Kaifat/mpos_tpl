<div class="col-md-6">
    <div class="box border">
        <div class="box-title"><h4>General Statistics</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                <tbody>
                <tr>
                    <th>Pool Hash Rate</th>
                    <td><span
                            id="b-hashrate">{$GLOBAL.hashrate|number_format:"3"}</span> {$GLOBAL.hashunits.pool}</td>
                </tr>
                <tr>
                    <th>Pool Efficiency</th>
                        <td>{if $GLOBAL.roundshares.valid > 0}{($GLOBAL.roundshares.valid / ($GLOBAL.roundshares.valid + $GLOBAL.roundshares.invalid) * 100)|number_format:"2"}
                            %{else}0%{/if}</td>
                </tr>
                <tr>
                    <th>Current Active Workers</th>
                        <td id="b-workers">{$GLOBAL.workers}</td>
                </tr>
                <tr>
                    <th>Current Difficulty</th>
                    {if ! $GLOBAL.website.chaininfo.disabled}
                        <td><a href="{$GLOBAL.website.chaininfo.url}" target="_new"><font size="2"><span
                                id="b-diff">{$NETWORK.difficulty}</span></font></a></td>
                        {else}
                        <td><font size="2"><span id="b-diff">{$NETWORK.difficulty}</span></font></td>
                    {/if}
                </tr>
                <tr>
                    <th>Est. Next Difficulty</th>
                    {if ! $GLOBAL.website.chaininfo.disabled}
                        <td><a href="{$GLOBAL.website.chaininfo.url}" target="_new"><font
                                size="2">{$NETWORK.EstNextDifficulty}  (Change in {$NETWORK.BlocksUntilDiffChange}
                            Blocks)</font></a></td>
                        {else}
                        <td><font size="2">{$NETWORK.EstNextDifficulty} (Change in {$NETWORK.BlocksUntilDiffChange}
                            Blocks)</font></td>
                    {/if}
                </tr>
                <tr>
                    <th>Est. Avg. Time per Round (Network)</th>
                        <td><font size="2">{$NETWORK.EstTimePerBlock|seconds_to_words}</font></td>
                </tr>
                <tr>
                    <th>Est. Avg. Time per Round (Pool)</th>
                        <td>{$ESTTIME|seconds_to_words}</td>
                </tr>
                <tr>
                    <th>Est. Shares this Round</th>
                        <td id="b-target">{$ESTIMATES.shares} (done: {$ESTIMATES.percent}%)</td>
                </tr>
                {if ! $GLOBAL.website.blockexplorer.disabled}
                <tr>
                    <th>Next Network Block</th>
                        <td colspan="3">{$CURRENTBLOCK + 1} &nbsp;&nbsp;<font size="1"> (Current: <a
                                href="{$GLOBAL.website.blockexplorer.url}{$CURRENTBLOCKHASH}"
                                target="_new">{$CURRENTBLOCK})</a></font></td>
                </tr>
                    {else}
                <tr>
                    <th>Next Network Block</th>
                        <td colspan="3">{$CURRENTBLOCK + 1} &nbsp;&nbsp; (Current: {$CURRENTBLOCK})</td>
                </tr>
                {/if}
                <tr>
                    <th>Last Block Found</th>
                        <td colspan="3"><a
                                href="{$smarty.server.PHP_SELF}?page=statistics&action=round&height={$LASTBLOCK}"
                                target="_new">{$LASTBLOCK|default:"0"}</a></td>
                </tr>
                <tr>
                    <th>Time Since Last Block</th>
                        <td colspan="3">{$TIMESINCELAST|seconds_to_words}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="toolbox bottom">
        {if !$GLOBAL.website.api.disabled}
            <ul>
                <li>These stats are also available in JSON format <a
                        href="{$smarty.server.PHP_SELF}?page=api&action=getpoolstatus&api_key={$GLOBAL.userdata.api_key|default:""}">HERE</a>
                </li>
            </ul>{/if}</div>
    </div>
</div>
