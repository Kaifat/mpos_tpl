<script language="javascript">
    function storeFee(id) {
        $.ajax({
            type:"POST",
            url:"{$smarty.server.PHP_SELF}",
            data:"page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=fee&account_id=" + id,
        });
    }
    function storeLock(id) {
        $.ajax({
            type:"POST",
            url:"{$smarty.server.PHP_SELF}",
            data:"page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=lock&account_id=" + id,
        });
    }
    function storeAdmin(id) {
        $.ajax({
            type:"POST",
            url:"{$smarty.server.PHP_SELF}",
            data:"page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=admin&account_id=" + id,
        });
    }
</script>

<div class="col-md-12">
    <div class="box border">
        <div class="box-title"><h4>User Search</h4></div>
        <form action="{$smarty.server.PHP_SELF}">
            <div class="box-body">
                <input type="hidden" name="page" value="{$smarty.request.page|escape}"/>
                <input type="hidden" name="action" value="{$smarty.request.action|escape}"/>
                <input type="hidden" name="do" value="query"/>

{*============================================*}

                {*<div class="form-actions form-actions-padding">*}
                    <ul class="pager">
                        <li class="previous">
                        {if $smarty.request.start|default:"0" > 0}
                            <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&start={$smarty.request.start|escape|default:"0" - $LIMIT}{if $FILTERS|default:""}{$FILTERS}{/if}" class="btn btn-default"><i class="fa fa-chevron-left fa-2x"></i></a>
                            {else}
                            <i class="icon-left-open"></i>
                        {/if}
                        </li>
                        <li class="next">
                            <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&start={$smarty.request.start|escape|default:"0" + $LIMIT}{if $FILTERS|default:""}{$FILTERS}{/if}" class="btn btn-default"><i class="fa fa-chevron-right fa-2x"></i></a>
                        </li>
                    </ul>
                {*</div>*}



                {*<table cellspacing="0" class="tablesorter">*}
                    {*<tbody>*}
                    {*<tr>*}
                        {*<td align="left">*}
                        {*{if $smarty.request.start|default:"0" > 0}*}
                            {*<a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&start={$smarty.request.start|escape|default:"0" - $LIMIT}{if $FILTERS|default:""}{$FILTERS}{/if}"><i*}
                                    {*class="icon-left-open"></i></a>*}
                            {*{else}*}
                            {*<i class="icon-left-open"></i>*}
                        {*{/if}*}
                        {*</td>*}
                        {*<td align="right">*}
                            {*<a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&start={$smarty.request.start|escape|default:"0" + $LIMIT}{if $FILTERS|default:""}{$FILTERS}{/if}"><i*}
                                    {*class="icon-right-open"></i></a>*}
                        {*</td>*}
                    {*</tbody>*}
                {*</table>*}



{*========================================*}

                <div class="form-group">
                    <label>Account</label>
                    <input class="form-control" size="20" type="text" name="filter[account]"
                           value="{$smarty.request.filter.account|default:""}"/>
                </div>
                <div class="form-group">
                    <label>E-Mail</label>
                    <input class="form-control" size="20" type="text" name="filter[email]"
                           value="{$smarty.request.filter.email|default:""}"/>
                </div>
                <div class="form-group">
                    <label>Is Admin</label>
                {html_options name="filter[is_admin]" options=$ADMIN selected=$smarty.request.filter.is_admin|default:""}
                </div>
                <div class="form-group">
                    <label>Is Locked</label>
                {html_options name="filter[is_locked]" options=$LOCKED selected=$smarty.request.filter.is_locked|default:""}
                </div>
                <div class="form-group">
                    <label>No Fees</label>
                {html_options name="filter[no_fees]" options=$NOFEE selected=$smarty.request.filter.no_fees|default:""}
                </div>
                <ul>
                    <li>Note: Text search fields support '%' as wildcard.</li>
                </ul>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-inverse" type="submit" value="Search" class="alt_btn">
                </div>
            </div>
        </form>
    </div>
</div>


<div class="col-md-12">
    <div class="box border">
        <div class="box-title"><h4>User Information</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                <thead>
                <tr>
                    <th align="center">ID</th>
                    <th align="left">Username</th>
                    <th align="left">E-Mail</th>
                    <th align="right">Shares&nbsp;&nbsp;</th>
                    <th align="right">Hashrate&nbsp;&nbsp;</th>
                {if $GLOBAL.config.payout_system != 'pps'}
                    <th align="right">Est. Donation&nbsp;&nbsp;</th>
                    <th align="right">Est. Payout&nbsp;&nbsp;&nbsp;</th>
                    {else}
                    <th align="right" colspan="2">Est. 24 Hours&nbsp;&nbsp;&nbsp;</th>
                {/if}
                    <th align="right">Balance&nbsp;&nbsp;&nbsp;</th>
                    <th align="center">Admin</th>
                    <th align="center">Locked</th>
                    <th align="center">No Fees</th>
                </tr>
                </thead>
                <tbody>
                {nocache}
                    {section name=user loop=$USERS|default}
                    <tr>
                        <td align="center">{$USERS[user].id}</td>
                        <td align="left">{$USERS[user].username|escape}</td>
                        <td align="left">{$USERS[user].email|escape}</td>
                        <td align="right">{$USERS[user].shares.valid}</td>
                        <td align="right">{$USERS[user].hashrate}</td>
                        {if $GLOBAL.config.payout_system != 'pps'}
                            <td align="right">{$USERS[user].estimates.donation|number_format:"8"}</td>
                            <td align="right">{$USERS[user].estimates.payout|number_format:"8"}</td>
                            {else}
                            <td align="right" colspan="2">{$USERS[user].estimates.hours24|number_format:"8"}</td>
                        {/if}
                        <td align="right">{$USERS[user].balance|number_format:"8"}</td>
                        <td align="center">
                            <input type="hidden" name="admin[{$USERS[user].id}]" value="0"/>
                            <input type="checkbox" onclick="storeAdmin({$USERS[user].id})"
                                   name="admin[{$USERS[user].id}]" value="1" id="admin[{$USERS[user].id}]"
                                   {if $USERS[user].is_admin}checked{/if} />
                            <label for="admin[{$USERS[user].id}]"></label>
                        </td>
                        <td align="center">
                            <input type="hidden" name="locked[{$USERS[user].id}]" value="0"/>
                            <input type="checkbox" onclick="storeLock({$USERS[user].id})"
                                   name="locked[{$USERS[user].id}]" value="1" id="locked[{$USERS[user].id}]"
                                   {if $USERS[user].is_locked}checked{/if} />
                            <label for="locked[{$USERS[user].id}]"></label>
                        </td>
                        <td align="center">
                            <input type="hidden" name="nofee[{$USERS[user].id}]" value="0"/>
                            <input type="checkbox" onclick="storeFee({$USERS[user].id})" name="nofee[{$USERS[user].id}]"
                                   value="1" id="nofee[{$USERS[user].id}]" {if $USERS[user].no_fees}checked{/if} />
                            <label for="nofee[{$USERS[user].id}]"></label>
                        </td>
                    </tr>
                        {sectionelse}
                    <tr>
                        <td colspan="10"></td>
                    </tr>
                    {/section}
                {/nocache}
                </tbody>
            </table>
        </div>
    </div>
</div>
