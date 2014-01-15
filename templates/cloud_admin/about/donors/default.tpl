<div class="col-md-12">
    <div class="box border">
        <div class="box-title">
            <h4>Pool Donors</h4>

            <div class="submit_link">
            {include file="global/pagination.tpl"}
            </div>
        </div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-striped table-hover">
                <thead>
                <tr>
                    <th>Name</th>
                    <th align="right">%</th>
                    <th align="right" style="padding-right: 25px">{$GLOBAL.config.currency} Total</th>
                </tr>
                </thead>
                <tbody>
                {section name=donor loop=$DONORS}
                <tr>
                    <td>{if $DONORS[donor].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}
                        anonymous{else}{$DONORS[donor].username}{/if}</td>
                    <td align="right">{$DONORS[donor].donate_percent}</td>
                    <td align="right" style="padding-right: 25px">{$DONORS[donor].donation|number_format:"2"}</td>
                </tr>
                    {sectionelse}
                <tr>
                    <td align="center" colspan="3">No confirmed donations yet, please be patient!</td>
                </tr>
                {/section}
                </tbody>
            </table>
        </div>
    </div>
</div>