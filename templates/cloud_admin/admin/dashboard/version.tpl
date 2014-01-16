{nocache}
<div class="col-md-4">
    <div class="box border blue">
        <div class="box-title"><h4>MPOS Version Information</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                <thead>
                <tr>
                    <th>Component</th>
                    <th>Current</th>
                    <th>Installed</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><strong>MPOS</strong></td>
                    <td><font color="green">{$VERSION['CURRENT']['CORE']}</font></td>
                    <td>
                        <font color="{if $VERSION['INSTALLED']['CORE'] == $VERSION['CURRENT']['CORE']}green{else}red{/if}">{$VERSION['INSTALLED']['CORE']}</font>
                    </td>
                </tr>
                <tr>
                    <td><strong>Config</strong></td>
                    <td><font color="green">{$VERSION['CURRENT']['CONFIG']}</font></td>
                    <td>
                        <font color="{if $VERSION['INSTALLED']['CONFIG'] == $VERSION['CURRENT']['CONFIG']}green{else}red{/if}">{$VERSION['INSTALLED']['CONFIG']}</font>
                    </td>
                </tr>
                <tr>
                    <td><strong>Database</strong></td>
                    <td><font color="green">{$VERSION['CURRENT']['DB']}</font></td>
                    <td>
                        <font color="{if $VERSION['INSTALLED']['DB'] == $VERSION['CURRENT']['DB']}green{else}red{/if}">{$VERSION['INSTALLED']['DB']}</font>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
{/nocache}
