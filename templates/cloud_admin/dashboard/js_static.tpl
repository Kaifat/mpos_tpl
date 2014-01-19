<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.json2.min.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.dateAxisRenderer.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.highlighter.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.trendline.min.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.enhancedLegendRenderer.min.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.canvasAxisTickRenderer.min.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.pointLabels.js"></script>
<script type="text/javascript" src="{$PATH}/js/plugins/jqplot.donutRenderer.js"></script>

<script>
{literal}
$(document).ready(function(){
  var g1, g2, g3, g4,
          g5, g6, g7, g8,
          g9, g10, g11, g12,
          g13, g14, g15, g16;

  var jqPlotShareinfoOptions = {
    title: 'Shares',
    highlighter: { show: false },
    grid: { drawBorder: false, background: '#fbfbfb', shadow: false },
    seriesColors: [ '#26a4ed', '#ee8310', '#e9e744' ],
    seriesDefaults: {
      renderer: $.jqplot.DonutRenderer,
      rendererOptions:{
        ringMargin: 10,
        sliceMargin: 10,
        startAngle: -90,
        showDataLabels: true,
        dataLabels: 'value',
        dataLabelThreshold: 0
      }
    },
    legend: { show: false }
  };

  // Init shares graph
  var plot2 = $.jqplot('shareinfograph', [
      [['your valid', {/literal}{$GLOBAL.userdata.shares.valid}{literal}], ['pool valid', {/literal}{$GLOBAL.roundshares.valid}{literal}]],
      [['your invalid', {/literal}{$GLOBAL.userdata.shares.invalid}{literal}], ['pool invalid', {/literal}{$GLOBAL.roundshares.invalid}{literal}]]
    ], jqPlotShareinfoOptions);


  g1 = new JustGage({id: "nethashrate_digitalcoin", value: parseFloat({/literal}{$GLOBAL.nethashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.nethashrate}{literal} * 2), title: "Net Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.network}{literal}"});
  g2 = new JustGage({id: "poolhashrate_digitalcoin", value: parseFloat({/literal}{$GLOBAL.hashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.hashrate}{literal}* 2), title: "Pool Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.pool}{literal}"});
  g3 = new JustGage({id: "hashrate_digitalcoin", value: parseFloat({/literal}{$GLOBAL.userdata.hashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.userdata.hashrate}{literal} * 2), title: "Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.personal}{literal}"});
  if ({/literal}{$GLOBAL.userdata.sharerate}{literal} > 1) {
    initSharerate = {/literal}{$GLOBAL.userdata.sharerate}{literal} * 2
  } else {
    initSharerate = 1
  }
  g4 = new JustGage({id: "sharerate_digitalcoin", value: parseFloat({/literal}{$GLOBAL.userdata.sharerate}{literal}).toFixed(2), min: 0, max: Math.round(initSharerate), valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, title: "Sharerate", label: "shares/s"});

//-------------------

        g5 = new JustGage({id: "nethashrate_dogeicon", value: parseFloat({/literal}{$GLOBAL.nethashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.nethashrate}{literal} * 2), title: "Net Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.network}{literal}"});
        g6 = new JustGage({id: "poolhashrate_dogeicon", value: parseFloat({/literal}{$GLOBAL.hashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.hashrate}{literal}* 2), title: "Pool Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.pool}{literal}"});
        g7 = new JustGage({id: "hashrate_dogeicon", value: parseFloat({/literal}{$GLOBAL.userdata.hashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.userdata.hashrate}{literal} * 2), title: "Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.personal}{literal}"});
        if ({/literal}{$GLOBAL.userdata.sharerate}{literal} > 1) {
    initSharerate = {/literal}{$GLOBAL.userdata.sharerate}{literal} * 2
} else {
    initSharerate = 1
}
        g8 = new JustGage({id: "sharerate_dogeicon", value: parseFloat({/literal}{$GLOBAL.userdata.sharerate}{literal}).toFixed(2), min: 0, max: Math.round(initSharerate), valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, title: "Sharerate", label: "shares/s"});


//-------------------

        g9 = new JustGage({id: "nethashrate_earthcoin", value: parseFloat({/literal}{$GLOBAL.nethashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.nethashrate}{literal} * 2), title: "Net Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.network}{literal}"});
        g10 = new JustGage({id: "poolhashrate_earthcoin", value: parseFloat({/literal}{$GLOBAL.hashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.hashrate}{literal}* 2), title: "Pool Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.pool}{literal}"});
        g11 = new JustGage({id: "hashrate_earthcoin", value: parseFloat({/literal}{$GLOBAL.userdata.hashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.userdata.hashrate}{literal} * 2), title: "Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.personal}{literal}"});
        if ({/literal}{$GLOBAL.userdata.sharerate}{literal} > 1) {
    initSharerate = {/literal}{$GLOBAL.userdata.sharerate}{literal} * 2
} else {
    initSharerate = 1
}
        g12 = new JustGage({id: "sharerate_earthcoin", value: parseFloat({/literal}{$GLOBAL.userdata.sharerate}{literal}).toFixed(2), min: 0, max: Math.round(initSharerate), valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, title: "Sharerate", label: "shares/s"});


//-------------------

        g13 = new JustGage({id: "nethashrate_fastcoin", value: parseFloat({/literal}{$GLOBAL.nethashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.nethashrate}{literal} * 2), title: "Net Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.network}{literal}"});
        g14 = new JustGage({id: "poolhashrate_fastcoin", value: parseFloat({/literal}{$GLOBAL.hashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.hashrate}{literal}* 2), title: "Pool Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.pool}{literal}"});
        g15 = new JustGage({id: "hashrate_fastcoin", value: parseFloat({/literal}{$GLOBAL.userdata.hashrate}{literal}).toFixed(2), min: 0, max: Math.round({/literal}{$GLOBAL.userdata.hashrate}{literal} * 2), title: "Hashrate", valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, label: "{/literal}{$GLOBAL.hashunits.personal}{literal}"});
        if ({/literal}{$GLOBAL.userdata.sharerate}{literal} > 1) {
    initSharerate = {/literal}{$GLOBAL.userdata.sharerate}{literal} * 2
} else {
    initSharerate = 1
}
        g16 = new JustGage({id: "sharerate_fastcoin", value: parseFloat({/literal}{$GLOBAL.userdata.sharerate}{literal}).toFixed(2), min: 0, max: Math.round(initSharerate), valueFontColor: '#555', shadowOpacity : 0.5, shadowSize : 0, shadowVerticalOffset : 5, title: "Sharerate", label: "shares/s"});


//-------------------

});
{/literal}
</script>
