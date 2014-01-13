{nocache}
<div class="col-md-4">
    <div class="box border">
        <div class="box-title">Users</div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-hover">
                <thead>
                <tr>
                    <th align="center">Total</th>
                    <th align="center">Active</th>
                    <th align="center">Locked</th>
                    <th align="center">Admins</th>
                    <th align="center">No Fees</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td align="center">{$USER_INFO.total}</td>
                    <td align="center">{$USER_INFO.active}</td>
                    <td align="center">{$USER_INFO.locked}</td>
                    <td align="center">{$USER_INFO.admins}</td>
                    <td align="center">{$USER_INFO.nofees}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
{/nocache}
