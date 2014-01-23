<div class="col-md-6">
    <div class="box border blue">
        <div class="box-title"><h4>Select Coin</h4></div>
        <form action="{$smarty.server.PHP_SELF}" method="post">
            <div class="box-body">
                <div class="form-group">
                    <div class="submit_link">
                        <input class="btn btn-success btn-block" type="submit" value="EarthCoin" class="alt_btn">
                    </div>
                </div>
                <div class="form-group">
                    <div class="submit_link">
                        <input class="btn btn-success btn-block" type="submit" value="DogeCoin" class="alt_btn">
                    </div>
                </div>
                <div class="form-group">
                    <div class="submit_link">
                        <input class="btn btn-success btn-block" type="submit" value="DigitalCoin" class="alt_btn">
                    </div>
                </div>
                <div class="form-group">
                    <div class="submit_link">
                        <input class="btn btn-success btn-block" type="submit" value="FastCoin" class="alt_btn">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>



<div class="col-md-6">
    <div class="box border blue">
        <div class="box-title"><h4>Mining and Profit Calculator</h4></div>
        <div class="login-box-inline">
            <form action="{$smarty.server.PHP_SELF}" method="post">
                <div class="box-body">
                    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                    <input type="hidden" name="do" value="add">

                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Hash Rate (KH/s):</label>
                                <i class="fa fa-user"></i>
                                <input class="form-control" type="text" name="username" value="1000.00" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Power (Watts):</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" value="500.00" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Power Cost ($/kWh):</label>
                                <i class="fa fa-lightbulb-o"></i>
                                <input class="form-control" type="text" name="username" value="0.10" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Pool Fees %:</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" value="0.00" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Difficulty:</label>
                                <i class="fa fa-user"></i>
                                <input class="form-control" type="text" name="username" value="{$CALC.DGC.difficulty}" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Block Reward:</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" value="{$CALC.DGC.reward}.00000000" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Exchange Rate:</label>
                                <i class="fa fa-user"></i>
                                <input class="form-control" type="text" name="username" value="{$CALC.DGC.price}" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Hardware Costs (USD):</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" value="0.00" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="toolbox bottom">
                    <div class="submit_link">
                        <input class="btn btn-info" type="submit" value="Calculate" class="alt_btn">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="col-md-12">
<div class="box border blue">
<div class="box-title"><h4>FAQ</h4></div>
<div class="box-body">

<div class="row">
<!-- NAV -->
<div id="list-toggle" class="col-md-3">
    <div class="list-group">
        <a href="#tab1" data-toggle="tab" class="list-group-item active">
            <i class="fa fa-suitcase"></i>EarthCoin
        </a>
        <a href="#tab2" data-toggle="tab" class="list-group-item"><i class="fa fa-tags"></i>DogeCoin</a>
        <a href="#tab3" data-toggle="tab" class="list-group-item"><i class="fa fa-user"></i>DigitalCoin</a>
        <a href="#tab4" data-toggle="tab" class="list-group-item"><i class="fa fa-sitemap"></i>FastCoin</a>
        <a href="#tab5" data-toggle="tab" class="list-group-item"><i class="fa fa-arrows"></i>Terms &amp; Conditions</a>
    </div>
</div>
<!-- /NAV -->
<!-- CONTENT -->
<div class="col-md-9">
<div class="tab-content">
<div class="tab-pane active" id="tab1">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse1_1">1. Create account. </a></h3>
            </div>
            <div id="collapse1_1" class="panel-collapse collapse in">
                <div class="panel-body">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Hash Rate (KH/s):</label>
                                <i class="fa fa-user"></i>
                                <input class="form-control" type="text" name="username" placeholder="1000.00" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Power (Watts):</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" placeholder="500.00" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Power Cost ($/kWh):</label>
                                <i class="fa fa-lightbulb-o"></i>
                                <input class="form-control" type="text" name="username" placeholder="0.10" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Pool Fees %:</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" placeholder="0.00" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Difficulty:</label>
                                <i class="fa fa-user"></i>
                                <input class="form-control" type="text" name="username" placeholder="0.31337267" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Block Reward:</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" placeholder="50.00000000" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Exchange Rate:</label>
                                <i class="fa fa-user"></i>
                                <input class="form-control" type="text" name="username" placeholder="0.00000480" size="10" maxlength="20" required>
                            </div>
                            <div class="col-md-6">
                                <label>Hardware Costs (USD):</label>
                                <i class="fa fa-lock"></i>
                                <input class="form-control" type="text" name="password" placeholder="0.00" size="10" maxlength="20" required>&nbsp;
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="toolbox bottom">
                    <div class="submit_link">
                        <input class="btn btn-info" type="submit" value="Calculate" class="alt_btn">
                    </div>
                </div>
            </div>
        </div>
    </div>

  
<div class="tab-pane" id="tab2">
    <div class="panel-group" id="accordion">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse2_1">1. empty</a></h3>
            </div>
            <div id="collapse2_1" class="panel-collapse collapse">
                <div class="panel-body"> empty
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse2_2">2. empty </a></h3>
            </div>
            <div id="collapse2_2" class="panel-collapse collapse">
                <div class="panel-body"> empty
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse2_3">3. empty</a></h3>
            </div>
            <div id="collapse2_3" class="panel-collapse collapse">
                <div class="panel-body">empty
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse2_4">4. empty</a></h3>
            </div>
            <div id="collapse2_4" class="panel-collapse collapse in">
                <div class="panel-body"> empty
                </div>
            </div>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse2_5">5. empty</a></h3>
            </div>
            <div id="collapse2_5" class="panel-collapse collapse">
                <div class="panel-body">empty
                </div>
            </div>
        </div>
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse2_6">6.empty </a></h3>
            </div>
            <div id="collapse2_6" class="panel-collapse collapse">
                <div class="panel-body"> empty
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse2_7">7. empty </a></h3>
            </div>
            <div id="collapse2_7" class="panel-collapse collapse">
                <div class="panel-body">empty
                </div>
            </div>
        </div>
    </div>
</div>
<div class="tab-pane" id="tab3">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse3_1">1. If I post to a public community, does that mean all my
                    friends and followers can see it? </a></h3>
            </div>
            <div id="collapse3_1" class="panel-collapse collapse">
                <div class="panel-body"> No, the posts you share to a public community will not show up in your friends
                    and followers’ Home streams, unless your friends and followers are also members of the same
                    community.
                    Your public community posts will be visible to people who navigate to your profile page unless you
                    have set your settings for them not to appear. Visitors will see text indicating that it was shared
                    to a community.
                    Remember that your private community posts will only be visible to people in those communities,
                    regardless of whether or not you show community posts on your profile.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse3_2">2. How can I control whether my public community posts
                    appear on my profile page? </a></h3>
            </div>
            <div id="collapse3_2" class="panel-collapse collapse">
                <div class="panel-body"> While in communities:
                    Place your cursor in the top left corner for the main menu.
                    Select Settings.
                    Scroll to 'Profile'.
                    Check or uncheck the box next to Show your Google+ communities posts on your Google+ profile
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse3_3">3. Can I change my community from public to private, or
                    vice versa? </a></h3>
            </div>
            <div id="collapse3_3" class="panel-collapse collapse">
                <div class="panel-body">You can turn your community notifications on or off by clicking on the icon on a
                    community’s page.
                    Community members can use notifications to know when new things are shared with their communities.
                    If notifications are On you’ll get a notification by email, on your device, and by the Google
                    toolbar when someone posts something new. A communit's privacy settings currently can't be changed
                    once it's been created. Please pick your desired setting from the start.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse3_4">4. Why aren't people seeing my invites? </a></h3>
            </div>
            <div id="collapse3_4" class="panel-collapse collapse">
                <div class="panel-body"> You can turn your community notifications on or off by clicking on the icon on
                    a community’s page.
                    Community members can use notifications to know when new things are shared with their communities.
                    If notifications are On you’ll get a notification by email, on your device, and by the Google
                    toolbar when someone posts something new.
                    Notifications default on in communities where the membership is moderated - that is, private
                    communities, or public communities where you need to ask to join. It's also on by default for any
                    community you create.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse3_5">5. If I moderate a post out of my community, is it
                    deleted? </a></h3>
            </div>
            <div id="collapse3_5" class="panel-collapse collapse in">
                <div class="panel-body">Notifications default on in communities where the membership is moderated - that
                    is, private communities, or public communities where you need to ask to join. It's also on by
                    default for any community you create.A communit's privacy settings currently can't be changed once
                    it's been created. Please pick your desired setting from the start.
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse3_6">6. Are community names unique? If someone else has a
                    "Software" community, does that prevent me from owning one? </a></h3>
            </div>
            <div id="collapse3_6" class="panel-collapse collapse">
                <div class="panel-body"> They may not see your invites if they don’t have you in their circles, or if
                    they’ve limited the “Who can send you notifications?” setting. Learn more about who can send you
                    notifications. They may not see your invites if they don’t have you in their circles, or if they’ve
                    limited the “Who can send you notifications?” setting. Learn more about who can send you
                    notifications.
                </div>
            </div>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse3_7">7. How can I control how many community invitations I
                    receive? </a></h3>
            </div>
            <div id="collapse3_7" class="panel-collapse collapse">
                <div class="panel-body">A communit's privacy settings currently can't be changed once it's been created.
                    Please pick your desired setting from the start. A communit's privacy settings currently can't be
                    changed once it's been created. Please pick your desired setting from the start. A communit's
                    privacy settings currently can't be changed once it's been created. Please pick your desired setting
                    from the start.
                </div>
            </div>
        </div>
    </div>
</div>
<div class="tab-pane" id="tab4">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse4_1">1. If I post to a public community, does that mean all my
                    friends and followers can see it? </a></h3>
            </div>
            <div id="collapse4_1" class="panel-collapse collapse in">
                <div class="panel-body"> No, the posts you share to a public community will not show up in your friends
                    and followers’ Home streams, unless your friends and followers are also members of the same
                    community.
                    Your public community posts will be visible to people who navigate to your profile page unless you
                    have set your settings for them not to appear. Visitors will see text indicating that it was shared
                    to a community.
                    Remember that your private community posts will only be visible to people in those communities,
                    regardless of whether or not you show community posts on your profile.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse4_2">2. How can I control whether my public community posts
                    appear on my profile page? </a></h3>
            </div>
            <div id="collapse4_2" class="panel-collapse collapse">
                <div class="panel-body"> While in communities:
                    Place your cursor in the top left corner for the main menu.
                    Select Settings.
                    Scroll to 'Profile'.
                    Check or uncheck the box next to Show your Google+ communities posts on your Google+ profile
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse4_3">3. Can I change my community from public to private, or
                    vice versa? </a></h3>
            </div>
            <div id="collapse4_3" class="panel-collapse collapse">
                <div class="panel-body">You can turn your community notifications on or off by clicking on the icon on a
                    community’s page.
                    Community members can use notifications to know when new things are shared with their communities.
                    If notifications are On you’ll get a notification by email, on your device, and by the Google
                    toolbar when someone posts something new. A communit's privacy settings currently can't be changed
                    once it's been created. Please pick your desired setting from the start.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse4_4">4. Why aren't people seeing my invites? </a></h3>
            </div>
            <div id="collapse4_4" class="panel-collapse collapse">
                <div class="panel-body"> You can turn your community notifications on or off by clicking on the icon on
                    a community’s page.
                    Community members can use notifications to know when new things are shared with their communities.
                    If notifications are On you’ll get a notification by email, on your device, and by the Google
                    toolbar when someone posts something new.
                    Notifications default on in communities where the membership is moderated - that is, private
                    communities, or public communities where you need to ask to join. It's also on by default for any
                    community you create.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse4_5">5. If I moderate a post out of my community, is it
                    deleted? </a></h3>
            </div>
            <div id="collapse4_5" class="panel-collapse collapse">
                <div class="panel-body">Notifications default on in communities where the membership is moderated - that
                    is, private communities, or public communities where you need to ask to join. It's also on by
                    default for any community you create.A communit's privacy settings currently can't be changed once
                    it's been created. Please pick your desired setting from the start.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse4_6">6. Are community names unique? If someone else has a
                    "Software" community, does that prevent me from owning one? </a></h3>
            </div>
            <div id="collapse4_6" class="panel-collapse collapse">
                <div class="panel-body"> They may not see your invites if they don’t have you in their circles, or if
                    they’ve limited the “Who can send you notifications?” setting. Learn more about who can send you
                    notifications. They may not see your invites if they don’t have you in their circles, or if they’ve
                    limited the “Who can send you notifications?” setting. Learn more about who can send you
                    notifications.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse4_7">7. How can I control how many community invitations I
                    receive? </a></h3>
            </div>
            <div id="collapse4_7" class="panel-collapse collapse">
                <div class="panel-body">A communit's privacy settings currently can't be changed once it's been created.
                    Please pick your desired setting from the start. A communit's privacy settings currently can't be
                    changed once it's been created. Please pick your desired setting from the start. A communit's
                    privacy settings currently can't be changed once it's been created. Please pick your desired setting
                    from the start.
                </div>
            </div>
        </div>
    </div>
</div>

</div>

</div>
</div>
</div>
{*</div>*}
<!-- /CONTENT -->
{*</div>*}
<!-- /FAQ -->
</div>
</div>



<div class="col-md-12">
    <div class="box border blue">
        <div class="box-title"><h4>Summary</h4></div>
        <div class="box-body center">
        <p>Days to generate one block mining solo: <strong><span>0.02</span> Day(s)</strong> (can vary greatly depending on your luck)</p>
        <p>Days to generate one BTC: <strong><span>64.91</span> Day(s)</strong> (can vary greatly depending on the current exchange rates)
        </p>
        <p>Days to break even: <strong><span>0.00</span> Day(s)</strong> (can vary greatly depending on the current exchange rates)
        </p>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="box border blue">
        <div class="box-title"><h4>Estimated Expected Earnings</h4></div>
        <div class="box-body">
            <table id="datatable2" cellpadding="0" cellspacing="0" border="0"
                   class="datatable table table-striped">
                <thead>
                <tr>
                    <th align="center">Time Frame</th>
                    <th><span>ALF</span> Coins</th>
                    <th>BTC (ANC/BTC at 0.00469115)</th>
                    <th align="center">USD (BTC at $962.31)</th>
                    <th>Power Cost (in USD)</th>
                    <th>Pool Fees (in USD)</th>
                    <th>Profit (in USD)</th>
                </tr>
                </thead>
                <tbody style="font-size:12px;">
                <tr>
                    <td>Hourly</td>
                </tr>
                <tr>
                    <td>Daily</td>
                </tr>
                <tr>
                    <td>Weekly</td>
                </tr>
                <tr>
                    <td>Monthly</td>
                </tr>
                <tr>
                    <td>Annually</td>
                </tr>
                {*{section transaction $TRANSACTIONS}*}
                {*<tr class="{cycle values="odd,even"}">*}
                    {*<td align="center">{$TRANSACTIONS[transaction].id}</td>*}
                    {*<td>{$TRANSACTIONS[transaction].timestamp}</td>*}
                    {*<td>{$TRANSACTIONS[transaction].type}</td>*}
                    {*<td align="center">*}
                        {*{if $TRANSACTIONS[transaction].type == 'Credit_PPS' OR*}
                        {*$TRANSACTIONS[transaction].type == 'Fee_PPS' OR*}
                        {*$TRANSACTIONS[transaction].type == 'Donation_PPS' OR*}
                        {*$TRANSACTIONS[transaction].type == 'Debit_MP' OR*}
                        {*$TRANSACTIONS[transaction].type == 'Debit_AP' OR*}
                        {*$TRANSACTIONS[transaction].type == 'TXFee' OR*}
                        {*$TRANSACTIONS[transaction].confirmations >= $GLOBAL.confirmations*}
                        {*}<span class="confirmed">Confirmed</span>*}
                            {*{else if $TRANSACTIONS[transaction].confirmations == -1}<span class="orphan">Orphaned</span>*}
                            {*{else}<span class="unconfirmed">Unconfirmed</span>{/if}*}
                    {*</td>*}
                    {*<td><a href="#"*}
                           {*onClick="alert('{$TRANSACTIONS[transaction].coin_address|escape}')">{$TRANSACTIONS[transaction].coin_address|truncate:20:"...":true:true}</a>*}
                    {*</td>*}
                    {*{if ! $GLOBAL.website.transactionexplorer.disabled}*}
                        {*<td><a href="{$GLOBAL.website.transactionexplorer.url}{$TRANSACTIONS[transaction].txid|escape}"*}
                               {*title="{$TRANSACTIONS[transaction].txid|escape}">{$TRANSACTIONS[transaction].txid|truncate:20:"...":true:true}</a>*}
                        {*</td>*}
                        {*{else}*}
                        {*<td><a href="#" onClick="alert('{$TRANSACTIONS[transaction].txid|escape}')"*}
                               {*title="{$TRANSACTIONS[transaction].txid|escape}">{$TRANSACTIONS[transaction].txid|truncate:20:"...":true:true}</a>*}
                        {*</td>*}
                    {*{/if}*}
                    {*<td>{if $TRANSACTIONS[transaction].height == 0}n/a{else}<a*}
                            {*href="{$smarty.server.PHP_SELF}?page=statistics&action=round&height={$TRANSACTIONS[transaction].height}">{$TRANSACTIONS[transaction].height}</a>{/if}*}
                    {*</td>*}
                    {*<td><font*}
                            {*color="{if $TRANSACTIONS[transaction].type == 'Credit' or $TRANSACTIONS[transaction].type == 'Credit_PPS' or $TRANSACTIONS[transaction].type == 'Bonus'}green{else}red{/if}">{$TRANSACTIONS[transaction].amount|number_format:"8"}*}
                    {*</td>*}
                {*</tr>*}
                {*{/section}*}
                </tbody>
            </table>
        </div>
        <div class="toolbox bottom">
            <p style="margin-left: 25px; font-size: 11px;"><b>Debit_AP</b> = Auto Threshold Payment,&nbsp;&nbsp;&nbsp;<b>Debit_MP</b> = Manual Payment,&nbsp;&nbsp;&nbsp;<b>Donation</b> = Donation,&nbsp;&nbsp;&nbsp;<b>Fee</b> = Pool Fees (if applicable)</p>
        </div>
    </div>
</div>

