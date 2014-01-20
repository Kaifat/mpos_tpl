<form action="{$smarty.server.PHP_SELF}" method="post">
    <input type="hidden" name="page" value="{$smarty.request.page|escape|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape|escape}">

    <div class="col-md-12">
        <div class="box border blue">
            <div class="box-title"><h4>Earnings Information</h4></div>
            <div class="box-body">

                <ul class="pager">
                    <li class="previous">
                        <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&height={if is_array($REPORTDATA) && count($REPORTDATA) > ($BLOCKLIMIT - 1)}{$REPORTDATA[$BLOCKLIMIT - 1].height}{/if}&prev=1&limit={$BLOCKLIMIT}&id={$USERID}&filter={$FILTER}"
                           class="btn btn-default"><i class="fa fa-chevron-left fa-2x"></i></a>
                    </li>
                    <li class="next">
                        <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&height={if is_array($REPORTDATA) && count($REPORTDATA) > 0}{$REPORTDATA[0].height}{/if}&next=1&limit={$BLOCKLIMIT}&id={$USERID}&filter={$FILTER}"
                           class="btn btn-default"><i class="fa fa-chevron-right fa-2x"></i></a>
                    </li>
                </ul>

                <table id="datatable2" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                    <tbody>
                    <tr>
                        <td>
                            <fieldset style="width:200px; padding-right:8px;">
                                <label>Select User</label>
                            {html_options class="col-md-12" name="id" options=$USERLIST selected=$USERID|default:"0"}
            </div>
            </td>
            <td>
                <fieldset style="width:200px; padding-right:8px;">
                    <label>Block Limit</label>
                    <input class="form-control" size="10" type="text" name="limit" value="{$BLOCKLIMIT|default:"20"}"/>
        </div>
        </td>
        <td>
            <fieldset style="width:200px; padding-right:8px;">
                <label>Starting block height</label>
                <input class="form-control" type="text" class="pin" name="search" value="{$HEIGHT|default:"%"}">
    </div>
    </td>
    <td>
        <div class="control-group">
            <div class="controls">
                <label for="filter">Show empty rounds</label><br>
                <div class="make-switch radio1 radio-no-uncheck-square-o" data-on="warning">
                    <input id="filter" type="radio" name="filter" value="1"{if $FILTER}checked{/if}>
                </div>
            </div>
        </div>
    </td>
    </tbody>
    </table>
    </div>
    <div class="toolbox bottom">
        <div class="submit_link">
            <input class="btn btn-info" type="submit" value="Submit" class="alt_btn">
        </div>
    </div>
    </div>
    </div>
</form>
