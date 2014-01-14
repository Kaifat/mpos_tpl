<form action="{$smarty.server.PHP_SELF}" method="POST">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input type="hidden" name="do" value="sendInvitation">

    <div class="col-md-4">
        <div class="box border">
            <div class="box-title"><h4>Invitation</h4></div>
            <div class="box-body">
                <fieldset>
                    <label>E-Mail</label>
                    <input type="text" name="data[email]" value="{$smarty.request.data.email|escape|default:""}"
                           size="30"/>
                </fieldset>
                <fieldset>
                    <label>Message</label>
                    <textarea name="data[message]"
                              rows="5">{$smarty.request.data.message|escape|default:"Please accept my invitation to this awesome pool."}</textarea>
                </fieldset>
            </div>
            <div class="toolbox bottom">
                <div class="submit_link">
                    <input type="submit" value="Invite" class="alt_btn">
                </div>
            </div>
        </div>
    </div>
    </div>
</form>

<div class="col-md-8">
    <div class="box border">
        <div class="box-title"><h4>Past Invitations</h4></div>
        <div class="box-body">
            <table id="datatable1" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-hover">
                <thead style="font-size:13px;">
                <tr>
                    <th>E-Mail</th>
                    <th align="center">Sent</th>
                    <th align="center">Activated</th>
                </tr>
                </thead>
                <tbody>
                {section name=invite loop=$INVITATIONS}
                <tr>
                    <td>{$INVITATIONS[invite].email}</td>
                    <td align="center">{$INVITATIONS[invite].time|date_format:"%d/%m/%Y %H:%M:%S"}</td>
                    <td align="center"><i class="icon-{if $INVITATIONS[invite].is_activated}ok{else}cancel{/if}"></i>
                    </td>
                </tr>
                {/section}
                <tbody>
            </table>
        </div>
    </div>
</div>
