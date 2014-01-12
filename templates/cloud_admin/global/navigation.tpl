<div class="sidebar-menu nav-collapse">
    <div class="divide-20"></div>
    <!-- SEARCH BAR -->
    <div id="search-bar">
        <input class="search" type="text" placeholder="Search"><i class="fa fa-search search-icon"></i>
    </div>
    <!-- /SEARCH BAR -->

    <!-- SIDEBAR QUICK-LAUNCH -->
    <!-- <div id="quicklaunch">
    <!-- /SIDEBAR QUICK-LAUNCH -->

    <!-- SIDEBAR MENU -->
    <ul>
        <li class="active">
            <a href="{$smarty.server.PHP_SELF}">
                <i class="fa fa-home fa-fw"></i> <span class="menu-text">Home</span>
                <span class="selected"></span>
            </a>
        </li>

        {if $smarty.session.AUTHENTICATED|default:"0" == 1}
        <li class="has-sub">
            <a href="javascript:;">
                <i class="fa fa-bookmark-o fa-fw"></i> <span class="menu-text">My Account</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub">
                <li><a href="{$smarty.server.PHP_SELF}?page=dashboard">Dashboard</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=account&action=edit">Edit Account</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=account&action=workers">My Workers</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=account&action=transactions">Transactions</a></li>
                {if !$GLOBAL.config.disable_notifications}<li><a href="{$smarty.server.PHP_SELF}?page=account&action=notifications">Notifications</a></li>{/if}
                {if !$GLOBAL.config.disable_invitations}<li><a href="{$smarty.server.PHP_SELF}?page=account&action=invitations">Invitations</a></li>{/if}
                <li><a href="{$smarty.server.PHP_SELF}?page=account&action=qrcode">QR Codes</a></li>
            </ul>
        </li>
        {/if}

        {if $smarty.session.AUTHENTICATED|default:"0" == 1 && $GLOBAL.userdata.is_admin == 1}
        <li class="has-sub">
            <a href="javascript:;">
                <i class="fa fa-bookmark-o fa-fw"></i> <span class="menu-text">Admin Panel</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub">
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=dashboard">Dashboard</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=monitoring">Monitoring</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=user">User Info</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=wallet">Wallet Info</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=transactions">Transactions</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=settings">Settings</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=news">News</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=reports">Reports</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=poolworkers">Pool Workers</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=admin&action=templates">Templates</a></li>
            </ul>
        </li>
        {/if}

        {if $smarty.session.AUTHENTICATED|default}
        <li class="has-sub">
            <a href="javascript:;">
                <i class="fa fa-bookmark-o fa-fw"></i> <span class="menu-text">Statistics</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub">
                <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=pool">Pool</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=blocks">Blocks</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=graphs">Graphs</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=round">Round</a></li>
                <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=blockfinder">Finder</a></li>
            {if $GLOBAL.config.monitoring_uptimerobot_api_keys|default:"0"}<li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=uptime">Uptime</a></li>{/if}
            </ul>
        </li>

        {else}

        <li class="has-sub">
            <a href="javascript:;">
                <i class="fa fa-bookmark-o fa-fw"></i> <span class="menu-text">Statistics</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub">
                {if $GLOBAL.acl.pool.statistics}
                    <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=pool">Pool</a></li>
                {else}
                    <li><a href="{$smarty.server.PHP_SELF}?page=statistics">Statistics</a>
                {/if}

                {if $GLOBAL.acl.block.statistics}
                    <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=blocks">Blocks</a></li>
                {/if}

                {if $GLOBAL.acl.round.statistics}
                    <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=round">Round</a></li>
                {/if}

                {if $GLOBAL.acl.blockfinder.statistics}
                    <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=blockfinder">Finder</a></li>
                {/if}

                {if $GLOBAL.acl.uptime.statistics}
                    {if $GLOBAL.config.monitoring_uptimerobot_api_keys|default:"0"}
                        <li><a href="{$smarty.server.PHP_SELF}?page=statistics&action=uptime">Uptime</a></li>
                    {/if}
                {/if}
            </ul>
        </li>
        {/if}

        <li class="has-sub">
            <a href="javascript:;">
                <i class="fa fa-bookmark-o fa-fw"></i> <span class="menu-text">Help</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub">
                <li><a href="{$smarty.server.PHP_SELF}?page=gettingstarted">Getting Started</a></li>

                {if !$GLOBAL.website.about.disabled}
                    <li><a href="{$smarty.server.PHP_SELF}?page=about&action=pool">About</a></li>
                {/if}

                {if !$GLOBAL.website.donors.disabled}
                    <li><a href="{$smarty.server.PHP_SELF}?page=about&action=donors">Donors</a></li>
                {/if}
            </ul>
        </li>

        <li class="has-sub">
            <a href="javascript:;">
                <i class="fa fa-bookmark-o fa-fw"></i> <span class="menu-text">Other</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub">
                {if $smarty.session.AUTHENTICATED|default:"0" == 1}
                    {if $GLOBAL.config.disable_contactform|default:"0" != 1}
                        <li><a href="{$smarty.server.PHP_SELF}?page=contactform">Contact</a></li>
                    {/if}
                    <li><a href="{$smarty.server.PHP_SELF}?page=logout">Logout</a></li>
                {else}
                    <li><a href="{$smarty.server.PHP_SELF}?page=login">Login</a></li>
                    <li><a href="{$smarty.server.PHP_SELF}?page=register">Sign Up</a></li>
                    {if $GLOBAL.config.disable_contactform|default:"0" != 1}
                        <li><a href="{$smarty.server.PHP_SELF}?page=contactform">Contact</a></li>
                    {/if}
                    <li><a href="{$smarty.server.PHP_SELF}?page=tac">Terms and Conditions</a></li>
                {/if}
            </ul>
        </li>

        {*{if $smarty.session.AUTHENTICATED|default:"0" == 1}*}
            {*<!-- br -->*}
        {*{else}*}
            {*{if !$GLOBAL.website.api.disabled && !$GLOBAL.config.disable_navbar && !$GLOBAL.config.disable_navbar_api}*}
                {*<ul>*}
                    {*<center>*}
                        {*<div style="display: inline-block;">*}
                            {*<i><u><b><font size="2">LIVE STATS</font></b></u></i>*}
                            {*<div id="mr" style="width:180px; height:120px;"></div>*}
                            {*<div id="hr" style="width:180px; height:120px;"></div>*}
                        {*</div>*}
                    {*</center>*}
                {*</ul>*}
                {*<hr/>*}
                {*{include file="global/navjs.tpl"}*}
            {*{/if}*}
        {*{/if}*}

    </ul>
</div>
