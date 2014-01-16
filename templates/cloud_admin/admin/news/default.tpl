<script src="{$PATH}/js/cleditor/jquery.cleditor.min.js"></script>
<link rel="stylesheet" href="{$PATH}/js/cleditor/jquery.cleditor.css">
<script type="text/javascript">
    $(document).ready(function () {
        $(".cleditor").cleditor();
    });
</script>
<div class="col-md-12">
    <div class="box border">
        <div class="box-title"><h4>News Posts</h4></div>
        <form method="POST" action="{$smarty.server.PHP_SELF}">
            <div class="box-body">
                <ul>
                    <li>News posts support the Markdown syntax</li>
                </ul>
                <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                <input type="hidden" name="do" value="add">

                <div class="module_content">
                    <div class="form-group">
                        <label>Header</label>
                        <input class="form-control" size="30" type="text" name="data[header]" required/>
                    </div>
                    <div class="form-group">
                        <label>Content</label>
                        <textarea class="form-control" name="data[content]" rows="5" required></textarea>
                    </div>
                </div>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-inverse" type="submit" value="Add" class="alt_btn">
                </div>
            </div>
        </form>
    </div>
</div>

{nocache}
    {section name=news loop=$NEWS}

    <div class="col-md-12">
        <div class="box border">
            <div class="box-title"><h4>{$NEWS[news].header} posted {$NEWS[news].time} by {$NEWS[news].author}</h4>
                {if $NEWS[news].active == 0}<font size="2px"><font color="red"><b>inactive</b></font><br/><br/>{/if}
            </div>
            <div class="box-body">
                {$NEWS[news].content nofilter}</div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <a href='{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action=news_edit&id={$NEWS[news].id}'><i class="fa fa-wrench"></i></a>&nbsp;
                    <a href='{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=delete&id={$NEWS[news].id}'><i
                            class="fa fa-trash-o"></i></a>
                </div>
            </div>
        </div>
    </div>
    {/section}
{/nocache}
