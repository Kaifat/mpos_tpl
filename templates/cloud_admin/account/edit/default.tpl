<div class="col-md-12">
    <!-- BOX -->
    <div class="box border blue">
        <div class="box-title">
            <h4><i class="fa fa-user"></i><span class="hidden-inline-mobile">Hello, {$GLOBAL.userdata.username|escape}!</span></h4>
        </div>
        <div class="box-body">
            <div class="tabbable header-tabs user-profile">
                <ul class="nav nav-tabs">
                    <li><a href="#reset_pin" data-toggle="tab"><i class="fa fa-dot-circle-o"></i> <span class="hidden-inline-mobile">Reset Pin</span></a></li>

                    <li><a href="#change_password" data-toggle="tab"><i class="fa fa-lock"></i> <span class="hidden-inline-mobile">Change password</span></a></li>

                    {if !$GLOBAL.config.disable_payouts && !$GLOBAL.config.disable_manual_payouts}
                    <li><a href="#cash_out" data-toggle="tab"><i class="fa fa-dollar"></i> <span class="hidden-inline-mobile">Cash out</span></a></li>
                    {/if}

                    <li><a href="#account_details" data-toggle="tab"><i class="fa fa-edit"></i> <span class="hidden-inline-mobile">Account Details</span></a></li>

                    <li class="active"><a href="#my_account" data-toggle="tab"><i class="fa fa-user"></i>                         <span class="hidden-inline-mobile">My Account</span></a></li>
                </ul>

                <div class="tab-content">
                    {include file="account/edit/tab_my_account.tpl"}
                    {include file="account/edit/tab_account_details.tpl"}
                    {include file="account/edit/tab_cash_out.tpl"}
                    {include file="account/edit/tab_change_password.tpl"}
                    {include file="account/edit/tab_reset_pin.tpl"}
                </div>
            </div>
            <!-- /USER PROFILE -->
        </div>
    </div>
</div>
