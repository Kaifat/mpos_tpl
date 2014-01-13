<!-- BREADCRUMBS -->
<ul class="breadcrumb">
    <li>
        <i class="fa fa-home"></i>
        <a href="{$smarty.server.PHP_SELF}">{$GLOBAL.website.name|default:"Unknown Pool"}</a>
    </li>
    <li>{if $smarty.request.action|default:""}
            <a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|default:"home"|escape|replace:'"':''}">{$smarty.request.page|escape|default:"Home"|capitalize|escape|replace:'"':''}</a>
        {else}
            {$smarty.request.page|escape|default:"Home"|capitalize|escape|replace:'"':''}
        {/if}
    </li>
    {if $smarty.request.action|default:""}
    <li>{$smarty.request.action|escape|capitalize|escape|replace:'"':''}</li>
    {/if}
</ul>
<!-- /BREADCRUMBS -->