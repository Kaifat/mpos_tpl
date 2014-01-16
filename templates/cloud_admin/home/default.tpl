{section name=news loop=$NEWS}
<div class="col-md-12">
    <div class="box border">
        <div class="box-title"><h4>{$NEWS[news].header}, <font
                size=\"1px\">posted {$NEWS[news].time|date_format:"%b %e, %Y at %H:%M"}{if $HIDEAUTHOR|default:"0" == 0}
            by <b>{$NEWS[news].author}</b>{/if}</font></h4>
        </div>
        <div class="box-body">
            {$NEWS[news].content nofilter}
            <div class="clear"></div>
        </div>
    </div>
</div>
{/section}
