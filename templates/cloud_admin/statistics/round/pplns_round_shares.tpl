<div class="col-md-6">
    <div class="box border">
        <div class="box-title"><h4>PPLNS Round Shares</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-hover">
                <thead>
                <tr>
                    <th align="center">Rank</th>
                    <th align="left">User Name</th>
                    <th align="right">Valid</th>
                    <th align="right">Invalid</th>
                    <th align="right" style="padding-right: 25px;">Invalid %</th>
                </tr>
                </thead>
                <tbody>
                {assign var=rank value=1}
                {section contrib $PPLNSROUNDSHARES}
                <tr{if $GLOBAL.userdata.username|default:"" == $PPLNSROUNDSHARES[contrib].username}
                        style="background-color:#99EB99;"{else} class="{cycle values="odd,even"}"{/if}>
                    <td align="center">{$rank++}</td>
                    <td>{if $PPLNSROUNDSHARES[contrib].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}
                        anonymous{else}{$PPLNSROUNDSHARES[contrib].username|default:"unknown"|escape}{/if}</td>
                    <td align="right">{$PPLNSROUNDSHARES[contrib].pplns_valid|number_format}</td>
                    <td align="right">{$PPLNSROUNDSHARES[contrib].pplns_invalid|number_format}</td>
                    <td align="right"
                        style="padding-right: 25px;">{if $PPLNSROUNDSHARES[contrib].pplns_invalid > 0 && $PPLNSROUNDSHARES[contrib].pplns_valid > 0}{($PPLNSROUNDSHARES[contrib].pplns_invalid / $PPLNSROUNDSHARES[contrib].pplns_valid * 100)|number_format:"2"|default:"0"}{else}
                        0.00{/if}</td>
                </tr>
                {/section}
                </tbody>
            </table>
        </div>
    </div>
</div>
