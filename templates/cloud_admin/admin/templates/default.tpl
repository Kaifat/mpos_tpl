<div class="col-md-4">
    <div class="box border blue">
        <div class="box-title">
            <h4><i class="fa fa-sitemap"></i>Select Page</h4>
        </div>
        <div class="box-body">
            {include file="admin/templates/tree.tpl" files=$TEMPLATES prefix=""}
        </div>
        <div class="toolbox bottom">
            <p>* Bold templates are activated</p>
        </div>
    </div>
</div>

<div class="col-md-8">
    <div class="box border blue">
        <div class="box-title">
            <h4>Edit template '{$CURRENT_TEMPLATE}'</h4>
        </div>
        <form method="POST" action="{$smarty.server.PHP_SELF}">
            <div class="box-body">
                <input type="hidden" name="page" value="{$smarty.request.page}">
                <input type="hidden" name="action" value="{$smarty.request.action}">
                <input type="hidden" name="template" value="{$CURRENT_TEMPLATE}">
                <input type="hidden" name="do" value="save">
                <div class="module_content">
                    <div class="form-group">
                        <label>Active</label>
                        <input type="hidden" name="active" value="0" />
                        <input type="checkbox" name="active" value="1" id="active" {nocache}{if $DATABASE_TEMPLATE.active}checked{/if}{/nocache} />
                        <label for="active"></label>
                    </div>
                    <div class="form-group">
                        <label>Content</label>
                        <textarea class="form-control" name="content" rows="15" type="text" required>{nocache}{$DATABASE_TEMPLATE.content|escape}{/nocache}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Original Template Content</label>
                        <textarea class="form-control" readonly rows="15" type="text" required>{nocache}{$ORIGINAL_TEMPLATE|escape}{/nocache}</textarea>
                    </div>
                </div>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-info" type="submit" value="Save" class="alt_btn">
                </div>
            </div>
        </form>
    </div>
</div>
