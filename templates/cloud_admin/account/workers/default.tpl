<div class="col-md-4">
    <div class="box border">
        <div class="box-title"><h4>Add New Worker</h4></div>
        <form action="{$smarty.server.PHP_SELF}" method="post">
            <div class="box-body">
                <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                <input type="hidden" name="do" value="add">

                <div class="module_content">
                    <div class="form-group">
                        <label>Worker Name</label>
                        <input class="form-control" type="text" name="username" value="user" size="10" maxlength="20" required>
                    </div>
                    <div class="form-group">
                        <label>Worker Password</label>
                        <input class="form-control" type="text" name="password" value="password" size="10" maxlength="20" required>&nbsp;
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-inverse" type="submit" value="Add New Worker" class="alt_btn">
                </div>
            </div>
        </form>
    </div>
</div>

<div class="col-md-8">
    <div class="box border">
        <div class="box-title"><h4>Worker Configuration</h4></div>
        <form action="{$smarty.server.PHP_SELF}" method="post">
            <div class="box-body">
            <form action="{$smarty.server.PHP_SELF}" method="post">
                <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                <input type="hidden" name="do" value="update">
                <table class="tablesorter" cellspacing="0">
                    <thead>
                    <tr>
                        <th align="left">Worker Login</th>
                        <th align="left">Worker Password</th>
                        <th align="center">Active</th>
                    {if $GLOBAL.config.disable_notifications != 1}
                        <th align="center">Monitor</th>{/if}
                        <th align="right">Khash/s</th>
                        <th align="right">Difficulty</th>
                        <th align="center" style="padding-right: 25px;">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    {nocache}
                        {section worker $WORKERS}
                            {assign var="username" value="."|escape|explode:$WORKERS[worker].username:2}
                        <tr>
                            <td align="left"{if $WORKERS[worker].hashrate > 0}
                                style="color: orange"{/if}>{$username.0|escape}.<input
                                    name="data[{$WORKERS[worker].id}][username]" value="{$username.1|escape}" size="10"
                                    required/></td>
                            <td align="left"><input class="form-control" type="text" name="data[{$WORKERS[worker].id}][password]"
                                                    value="{$WORKERS[worker].password|escape}" size="10" required></td>
                            <td align="center"><i
                                    class="icon-{if $WORKERS[worker].hashrate > 0}ok{else}cancel{/if}"></i></td>
                            {if $GLOBAL.config.disable_notifications != 1}
                                <td>
            <span class="toggle">
            <label for="data[{$WORKERS[worker].id}][monitor]">
                <input type="checkbox" class="ios-switch" name="data[{$WORKERS[worker].id}][monitor]" value="1"
                       id="data[{$WORKERS[worker].id}][monitor]" {if $WORKERS[worker].monitor}checked{/if} />

                <div class="switch"></div>
            </label>
            </span>
                                </td>
                            {/if}
                            <td align="right">{$WORKERS[worker].hashrate|number_format}</td>
                            <td align="right">{$WORKERS[worker].difficulty|number_format:"2"}</td>
                            <td align="center" style="padding-right: 25px;"><a
                                    href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=delete&id={$WORKERS[worker].id|escape}"
                                    class="icn_trash"><i class="icon-trash"/></a></td>
                        </tr>
                        {/section}
                    {/nocache}
                    </tbody>
                </table>
            </div>
            <div class="clear"></div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-inverse" type="submit" class="alt_btn" value="Update Workers">
                </div>
            </div>
        </form>
    </div>
</div>
