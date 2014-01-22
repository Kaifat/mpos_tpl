<div class="col-md-12">
    <!-- BOX -->
    <div class="box border blue">
        <div class="box-title">
            <h4><i class="fa fa-user"></i><span class="hidden-inline-mobile">{$profileData.username|escape}</span></h4>
        </div>
        <div class="box-body">
            <div class="user-profile">

                <div class="row">
                    <!-- PROFILE PIC -->
                    <div class="col-md-3">
                        <div class="list-group">
                            <div class="list-group-item zero-padding center">
                                {if $profileData.avatar}
                                    <img alt="" class="img-responsive" src="/uploads/avatar/{$profileData.avatar}">
                                {elseif $profileData.photo_url}
                                    <img alt="" class="img-responsive" src="{$profileData.photo_url}">
                                {else}
                                    <i class="fa fa-user" style="font-size:250px;"></i>
                                {/if}
                            </div>
                            <div class="list-group-item profile-details">
                                <h2>{$profileData.username|escape}</h2>
                                <p><i class="fa fa-circle text-green"></i> Online</p>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt laoreet dolore magna aliquam tincidunt erat volutpat laoreet dolore magna aliquam tincidunt erat volutpat.</p>
                                <p><a href="#">www.jenniferblogs.com</a></p>
                                <ul class="list-inline">
                                    <li><i class="fa fa-facebook fa-2x"></i></li>
                                    <li><i class="fa fa-twitter fa-2x"></i></li>
                                    <li><i class="fa fa-dribbble fa-2x"></i></li>
                                    <li><i class="fa fa-bitbucket fa-2x"></i></li>
                                </ul>
                            </div>
                            <a href="#" class="list-group-item"><i class="fa fa-user fa-fw"></i> Profile</a>
                            <a href="#" class="list-group-item">
                                <span class="badge badge-red">9</span>
                                <i class="fa fa-calendar fa-fw"></i> Events
                            </a>
                            <a href="#" class="list-group-item"><i class="fa fa-comment-o fa-fw"></i> Messages</a>
                            <a href="#" class="list-group-item"><i class="fa fa-picture-o fa-fw"></i> Photos</a>
                            <a href="#" class="list-group-item"><i class="fa fa-cog fa-fw"></i> Settings</a>
                        </div>
                    </div>
                    <!-- /PROFILE PIC -->
                    <!-- PROFILE DETAILS -->
                    <div class="col-md-9">
                        <!-- UPDATE CONTACTS -->
                        <div class="row">
                            <div class="col-md-9">
                                    <div class="box border blue">
                                        <div class="box-title"><h4>Contacts</h4></div>
                                        <div class="box-body">
                                            <table class="table">
                                                <tr>
                                                    <th>Skype</th>
                                                    <td>{$profileData.c_skype|escape}</td>
                                                </tr>
                                                <tr>
                                                    <th>VK</th>
                                                    <td>{if $profileData.c_vk|escape}http://vk.com/{$profileData.c_vk|escape}{/if}</td>
                                                </tr>
                                                <tr>
                                                    <th>ICQ</th>
                                                    <td>{if $profileData.c_icq}{$profileData.c_icq|escape}{/if}</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- /UPDATE CONTACTS -->
                    </div>
                    <!-- /PROFILE DETAILS -->
                </div>
            </div>
            <!-- /USER PROFILE -->
        </div>
    </div>
</div>
