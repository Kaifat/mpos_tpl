<script src="{$PATH}/js/cleditor/jquery.cleditor.min.js"></script>
<link rel="stylesheet" href="{$PATH}/js/cleditor/jquery.cleditor.css">
<script type="text/javascript">
    $(document).ready(function () {
        $(".cleditor").cleditor();
    });
</script>
<div class="col-md-12">
    <div class="box border blue">
        <div class="box-title"><h4>Edit news entry #{$NEWS.id}</h4></div>
        <form method="POST" action="{$smarty.server.PHP_SELF}">
            <div class="box-body">
                <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                <input type="hidden" name="id" value="{$NEWS.id}">
                <input type="hidden" name="do" value="save">

                <div class="module_content">
                    <div class="form-group">
                        <label>Active</label>

                        <div>
                            <input type="hidden" name="active" value="0"/>
                            <input type="checkbox" name="active" value="1"
                                   id="active" {nocache}{if $NEWS.active}checked{/if}{/nocache} />
                            <label for="active"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Header</label>
                        <input class="form-control" name="header" type="text" size="30"
                               value="{nocache}{$NEWS.header}{/nocache}" required/>
                    </div>
                    <div class="form-group">
                        <label>Content</label>
                        <textarea class="form-control" name="content" rows="15" cols="150" type="text"
                                  required>{nocache}{$NEWS.content nofilter}{/nocache}</textarea>
                    </div>
                </div>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input class="btn btn-info" type="submit" value="Save" >
                </div>
            </div>
        </form>
    </div>
</div>
