<div class="col-md-12">
    <div class="box border">
        <div class="box-title"><h4>Settings</h4></div>
        <div class="box-body">
            <form method="POST" class="form-horizontal" role="form">
                <input type="hidden" name="page" value="{$smarty.request.page|escape}"/>
                <input type="hidden" name="action" value="{$smarty.request.action|escape}"/>
                <input type="hidden" name="do" value="save"/>

                <div class="tabbable header-tabs">
                    <ul class="nav nav-tabs">
                    {foreach name=tabs item=TAB from=array_reverse(array_keys($SETTINGS))}
                        <li{if $smarty.foreach.tabs.last} class="active"{/if}><a href="#{$TAB}" data-toggle="tab">{$TAB|capitalize}</a></li>
                    {/foreach}
                    </ul>
                </div>

                <div class="tab-content">
                {foreach name="formGroup" item=TAB from=array_keys($SETTINGS)}
                    <div class="tab-pane active" id="{$TAB}">
                        {section name=setting loop=$SETTINGS.$TAB}
                            <div class="form-group">
                                <label for="e{$smarty.foreach.formGroup.index+1}" class="col-md-2 control-label">{$SETTINGS.$TAB[setting].display}</label>
                                <div class="col-md-10">

                                    {if $SETTINGS.$TAB[setting].tooltip|default}<p>{$SETTINGS.$TAB[setting].tooltip}</p>{/if}

                                {if $SETTINGS.$TAB[setting].type == 'select'}
                                    {html_options class="col-md-12" id="e{$smarty.foreach.formGroup.index+1}" name="data[{$SETTINGS.$TAB[setting].name}]" options=$SETTINGS.$TAB[setting].options selected=$SETTINGS.$TAB[setting].value|default:$SETTINGS.$TAB[setting].default}
                                    {else if $SETTINGS.$TAB[setting].type == 'text'}
                                    <input class="form-control" type="text" size="{$SETTINGS.$TAB[setting].size}"
                                           name="data[{$SETTINGS.$TAB[setting].name}]"
                                           value="{$SETTINGS.$TAB[setting].value|default:$SETTINGS.$TAB[setting].default|escape:"html"}"/>
                                    {else if $SETTINGS.$TAB[setting].type == 'textarea'}
                                    <textarea class="form-control" name="data[{$SETTINGS.$TAB[setting].name}]"
                                              cols="{$SETTINGS.$TAB[setting].size|default:"1"}"
                                              rows="{$SETTINGS.$TAB[setting].height|default:"1"}">{$SETTINGS.$TAB[setting].value|default:$SETTINGS.$TAB[setting].default}</textarea>
                                    {else}
                                    Unknown option type: {$SETTINGS.$TAB[setting].type}
                                {/if}
                                </div>
                            </div>
                        {/section}
                    </div>
                {/foreach}
                </div>
                <div class="toolbox bottom">
                    <div class="submit_link">
                        <input class="btn btn-inverse" type="submit" value="Save" class="alt_btn">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
