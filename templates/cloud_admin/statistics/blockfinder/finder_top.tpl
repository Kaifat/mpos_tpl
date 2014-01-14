<div class="col-md-6">
    <div class="box border">
        <div class="box-title"><h4>Top 25 Blockfinder</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                <thead>
                <tr>
                    <th align="center">Rank</th>
                    <th>Username</th>
                    <th align="center">Blocks</th>
                    <th align="right" style="padding-right: 25px;">Coins Generated</th>
                </tr>
                </thead>
                <tbody>
                {assign var=rank value=1}
                {section block $BLOCKSSOLVEDBYACCOUNT}
                <tr class="{cycle values="odd,even"}">
                    <td align="center">{$rank++}</td>
                    <td>{if $BLOCKSSOLVEDBYACCOUNT[block].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}
                        anonymous{else}{$BLOCKSSOLVEDBYACCOUNT[block].finder|default:"unknown"|escape}{/if}</td>
                    <td align="center">{$BLOCKSSOLVEDBYACCOUNT[block].solvedblocks}</td>
                    <td align="right"
                        style="padding-right: 25px;">{$BLOCKSSOLVEDBYACCOUNT[block].generatedcoins|number_format}</td>
                </tr>
                {/section}
                </tbody>
            </table>
        </div>
    </div>
</div>
