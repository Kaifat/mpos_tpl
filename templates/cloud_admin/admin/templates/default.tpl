<div class="col-md-5">
    <div class="box border">
        <div class="box-title">
            <h4><i class="fa fa-sitemap"></i>Select Page</h4>
        </div>
        <div class="box-body">
            <div class="templates-tree" id="templates-tree">
                {include file="admin/templates/tree.tpl" files=$TEMPLATES prefix=""}
            </div>
        </div>
        <div class="toolbox bottom">
            <p>* Bold templates are activated</p>
            <link rel='stylesheet' type='text/css' href='{$PATH}/js/dynatree/skin/ui.dynatree.css'>
            <script type="text/javascript" src="{$PATH}/js/jquery.cookie.js"></script>
            <script type="text/javascript" src="{$PATH}/js/jquery-ui.custom.min.js"></script>
            <script type="text/javascript" src="{$PATH}/js/dynatree/jquery.dynatree.min.js"></script>
            <script>
                $(function() {
                    $("#templates-tree").each(function() {
                        $(this).find("li").each(function() {
                            if($(this).find("li.dynatree-activated").length) {
                                $(this).attr("data", "addClass:'dynatree-has-activated'");
                            }
                        });
                    }).dynatree({
                                minExpandLevel: 2,
                                clickFolderMode: 2,
                                selectMode: 1,
                                persist: true,
                                //To show the active template onLoad
                                onPostInit: function(isReloading, isError) {
                                    this.reactivate();
                                },
                                onActivate: function(node) {
                                    if( node.tree.isUserEvent() && node.data.href )
                                        location.href = node.data.href;
                                }
                            });
                });
            </script>
            <style>
                .templates-tree .dynatree-container { border: none; }
                .templates-tree span.dynatree-folder a { font-weight: normal; }
                .templates-tree span.dynatree-active a,
                .templates-tree span.dynatree-has-activated a,
                .templates-tree span.dynatree-activated a { font-weight: bold; }
            </style>
        </div>
    </div>
</div>

<div class="col-md-7">
    <div class="box border">
        <div class="box-title">
            <h4>Edit template '{$CURRENT_TEMPLATE}'</h4>
        </div>
        <div class="box-body">
            <form method="POST" action="{$smarty.server.PHP_SELF}">
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
                        <textarea name="content" rows="15" type="text" required>{nocache}{$DATABASE_TEMPLATE.content|escape}{/nocache}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Original Template Content</label>
                        <textarea readonly rows="15" type="text" required>{nocache}{$ORIGINAL_TEMPLATE|escape}{/nocache}</textarea>
                    </div>
                </div>
                <footer>
                    <div class="submit_link">
                        <input type="submit" value="Save" class="alt_btn">
                    </div>
                </footer>
            </form>
        </div>
    </div>
</div>
