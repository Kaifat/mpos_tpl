<div class="col-md-12">
    <div class="box border">
        <div class="box-title"><h4> Current Active Pool Workers</h4></div>
        <div class="box-body">
            <form action="{$smarty.server.PHP_SELF}">
                <input type="hidden" name="page" value="{$smarty.request.page|escape}"/>
                <input type="hidden" name="action" value="{$smarty.request.action|escape}"/>
                <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                       class="datatable table table-hover">
                    <tbody>
                    <tr>
                        <td align="left">
                        {if $smarty.request.start|default:"0" > 0}
                            <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&start={$smarty.request.start|escape|default:"0" - $LIMIT}{if $FILTERS|default:""}{$FILTERS}{/if}"><i
                                    class="icon-left-open"></i></a>
                            {else}
                            <i class="icon-left-open"></i>
                        {/if}
                        </td>
                        <td align="right">
                            <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&start={$smarty.request.start|escape|default:"0" + $LIMIT}{if $FILTERS|default:""}{$FILTERS}{/if}"><i
                                    class="icon-right-open"></i></a>
                        </td>
                    </tbody>
                </form>
                </table>
            <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-hover">
                <thead>
                <tr>
                    <th align="left">Worker Name</th>
                    <th align="left">Password</th>
                    <th align="center">Active</th>
                {if $GLOBAL.config.disable_notifications != 1}
                    <th align="center">Monitor</th>{/if}
                    <th align="right">Khash/s</th>
                    <th align="right">Difficulty</th>
                    <th align="right" style="padding-right: 25px;">Avg Difficulty</th>
                </tr>
                </thead>
            {nocache}
                {section worker $WORKERS}
                <tbody>
                <tr>
                    <td align="left">{$WORKERS[worker].username|escape}</td>
                    <td align="left">{$WORKERS[worker].password|escape}</td>
                    <td align="center"><i class="icon-{if $WORKERS[worker].hashrate > 0}ok{else}cancel{/if}"></i></td>
                    {if $GLOBAL.config.disable_notifications != 1}
                        <td align="center"><i class="icon-{if $WORKERS[worker].monitor}ok{else}cancel{/if}"></i></td>
                    {/if}
                    <td align="right">{$WORKERS[worker].hashrate|number_format|default:"0"}</td>
                    <td align="right">{if $WORKERS[worker].hashrate > 0}{$WORKERS[worker].difficulty|number_format:"2"|default:"0"}{else}
                        0{/if}</td>
                    <td align="right"
                        style="padding-right: 25px;">{if $WORKERS[worker].hashrate > 0}{$WORKERS[worker].avg_difficulty|number_format:"2"|default:"0"}{else}
                        0{/if}</td>
                </tr>
                {/section}
            {/nocache}
            </tbody>
            </table>
        </div>
    </div>
</div>
