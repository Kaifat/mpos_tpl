<div class="sidebar-menu nav-collapse">
{*<div class="divide-20"></div>*}

<!-- SIDEBAR QUICK-LAUNCH -->
<!-- <div id="quicklaunch">
<!-- /SIDEBAR QUICK-LAUNCH -->

<!-- SIDEBAR MENU -->
<ul>
<li{if !$smarty.request.page|default:false} class="active"{/if}>
    <a href="{$smarty.server.PHP_SELF}">
        <i class="fa fa-home fa-fw"></i> <span class="menu-text">Home</span>
        <span class="selected"></span>
    </a>
</li>

{if $smarty.session.AUTHENTICATED|default:"0" == 1}
<li class="has-sub{if $smarty.request.page|default:false && $smarty.request.page|default:false == "dashboard" || $smarty.request.page|default:false == "account"} active{/if}">
    <a href="javascript:;">
        <i class="fa fa-user fa-fw"></i> <span class="menu-text">My Account</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub">

        <li{if $smarty.request.page|default:false == "dashboard"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=dashboard">Dashboard</a></li>
        <li{if $smarty.request.page|default:false == "account" && $smarty.request.action|default:false == "edit"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=account&action=edit">Edit Account</a>
        </li>
        <li{if $smarty.request.page|default:false == "account" && $smarty.request.action|default:false == "workers"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=account&action=workers">My Workers</a>
        </li>
        <li{if $smarty.request.page|default:false == "account" && $smarty.request.action|default:false == "transactions"}
                class="current"{/if}><a
                href="{$smarty.server.PHP_SELF}?page=account&action=transactions">Transactions</a>
        </li>
        {if !$GLOBAL.config.disable_notifications}
            <li{if $smarty.request.page|default:false == "account" && $smarty.request.action|default:false == "notifications"}
                    class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=account&action=notifications">Notifications</a>
            </li>{/if}
        {if !$GLOBAL.config.disable_invitations}
            <li{if $smarty.request.page|default:false == "account" && $smarty.request.action|default:false == "invitations"}
                    class="current"{/if}><a
                    href="{$smarty.server.PHP_SELF}?page=account&action=invitations">Invitations</a>
            </li>{/if}
        <li{if $smarty.request.page|default:false == "account" && $smarty.request.action|default:false == "qrcode"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=account&action=qrcode">QR Codes</a></li>
    </ul>
</li>
{/if}

{if $smarty.session.AUTHENTICATED|default:"0" == 1 && $GLOBAL.userdata.is_admin == 1}
<li class="has-sub{if $smarty.request.page|default:false == "admin"} active{/if}">
    <a href="javascript:;">
        <i class="fa fa-cogs fa-fw"></i> <span class="menu-text">Admin Panel</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub">

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "dashboard"}
                class="current"{/if}><a
                href="{$smarty.server.PHP_SELF}?page=admin&action=dashboard">Dashboard</a></li>

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "monitoring"}
                class="current"{/if}><a
                href="{$smarty.server.PHP_SELF}?page=admin&action=monitoring">Monitoring</a></li>

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "user"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=admin&action=user">User Info</a>
        </li>

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "wallet"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=admin&action=wallet">Wallet
            Info</a></li>

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "transactions"}
                class="current"{/if}><a
                href="{$smarty.server.PHP_SELF}?page=admin&action=transactions">Transactions</a>
        </li>

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "settings"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=admin&action=settings">Settings</a>
        </li>

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "news"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=admin&action=news">News</a></li>

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "reports"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=admin&action=reports">Reports</a>
        </li>

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "poolworkers"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=admin&action=poolworkers">Pool
            Workers</a></li>

        <li{if $smarty.request.page|default:false == "admin" && $smarty.request.action|default:false == "templates"}
                class="current"{/if}><a
                href="{$smarty.server.PHP_SELF}?page=admin&action=templates">Templates</a></li>
    </ul>
</li>
{/if}

{if $smarty.session.AUTHENTICATED|default}
<li class="has-sub{if $smarty.request.page|default:false == "statistics"} active{/if}">
    <a href="javascript:;">
        <i class="fa fa-bar-chart-o fa-fw"></i> <span class="menu-text">Statistics</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub">
        <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "pool"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=statistics&action=pool">Pool</a></li>
        <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "blocks"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=statistics&action=blocks">Blocks</a></li>
        <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "graphs"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=statistics&action=graphs">Graphs</a></li>
        <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "round"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=statistics&action=round">Round</a></li>
        <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "blockfinder"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=statistics&action=blockfinder">Finder</a>
        </li>
        {if $GLOBAL.config.monitoring_uptimerobot_api_keys|default:"0"}
            <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "uptime"}
                    class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=statistics&action=uptime">Uptime</a>
            </li>{/if}
    </ul>
</li>

    {else}

<li class="has-sub{if $smarty.request.page|default:false == "statistics"} active{/if}">
    <a href="javascript:;">
        <i class="fa fa-cogs fa-fw"></i> <span class="menu-text">Statistics</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub">
        {if $GLOBAL.acl.pool.statistics}
            <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "pool"}
                    class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=statistics&action=pool">Pool</a></li>
            {else}
        <li><a href="{$smarty.server.PHP_SELF}?page=statistics">Statistics</a>
        {/if}

        {if $GLOBAL.acl.block.statistics}
            <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "blocks"}
                    class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=statistics&action=blocks">Blocks</a>
            </li>
        {/if}

        {if $GLOBAL.acl.round.statistics}
            <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "round"}
                    class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=statistics&action=round">Round</a></li>
        {/if}

        {if $GLOBAL.acl.blockfinder.statistics}
            <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "blockfinder"}
                    class="current"{/if}><a
                    href="{$smarty.server.PHP_SELF}?page=statistics&action=blockfinder">Finder</a></li>
        {/if}

        {if $GLOBAL.acl.uptime.statistics}
            {if $GLOBAL.config.monitoring_uptimerobot_api_keys|default:"0"}
                <li{if $smarty.request.page|default:false == "statistics" && $smarty.request.action|default:false == "uptime"}
                        class="current"{/if}><a
                        href="{$smarty.server.PHP_SELF}?page=statistics&action=uptime">Uptime</a></li>
            {/if}
        {/if}
    </ul>
</li>
{/if}

<li class="has-sub{if $smarty.request.page|default:false == "faq" || $smarty.request.page|default:false == "about"} active{/if}">
    <a href="javascript:;">
        <i class="fa fa-question-circle fa-fw"></i> <span class="menu-text">Help</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub">
        <li{if $smarty.request.page|default:false == "faq"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=faq">FAQ</a></li>

    {if !$GLOBAL.website.about.disabled}
        <li{if $smarty.request.page|default:false == "about" && $smarty.request.action|default:false == "pool"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=about&action=pool">About</a></li>
    {/if}

    {if !$GLOBAL.website.donors.disabled}
        <li{if $smarty.request.page|default:false == "about" && $smarty.request.action|default:false == "donors"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=about&action=donors">Donors</a></li>
    {/if}
    </ul>
</li>

<li class="has-sub{if $smarty.request.page|default:false == "contactform" || $smarty.request.page|default:false == "logout" || $smarty.request.page|default:false == "login" || $smarty.request.page|default:false == "register" || $smarty.request.page|default:false == "contactform" || $smarty.request.page|default:false == "tac"} active{/if}"
">
<a href="javascript:;">
    <i class="fa fa-briefcase fa-fw"></i> <span class="menu-text">Other</span>
    <span class="arrow"></span>
</a>
<ul class="sub">
{if $smarty.session.AUTHENTICATED|default:"0" == 1}
    {if $GLOBAL.config.disable_contactform|default:"0" != 1}
        <li{if $smarty.request.page|default:false == "contactform"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=contactform">Contact</a></li>
    {/if}
    <li{if $smarty.request.page|default:false == "logout"}
            class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=logout">Logout</a></li>
    {else}
    <li{if $smarty.request.page|default:false == "login"}
            class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=login">Login</a></li>
    <li{if $smarty.request.page|default:false == "register"}
            class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=register">Sign Up</a></li>
    {if $GLOBAL.config.disable_contactform|default:"0" != 1}
        <li{if $smarty.request.page|default:false == "contactform"}
                class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=contactform">Contact</a></li>
    {/if}
    {*<li{if $smarty.request.page|default:false == "tac"}*}
            {*class="current"{/if}><a href="{$smarty.server.PHP_SELF}?page=tac">Terms and Conditions</a></li>*}
{/if}
</ul>


{if $smarty.session.AUTHENTICATED|default:"0" == 0}
    {if !$GLOBAL.website.api.disabled && !$GLOBAL.config.disable_navbar && !$GLOBAL.config.disable_navbar_api}
    <hr>
    <div class="box">
        <div class="box-body center">
            <h3 class="content-title">LIVE STATS</h3>
            <div id="mr" style="width:100%; height:120px;"></div>
            <div id="hr" style="width:100%; height:120px;"></div>
        </div>
    </div>
    {include file="global/navjs.tpl"}
    {/if}
{/if}
</div>
