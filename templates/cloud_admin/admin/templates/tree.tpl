<div id="templates-tree" class="tree"></div>

{literal}
<script type="text/javascript">

    var tree_data = {/literal}{$JSON_TEMPLATES}{literal};
    var templatesTreeDataSource = new DataSourceTree({data: tree_data});

    $('#templates-tree').admin_tree({
        dataSource: templatesTreeDataSource ,
        loadingHTML:'<div class="tree-loading"><i class="fa fa-spinner fa-2x fa-spin"></i></div>',
        'open-icon' : 'fa-folder-open',
        'close-icon' : 'fa-folder',
        'selectable' : false,
        'selected-icon' : null,
        'unselected-icon' : null
    });

    //To add font awesome support
    $('.tree').find('[class*="fa-"]').addClass("fa");

</script>
{/literal}
