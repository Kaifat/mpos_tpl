<div class="col-md-8">
    <div class="box border blue">
        <div class="box-title"><h4>Overview {if $GLOBAL.config.price.currency}{$GLOBAL.config.currency}
            /{$GLOBAL.config.price.currency}: <span id="b-price">{$GLOBAL.price|number_format:"8"}</span>{/if} / Pool
            Workers: <span id="b-dworkers">{$GLOBAL.workers}</span></h4></div>
        <div class="box-body">
            <center>
                <div style="display: inline-block;">
                    <div id="poolhashrate_digitalcoin" style="width:120px; height:90px;"></div>
                    <div id="sharerate_digitalcoin" style="width:120px; height:90px;"></div>
                </div>
                <div style="display: inline-block;">
                    <div id="hashrate_digitalcoin" style="width:220px; height:180px;"></div>
                </div>
                <div style="display: inline-block;">
                    <div id="nethashrate_digitalcoin" style="width:120px; height:90px;"></div>
                    <div id="querytime_digitalcoin" style="width:120px; height:90px;"></div>
                </div>
            </center>
        {if !$DISABLED_DASHBOARD and !$DISABLED_DASHBOARD_API}
            <div style="margin-left: 16px; display: inline-block; width: 100%;">
                <div id="hashrategraph" style="height: 160px; width: 100%;"></div>
            </div>
        {/if}
        </div>
        <div class="toolbox bottom">
            <p style="margin-left: 25px">Refresh
                interval: {$GLOBAL.config.statistics_ajax_refresh_interval|default:"10"} seconds. Hashrate based on
                shares submitted in the past {$INTERVAL|default:"5"} minutes.</p>
        </div>
    </div>
</div>

