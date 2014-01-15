<div class="col-md-12">
    <div class="box border">
        <div class="box-title"><h4>General Statistics</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-hover">
                <tbody>
                <tr>
                    <td class="leftheader">Pool Hash Rate</td>
                    <td>{$GLOBAL.hashrate} {$GLOBAL.hashunits.pool}</td>
                </tr>
                <tr>
                    <td class="leftheader">Current Total Miners</td>
                    <td>{$GLOBAL.workers}</td>
                </tr>
                <tr>
                    <td class="leftheader">Current Block</td>
                    <td><a href="{$GLOBAL.website.blockexplorer.url}{$CURRENTBLOCK}" target="_new">{$CURRENTBLOCK}</a>
                    </td>
                </tr>
                <tr>
                    <td class="leftheader">Current Difficulty</td>
                    <td><a href="http://allchains.info/" target="_new">{$DIFFICULTY}</a></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="toolbox bottom">
            {if !$GLOBAL.website.api.disabled}
            <ul>
                <li>These stats are also available in JSON format <a href="{$smarty.server.PHP_SELF}?page=api&action=public" target="_api">HERE</a>
                </li>
            <ul>
            {/if}
        </div>
    </div>
</div>
