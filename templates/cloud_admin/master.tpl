<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>{$GLOBAL.website.title} I {$smarty.request.page|escape|default:"home"|capitalize}</title>

    <link rel="stylesheet" type="text/css" href="{$PATH}/css/cloud-admin.css">
    <link rel="stylesheet" type="text/css" href="{$PATH}/css/additional.css">
    <link rel="stylesheet" type="text/css" href="{$PATH}/css/themes/default.css" id="skin-switcher">
    <link rel="stylesheet" type="text/css" href="{$PATH}/css/responsive.css">
    <!-- STYLESHEETS --><!--[if lt IE 9]>
    <script src="{$PATH}/js/flot/excanvas.min.js"></script>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
    <link href="{$PATH}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- ANIMATE -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/css/animatecss/animate.min.css"/>
    <!-- DATE RANGE PICKER -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
    <!-- TODO -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/jquery-todo/css/styles.css"/>
    <!-- FULL CALENDAR -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/fullcalendar/fullcalendar.min.css"/>
    <!-- GRITTER -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/gritter/css/jquery.gritter.css"/>
    <!-- FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>

    <!-- JAVASCRIPTS -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- JQUERY -->
    <script src="{$PATH}/js/jquery/jquery-2.0.3.min.js"></script>
    <!-- JQUERY UI-->
    <script src="{$PATH}/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <!-- BOOTSTRAP -->
    <script src="{$PATH}/bootstrap/js/bootstrap.min.js"></script>


    <!-- DATE RANGE PICKER -->
    <script src="{$PATH}/js/bootstrap-daterangepicker/moment.min.js"></script>

    <script src="{$PATH}/js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
    <!-- SLIMSCROLL -->
    <script type="text/javascript" src="{$PATH}/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
    <!-- SLIMSCROLL -->
    <script type="text/javascript" src="{$PATH}/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="{$PATH}/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
    <!-- BLOCK UI -->
    <script type="text/javascript" src="{$PATH}/js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
    <!-- SPARKLINES -->
    <script type="text/javascript" src="{$PATH}/js/sparklines/jquery.sparkline.min.js"></script>
    <!-- EASY PIE CHART -->
    <script src="{$PATH}/js/jquery-easing/jquery.easing.min.js"></script>
    <script type="text/javascript" src="{$PATH}/js/easypiechart/jquery.easypiechart.min.js"></script>
    <!-- FLOT CHARTS -->
    <script src="{$PATH}/js/flot/jquery.flot.min.js"></script>
    <script src="{$PATH}/js/flot/jquery.flot.time.min.js"></script>
    <script src="{$PATH}/js/flot/jquery.flot.selection.min.js"></script>
    <script src="{$PATH}/js/flot/jquery.flot.resize.min.js"></script>
    <script src="{$PATH}/js/flot/jquery.flot.pie.min.js"></script>
    <script src="{$PATH}/js/flot/jquery.flot.stack.min.js"></script>
    <script src="{$PATH}/js/flot/jquery.flot.crosshair.min.js"></script>
    <!-- TODO -->
    <script type="text/javascript" src="{$PATH}/js/jquery-todo/js/paddystodolist.js"></script>
    <!-- TIMEAGO -->
    <script type="text/javascript" src="{$PATH}/js/timeago/jquery.timeago.min.js"></script>
    <!-- FULL CALENDAR -->
    <script type="text/javascript" src="{$PATH}/js/fullcalendar/fullcalendar.min.js"></script>
    <!-- COOKIE -->
    <script type="text/javascript" src="{$PATH}/js/jQuery-Cookie/jquery.cookie.min.js"></script>
    <!-- GRITTER -->
    <script type="text/javascript" src="{$PATH}/js/gritter/js/jquery.gritter.min.js"></script>
    <!-- CUSTOM SCRIPT -->
    <script src="{$PATH}/js/script.js"></script>

    <script>
        jQuery(document).ready(function () {
            App.setThemePath("{$PATH}/");
            App.setPage("index");  //Set current page
            App.init(); //Initialise plugins and elements
        });
    </script>
    <!-- /JAVASCRIPTS -->

    {if $GLOBAL.statistics.analytics.enabled}
        {$GLOBAL.statistics.analytics.code nofilter}
    {/if}

</head>
<body>
    <!-- HEADER -->
    <header class="navbar clearfix" id="header">
        {include file="global/header.tpl"}
    </header>
    <!--/HEADER -->
    <!-- PAGE -->
    <section id="page">
        <div id="sidebar" class="sidebar">
            {include file="global/navigation.tpl"}
        </div>

        <div id="main-content">
            <!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
            <div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Box Settings</h4>
                        </div>
                        <div class="modal-body">
                            Here goes box setting content.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
            <div class="container">
                <div class="row">
                    <div id="content" class="col-lg-12">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <!-- BREADCRUMBS -->
                                    {include file="global/breadcrumbs.tpl"}
                                    <!-- /BREADCRUMBS -->
                                    <div class="clearfix">
                                        <h3 class="content-title pull-left">{if $smarty.request.action|escape|default:""}{$smarty.request.action|escape|capitalize}{else}{$smarty.request.page|escape|default:"home"|capitalize}{/if}</h3>
                                    </div>
                                    <div class="description">{if $smarty.request.action|escape|default:""}{$smarty.request.action|escape}{else}{$smarty.request.page|escape|default:"home"}{/if}</div>
                                </div>
                            </div>
                        </div>

                        {if is_array($smarty.session.POPUP|default)}
                            {section popup $smarty.session.POPUP}
                                <h4 class="{$smarty.session.POPUP[popup].TYPE|default:"info"}">{$smarty.session.POPUP[popup].CONTENT}</h4>
                            {/section}
                        {/if}
                        {if $CONTENT != "empty" && $CONTENT != ""}
                            {if file_exists($smarty.current_dir|cat:"/$PAGE/$ACTION/$CONTENT")}
                                {include file="$PAGE/$ACTION/$CONTENT"}
                            {else}
                                Missing template for this page
                            {/if}
                        {/if}
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="footer-tools">
                            <span class="go-top">
                            <i class="fa fa-chevron-up"></i>
                            Top
                            </span>
                        </div>
                    </div>
                </div>

                <div class="separator"></div>

                <div class="row">
                    {include file="global/footer.tpl"}
                </div>
            </div>
        </div>
    </section>
    <!--/PAGE -->
</body>
</html>
