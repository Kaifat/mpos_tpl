<div class="col-md-6">
    <div class="box border">
        <div class="box-title">Contributor Shares</div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-hover">
                <thead>
                <tr>
                    <th>Rank</th>
                    <th></th>
                    <th>User Name</th>
                    <th>Shares</th>
                </tr>
                </thead>
                <tbody>
                {assign var=rank value=1}
                {assign var=listed value=0}
                {section shares $CONTRIBSHARES}
                <tr{if $GLOBAL.userdata.username|default:""|lower == $CONTRIBSHARES[shares].account|lower}{assign var=listed value=1}
                        style="background-color:#99EB99;"{else} class="{cycle values="odd,even"}"{/if}>
                    <td>{$rank++}</td>
                    <td>{if $CONTRIBSHARES[shares].donate_percent > 0}<i class="icon-star-empty"></i>{/if}
                    </td>
                    <td>{if $CONTRIBSHARES[shares].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}
                        anonymous{else}{$CONTRIBSHARES[shares].account|escape}{/if}</td>
                    <td>{$CONTRIBSHARES[shares].shares|number_format}</td>
                </tr>
                {/section}
                {if $listed != 1 && $GLOBAL.userdata.username|default:"" && $GLOBAL.userdata.shares.valid|default:"0" > 0}
                <tr>
                    <td align="center">n/a</td>
                    <td align="right">{if $GLOBAL.userdata.donate_percent > 0}<i class="icon-star-empty"></i>{/if}</td>
                    <td>{$GLOBAL.userdata.username|escape}</td>
                    <td align="right" style="padding-right: 25px;">{$GLOBAL.userdata.shares.valid|number_format}</td>
                </tr>
                {/if}
                </tbody>
            </table>
        </div>
    </div>
</div>
