{if !$GLOBAL.website.api.disabled}
<script type="text/javascript" src="{$PATH}/js/jquery.qrcode.min.js"></script>
<script type="text/javascript">
        {literal}
                $(document).ready(function(){
                $('#qrcodeholder').qrcode({
        text    : "{/literal}|http{if $smarty.server.HTTPS|default:"0" eq '1'}s{/if}://{$smarty.server.SERVER_NAME}{$smarty.server.PHP_SELF}?page=api|{$GLOBAL.userdata.api_key}|{$GLOBAL.userdata.id}|{literal}",
        render:"canvas",  // 'canvas' or 'table'. Default value is 'canvas'
        background:"#ffffff",
        foreground:"#000000",
        width:250,
        height:250
    });
    });
    {/literal}
</script>

<div class="col-md-4">
    <div class="box border">
        <div class="box-title">API String</div>
        <div class="box-body">
            <p>This code will allow you to import the full API string into your mobile application.</p>
            <div id="qrcodeholder"></div>
        </div>
    </div>
</div>
{/if}
