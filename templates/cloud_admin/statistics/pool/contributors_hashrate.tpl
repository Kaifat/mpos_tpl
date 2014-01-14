<div class="col-md-6">
    <div class="box border">
        <div class="box-title"><h4>Contributor Hashrates</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-striped table-hover">
                <thead>
                <tr>
                    <th>Rank</th>
                    <th></th>
                    <th scope="col">User Name</th>
                    <th scope="col">KH/s</th>
                    <th>{$GLOBAL.config.currency}/Day</th>
                {if $GLOBAL.config.price.currency}
                    <th>{$GLOBAL.config.price.currency}/Day</th>{/if}
                </tr>
                </thead>
                <tbody>
                {assign var=rank value=1}
                {assign var=listed value=0}
                {section contrib $CONTRIBHASHES}
                    {math assign="estday" equation="round(reward / ( diff * pow(2,32) / ( hashrate * 1000 ) / 3600 / 24), 3)" diff=$DIFFICULTY reward=$REWARD hashrate=$CONTRIBHASHES[contrib].hashrate}
                <tr{if $GLOBAL.userdata.username|default:""|lower == $CONTRIBHASHES[contrib].account|lower}{assign var=listed value=1}
                        style="background-color:#99EB99;"{else} class="{cycle values="odd,even"}"{/if}>
                    <td>{$rank++}</td>
                    <td>{if $CONTRIBHASHES[contrib].donate_percent > 0}<i
                            class="icon-star-empty"></i>{/if}</td>
                    <td>{if $CONTRIBHASHES[contrib].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}
                        anonymous{else}{$CONTRIBHASHES[contrib].account|escape}{/if}</td>
                    <td>{$CONTRIBHASHES[contrib].hashrate|number_format}</td>
                    <td>{$estday|number_format:"3"}</td>
                    {if $GLOBAL.config.price.currency}
                        <td>{($estday * $GLOBAL.price)|default:"n/a"|number_format:"4"}</td>{/if}
                </tr>
                {/section}
                {if $listed != 1 && $GLOBAL.userdata.username|default:"" && $GLOBAL.userdata.rawhashrate|default:"0" > 0}
                    {math assign="myestday" equation="round(reward / ( diff * pow(2,32) / ( hashrate * 1000 ) / 3600 / 24), 3)" diff=$DIFFICULTY reward=$REWARD hashrate=$GLOBAL.userdata.rawhashrate}
                <tr>
                    <td>n/a</td>
                    <td>{if $GLOBAL.userdata.donate_percent > 0}<i class="icon-star-empty"></i>{/if}</td>
                    <td>{$GLOBAL.userdata.username|escape}</td>
                    <td>{$GLOBAL.userdata.rawhashrate|number_format}</td>
                    <td>{$myestday|number_format:"3"|default:"n/a"}</td>
                    {if $GLOBAL.config.price.currency}
                        <td>{($myestday * $GLOBAL.price)|default:"n/a"|number_format:"4"}</td>{/if}
                </tr>
                {/if}
                </tbody>
            </table>
        </div>
    </div>
</div>