<!-- 5 tab - RESET PIN -->
<div class="tab-pane fade" id="reset_pin">
    <form action="{$smarty.server.PHP_SELF}" method="post">
        <input type="hidden" name="page" value="{$smarty.request.page|escape}">
        <input type="hidden" name="action" value="{$smarty.request.action|escape}">
        <input type="hidden" name="do" value="genPin">

        <div class="col-md-6">
            <div class="box border blue">
                <div class="box-title"><h4>Reset PIN</h4></div>
                <div class="box-body">
                    <div class="form-group">
                        <label>Current Password</label>
                        <input class="form-control" type="password" name="currentPassword"/>
                    </div>
                </div>
                <div class="toolbox bottom">
                    <div class="submit_link">
                        <input class="btn btn-info" type="submit"  value="Reset PIN">
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="clearfix"></div>
</div>
<!-- /RESET PIN -->