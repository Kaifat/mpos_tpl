<div class="col-md-12">
    <div class="box border">
        <div class="box-title">
            <h4>Stats</h4>
            <ul class="tabs">
                <li><a href="#mine">Mine</a></li>
                <li><a href="#pool">Pool</a></li>
                <li><a href="#both">Both</a></li>
            </ul>
        </div>
        <div class="box-body">
            {include file="{$smarty.request.page|escape}/{$smarty.request.action|escape}/mine.tpl"}
            {include file="{$smarty.request.page|escape}/{$smarty.request.action|escape}/pool.tpl"}
            {include file="{$smarty.request.page|escape}/{$smarty.request.action|escape}/both.tpl"}
        </div>
    </div>
</div>

