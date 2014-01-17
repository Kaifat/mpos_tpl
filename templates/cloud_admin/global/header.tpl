<div class="container">
    <div class="navbar-brand">
        <!-- COMPANY LOGO -->
        <h1 class="site_title"><a href="{$smarty.server.PHP_SELF}">{$GLOBAL.website.name|default:"Unknown Pool"}</a></h1>
        <!-- /COMPANY LOGO -->
        <!-- TEAM STATUS FOR MOBILE -->
        <div class="visible-xs">
            <a href="#" class="team-status-toggle switcher btn dropdown-toggle">
                <i class="fa fa-users"></i>
            </a>
        </div>
        <!-- /TEAM STATUS FOR MOBILE -->
        <!-- SIDEBAR COLLAPSE -->
        <div id="sidebar-collapse" class="sidebar-collapse btn">
            <i class="fa fa-bars"
               data-icon1="fa fa-bars"
               data-icon2="fa fa-bars" ></i>
        </div>
        <!-- /SIDEBAR COLLAPSE -->
    </div>

    {include file="global/userinfo.tpl"}
</div>
