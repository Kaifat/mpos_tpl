<div class="col-md-12">
    <div class="box border blue">
        <div class="box-title"><h4>&nbsp</h4></div>
        <div class="box-body">
            <div class="tabbable header-tabs">
                <ul class="nav nav-tabs">
                    <li><a href="#tab_EarthCoin" data-toggle="tab"><i class="fa cr cr_EarthCoin"></i> <span
                            class="hidden-inline-mobile">EarthCoin</span></a></li>
                    <li><a href="#tab_DogeCoin" data-toggle="tab"><i class="fa cr cr_DogeCoin"></i> <span
                            class="hidden-inline-mobile">DogeCoin</span></a></li>
                    <li><a href="#tab_DigitalCoin" data-toggle="tab"><i class="fa cr cr_DigitalCoin"></i> <span
                            class="hidden-inline-mobile">DigitalCoin</span></a></li>
                    <li class="active"><a href="#tab_FastCoin" data-toggle="tab"><i class="fa cr cr_FastCoin"></i> <span
                            class="hidden-inline-mobile">FastCoin</span></a></li>
                </ul>
                <div class="tab-content">
                    {if $smarty.session.AUTHENTICATED|default and !$DISABLED_DASHBOARD and !$DISABLED_DASHBOARD_API}
                        {include file="dashboard/js_api.tpl"}
                    {else}
                        {include file="dashboard/js_static.tpl"}
                    {/if}

                    <div class="tab-pane fade in active" id="tab_FastCoin">
                        <div class="row">
                            {if $smarty.session.AUTHENTICATED|default}
                                {include file="dashboard/fastcoin/overview.tpl"}
                                {include file="dashboard/fastcoin/system_stats.tpl"}
                                {include file="dashboard/fastcoin/round_data.tpl"}
                                {include file="dashboard/fastcoin/account_data.tpl"}
                            {/if}
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab_DigitalCoin">
                        <div class="row">
                        {if $smarty.session.AUTHENTICATED|default}
                            {include file="dashboard/digitalcoin/overview.tpl"}
                            {include file="dashboard/digitalcoin/system_stats.tpl"}
                            {include file="dashboard/digitalcoin/round_data.tpl"}
                            {include file="dashboard/digitalcoin/account_data.tpl"}
                        {/if}
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab_DogeCoin">
                        <div class="row">
                        {if $smarty.session.AUTHENTICATED|default}
                            {include file="dashboard/dogecoin/overview.tpl"}
                            {include file="dashboard/dogecoin/system_stats.tpl"}
                            {include file="dashboard/dogecoin/round_data.tpl"}
                            {include file="dashboard/dogecoin/account_data.tpl"}
                        {/if}
                        </div>
                     </div>
                    <div class="tab-pane fade" id="tab_EarthCoin">
                        <div class="row">
                        {if $smarty.session.AUTHENTICATED|default}
                            {include file="dashboard/earthcoin/overview.tpl"}
                            {include file="dashboard/earthcoin/system_stats.tpl"}
                            {include file="dashboard/earthcoin/round_data.tpl"}
                            {include file="dashboard/earthcoin/account_data.tpl"}
                        {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





