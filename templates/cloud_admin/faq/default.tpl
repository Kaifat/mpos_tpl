<!-- FAQ -->
<div class="col-md-12">
<div class="box border blue">
<div class="box-title"><h4>FAQ</h4></div>
<div class="box-body">

<div class="row">
<!-- NAV -->
<div id="list-toggle" class="col-md-3">
    <div class="list-group">
        <a href="#tab1" data-toggle="tab" class="list-group-item active">
            <i class="fa fa-suitcase"></i> Getting Started Guide
        </a>
        <a href="#tab2" data-toggle="tab" class="list-group-item"><i class="fa fa-tags"></i> Payment</a>
        <a href="#tab3" data-toggle="tab" class="list-group-item"><i class="fa fa-user"></i> Tabs 3</a>
        <a href="#tab4" data-toggle="tab" class="list-group-item"><i class="fa fa-sitemap"></i> Tabs 4</a>
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
                    <ul>
                        <li>Register <a href="{$smarty.server.PHP_SELF}?page=register">here</a>, or login if you already
                            have account
                        </li>
                        <li>Create a <a href="{$smarty.server.PHP_SELF}?page=account&action=workers">worker</a> that will be
                            used by the miner to login
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse1_2">2. Download a miner. </a></h3>
            </div>
            <div id="collapse1_2" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul>
                        <li><em>CGMiner Linux/Windows:</em> <a href="http://ck.kolivas.org/apps/cgminer/" target="_blank">Download
                            here</a></li>
                        <li><em>CGMiner Mac OS X:</em> <a href="http://spaceman.ca/cgminer/" target="_blank">Download
                            here</a></li>
                        <li><em>CPU Miner Mac/Linux/Windows:</em> precompiled binaries are available <a
                                href="https://bitcointalk.org/index.php?topic=55038.msg654850#msg654850" target="_blank">Download
                            here</a>.
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse1_3">3.Configure your miner.</a></h3>
            </div>
            <div id="collapse1_3" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>Settings for Stratum (recommended):</p>
                    <table width="50%">
                        <tbody>
                        <tr>
                            <td>STRATUM:</td>
                            <td><kbd>stratum+tcp://{$SITESTRATUMURL|default:$smarty.server.SERVER_NAME}</kbd></td>
                        </tr>
                        <tr>
                            <td>PORT:</td>
                            <td><kbd>{$SITESTRATUMPORT|default:"3333"}</kbd></td>
                        </tr>
                        <tr>
                            <td>Username:</td>
                            <td><kbd><em>Weblogin</em>.<em>Worker</em></kbd></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><kbd>Worker Password</kbd></td>
                        </tr>
                        </tbody>
                    </table>
                    <p>If you use a command-line miner, type:</p>
                <pre>./cgminer {if $GLOBAL.config.algorithm == 'scrypt'}--scrypt {/if} -o stratum+tcp://{$SITESTRATUMURL|default:$smarty.server.SERVER_NAME} :{$SITESTRATUMPORT|default:"3333"} -u <em>Weblogin</em>.<em>Worker</em> -p <em>Worker password</em></pre>
                    <p>If you want, you can create additional workers with usernames and passwords of your choice <a
                            href="{$smarty.server.PHP_SELF}?page=account&action=workers">Here</a></p>
                </div>
            </div>
        </div>
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse1_4">4. Create a {$SITECOINNAME|default:"Litecoin"} address to recieve payments.</a></h3>
            </div>
            <div id="collapse1_4" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul>
                        <li> Downloading the client &amp; block chain: Download the {$SITECOINNAME|default:"Litecoin"}client
                            from <a href="{$SITECOINURL|default:"http://www.litecoin.org"}" target="_blank">here</a>.
                            <p>Generate a new address and input it on your account page to receive payments.</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse1_5">5. Advanced cgminer settings / FAQ</a></h3>
            </div>
            <div id="collapse1_5" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul>
                        <li><a href="https://github.com/ckolivas/cgminer/blob/master/SCRYPT-README" target="_blank">Scrypt
                            readme</a></li>
                        <li>Don't set <b>intensity</b> too high, I=11 is standard and safest. Higher intensity takes more
                            GPU RAM. Check for <b>hardware errors</b> in cgminer (HW). HW=0 is good, otherwise lower
                            intensity :)
                        </li>
                        <li>Set shaders according to the readme (or look at your graphic cards specifications). Cgminer uses
                            this value at first run to calculate <b>thread-concurrency</b>. Easiest way to get this
                            optimized is to use same settings as others have used here: <a
                                    href="http://litecoin.info/Mining_Hardware_Comparison">here</a>.
                        </li>
                        <li>There's also an interesting project which gives you a GUI for cgminer. Windows only it seems.
                        </li>
                        <li>Here's a great <a
                                href="https://docs.google.com/document/d/1Gw7YPYgMgNNU42skibULbJJUx_suP_CpjSEdSi8_z9U/preview?sle=true"
                                target="_blank">guide</a> how to get up and running with Xubuntu.
                        </li>
                    </ul>
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
<div class="tab-pane" id="tab5">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse5_1">1. This Agreement governs your use of {$GLOBAL.website.name}. </a></h3>
            </div>
            <div id="collapse5_1" class="panel-collapse collapse">
                <div class="panel-body">
                    <ol>
                        <li>By using any of the Pools or registering an account on the website, you agree to be bound by the
                            terms and conditions below. If you do not agree with the terms and conditions in this Agreement you
                            may not use the Pool.
                        </li>
                        <li>The {$GLOBAL.website.name} staff may modify this Agreement and any policies affecting the Site at
                            any point of time. Such modification is effective immediately upon posting to the website and will
                            be distribution via email, forum post and a link in chat. Your continued use of the Pool following
                            any modification to this Agreement shall be deemed an acceptance of all modifications.
                        </li>
                        <li>The Pool rewards miners according to a <strong>{$GLOBAL.config.payout_system}</strong> system with
                            <strong>{$GLOBAL.fees}%</strong> fee. The fee may change at any time, but notice will be given
                            before doing so. Any fee change will be communicated through the pools news page.
                        </li>
                        <li>The Pool is not an e-wallet or a bank for your coins. The Pool and it's operators are not
                            responsible for any loss of coins which are stored on the Pool. It is your responsibility to
                            configure your account so that the coins you mine are regularly transferred to your own secured
                            offline wallet.
                        </li>
                        <li>The uptime of the pool or website is not guaranteed, maintenance and downtime may be required at
                            times. Users are responsible for configuring their miners so that they will automatically reconnect,
                            switch to all the pools we offer or a backup pool in the case of downtime.
                        </li>
                        <li>Botnets are not welcome. Accounts with a large amount of miners connecting from different IPs may be
                            suspended without prior notice. If we are uncertian then an investigation will be opened and the
                            user will be notified via their configured e-mail address. If we do not receive a response your
                            account may be suspended.
                        </li>
                        <li>Multiple accounts controlled by one person may be considered as a botnet and a investigation will be
                            opened, see 6.
                        </li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse5_2">2. How can I control whether my public community posts
                    appear on my profile page? </a></h3>
            </div>
            <div id="collapse5_2" class="panel-collapse collapse">
                <div class="panel-body"> While in communities:
                    Place your cursor in the top left corner for the main menu.
                    Select Settings.
                    Scroll to 'Profile'.
                    Check or uncheck the box next to Show your Google+ communities posts on your Google+ profile
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse5_3">3. Can I change my community from public to private, or
                    vice versa? </a></h3>
            </div>
            <div id="collapse5_3" class="panel-collapse collapse">
                <div class="panel-body">You can turn your community notifications on or off by clicking on the icon on a
                    community’s page.
                    Community members can use notifications to know when new things are shared with their communities.
                    If notifications are On you’ll get a notification by email, on your device, and by the Google
                    toolbar when someone posts something new. A communit's privacy settings currently can't be changed
                    once it's been created. Please pick your desired setting from the start.
                </div>
            </div>
        </div>
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse5_4">4. Why aren't people seeing my invites? </a></h3>
            </div>
            <div id="collapse5_4" class="panel-collapse collapse">
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
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse5_5">5. If I moderate a post out of my community, is it
                    deleted? </a></h3>
            </div>
            <div id="collapse5_5" class="panel-collapse collapse">
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
                                           href="#collapse5_6">6. Are community names unique? If someone else has a
                    "Software" community, does that prevent me from owning one? </a></h3>
            </div>
            <div id="collapse5_6" class="panel-collapse collapse">
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
                                           href="#collapse5_7">7. How can I control how many community invitations I
                    receive? </a></h3>
            </div>
            <div id="collapse5_7" class="panel-collapse collapse">
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
{*</div>*}
<!-- /CONTENT -->
{*</div>*}
<!-- /FAQ -->
</div>
</div>
</div>
</div>
