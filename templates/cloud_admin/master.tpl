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
    <!-- BOOTSTRAP SWITCH -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/bootstrap-switch/bootstrap-switch.min.css" />
    <!-- TODO -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/jquery-todo/css/styles.css"/>
    <!-- FULL CALENDAR -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/fullcalendar/fullcalendar.min.css"/>
    <!-- DROPZONE -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/dropzone/dropzone.min.css" />
    <!-- GRITTER -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/gritter/css/jquery.gritter.css"/>
    <!-- SELECT2 -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/select2/select2.min.css" />
    <!-- FUELUX TREE -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/fuelux-tree/fuelux.min.css" />
    <!-- CROP AVATAR -->
    <link rel="stylesheet" type="text/css" href="{$PATH}/js/jquery-imgareaselect/css/imgareaselect-animated.css" />
    <!-- FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>

    <!-- JAVASCRIPTS -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- JQUERY -->
    <script src="{$PATH}/js/jquery/jquery-2.0.3.min.js"></script>
    <!-- JQUERY UI-->
    <script src="{$PATH}/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <!-- BOOTSTRAP -->
    <script src="{$PATH}/bootstrap/js/bootstrap.min.js"></script>

    <!-- jqplot -->
    <script src="{$PATH}/js/jquery.jqplot.min.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.json2.min.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.dateAxisRenderer.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.highlighter.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.canvasTextRenderer.min.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.trendline.min.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.enhancedLegendRenderer.min.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.canvasTextRenderer.min.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.canvasAxisTickRenderer.min.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.pointLabels.js"></script>
    <script src="{$PATH}/js/plugins/jqplot.donutRenderer.js"></script>


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
    <!-- FLOT GROWRAF -->
    <script src="{$PATH}/js/flot-growraf/jquery.flot.growraf.min.js"></script>
    <!-- GAGE -->
    <script src="{$PATH}/js/justgage/js/raphael.2.1.0.min.js"></script>
    <script src="{$PATH}/js/justgage/js/justgage.1.0.1.min.js"></script>
    <!-- TODO -->
    <script type="text/javascript" src="{$PATH}/js/jquery-todo/js/paddystodolist.js"></script>
    <!-- TIMEAGO -->
    <script type="text/javascript" src="{$PATH}/js/timeago/jquery.timeago.min.js"></script>
    <!-- FULL CALENDAR -->
    <script type="text/javascript" src="{$PATH}/js/fullcalendar/fullcalendar.min.js"></script>
    <!-- COOKIE -->
    <script type="text/javascript" src="{$PATH}/js/jQuery-Cookie/jquery.cookie.min.js"></script>
    <!-- DROPZONE -->
    <script type="text/javascript" src="{$PATH}/js/dropzone/dropzone.min.js"></script>
    <!-- GRITTER -->
    <script type="text/javascript" src="{$PATH}/js/gritter/js/jquery.gritter.min.js"></script>
    <!-- SELECT2 -->
    <script type="text/javascript" src="{$PATH}/js/select2/select2.min.js"></script>
    <!-- FUELUX TREE -->
    <script type="text/javascript" src="{$PATH}/js/fuelux-tree/fuelux.tree-sampledata.js"></script>
    <script type="text/javascript" src="{$PATH}/js/fuelux-tree/fuelux.tree.min.js"></script>
    <!-- CROP AVATAR -->
    <script type="text/javascript" src="{$PATH}/js/jquery-imgareaselect/jquery.imgareaselect.pack.js"></script>
    <!-- BOOTSTRAP SWITCH -->
    <script type="text/javascript" src="{$PATH}/js/bootstrap-switch/bootstrap-switch.min.js"></script>
    <!-- UNIFORM -->
    <!-- CUSTOM SCRIPT -->
    <script src="{$PATH}/js/script.js"></script>

    <script type="text/javascript" src="{$PATH}/../global/js/number_format.js"></script>

    <script>
        jQuery(document).ready(function () {
            App.setThemePath("{$PATH}/");
            App.setPage("{$smarty.request.page|escape|default:'home'}");  //Set current page
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
                                        <h3 class="content-title pull-left">{if $smarty.request.action|escape|default:""}{$smarty.request.action|escape|capitalize}{else}{$smarty.request.page|escape|capitalize|default:"HOME"}{/if}</h3>
                                    </div>
                                    <div class="description"></div>
                                </div>
                            </div>
                        </div>

                        {if is_array($smarty.session.POPUP|default)}
                            {section popup $smarty.session.POPUP}
                                <div class="col-md-12">
                                    <div class="alert alert-block alert-{$smarty.session.POPUP[popup].TYPE|default:"info"} fade in">
                                        <a aria-hidden="true" href="#" data-dismiss="alert" class="close">×</a>
                                        <p>
                                        {if $smarty.session.POPUP[popup].TYPE|default:"info" == 'warning'}
                                        <h4><i class="fa fa-exclamation-circle"></i> Warning!</h4>
                                        {else}
                                        <h4><i class="fa fa-check-square-o"></i> Successful!</h4>
                                        {/if}
                                        {$smarty.session.POPUP[popup].CONTENT}</p>
                                    </div>
                                </div>
                            {/section}
                        {/if}
                        {if $CONTENT != "empty" && $CONTENT != ""}
                            {if file_exists($smarty.current_dir|cat:"/$PAGE/$ACTION/$CONTENT")}
                                {include file="$PAGE/$ACTION/$CONTENT"}
                            {else}
                                Missing template for this page
                            {/if}
                        {/if}

                        {*<div class="row">*}
                            {*<div class="col-sm-12">*}
                                {*<div class="footer-tools">*}
                                      {*<span class="go-top">*}
                                        {*<i class="fa fa-chevron-up"></i>*}
                            {*Top*}
                            {*</span>*}
                                    {*</div>*}
                                {*</div>*}
                        {*</div>*}

                    </div>

                    <div id="footer" class="modal-footer">
                        {include file="global/footer.tpl"}
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/PAGE -->
</body>
</html>
