<!-- 1 tab - MY ACCOUNT -->
<div class="tab-pane fade in active" id="my_account">
    <div class="row">
        <!-- PROFILE PIC -->
        <div class="col-md-3">
            <div class="list-group">
                <div class="list-group-item zero-padding center">
                    {if $GLOBAL.userdata.avatar}
                        <img alt="" class="img-responsive" src="/uploads/avatar/{$GLOBAL.userdata.avatar}">
                    {elseif $GLOBAL.userdata.photo_url}
                        <img alt="" class="img-responsive" src="{$GLOBAL.userdata.photo_url}">
                    {else}
                    <i class="fa fa-user" style="font-size:250px;"></i>
                    {/if}
                </div>
                <div class="list-group-item profile-details">
                    <h2>{$GLOBAL.userdata.username|escape}</h2>
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
            <!-- UPDATE AVATAR -->
            <div class="row">
                <div class="col-md-12">
                    <form action="{$smarty.server.PHP_SELF}" method="post"  enctype="multipart/form-data">

                        <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                        <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                        <input type="hidden" name="do" value="updateAvatar">

                        <div class="box-container box">
                            <div class="box-title"><h4>Update Avatar</h4></div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <input id="uploadImage" type="file" accept="image/jpeg,image/png,image/gif" name="image" />
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <!-- image preview area-->
                                        <img id="uploadPreview" style="display: none;" />
                                    </div>
                                </div>
                            </div>
                            {*<div class="toolbox bottom">*}
                                <div class="submit_link">
                                    <!-- hidden inputs -->
                                    <input type="hidden" id="x" name="x" />
                                    <input type="hidden" id="y" name="y" />
                                    <input type="hidden" id="w" name="w" />
                                    <input type="hidden" id="h" name="h" />
                                    <input type="hidden" id="scalePer" name="scalePer" />
                                    <input class="btn btn-info" type="submit" value="Upload" class="alt_btn">
                                </div>
                            {*</div>*}
                        </div>

                    </form>
                </div>
            </div>
            <!-- /UPDATE AVATAR -->

            <!-- UPDATE CONTACTS -->
            <div class="row">
                <div class="col-md-9">
                    <form action="{$smarty.server.PHP_SELF}" method="post">
                        <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                        <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                        <input type="hidden" name="do" value="updateContacts">

                        <div class="box border blue">
                            <div class="box-title"><h4>Contacts</h4></div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label>Skype</label>
                                    <input name="c_skype" class="form-control" type="text" value="{$GLOBAL.userdata.c_skype|escape}">
                                </div>
                                <div class="form-group">
                                    <label>VK</label>
                                    http://vk.com/<input name="c_vk" class="form-control" type="text" value="{$GLOBAL.userdata.c_vk|escape}">
                                </div>
                                <div class="form-group">
                                    <label>ICQ</label>
                                    <input name="c_icq" class="form-control" type="text" value="{if $GLOBAL.userdata.c_icq}{$GLOBAL.userdata.c_icq|escape}{/if}" maxlength="9">
                                </div>
                                <div class="form-group">
                                    <label>4 digit PIN</label>
                                    <input class="form-control" type="password" name="authPin" size="4" maxlength="4"/>
                                </div>
                            </div>
                            <div class="toolbox bottom">
                                <div class="submit_link">
                                    <input class="btn btn-info" type="submit" value="Update Contacts" class="alt_btn">
                                </div>
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
<!-- /MY ACCOUNT -->

<script type="text/javascript">
    // set info for cropping image using hidden fields
    function setInfo(i, e) {
        $('#x').val(e.x1);
        $('#y').val(e.y1);

        $('#w').val(e.width);
        $('#h').val(e.height);

    }

    $(document).ready(function() {

        var previewImg = $("img#uploadPreview"),
            // implement imgAreaSelect plug in (http://odyniec.net/projects/imgareaselect/)
            ias = previewImg.imgAreaSelect({
                // set crop ratio (optional)
                aspectRatio: '1:1',
                minWidth: 300,
                minHeight: 300,
                instance: true,
                keys: { arrows: 15, ctrl: 5, shift: 'resize' },
                onSelectEnd: setInfo
            });

        // prepare instant preview
        $("#uploadImage").change(function(){
            // fadeOut or hide preview
            previewImg.fadeOut();

            // prepare HTML5 FileReader
            var oFReader = new FileReader();
            oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

            oFReader.onload = function (oFREvent) {
                var src = oFREvent.target.result;
                previewImg.attr('src', src).fadeIn();

                setTimeout(function() {
                    var w = previewImg.width(),
                        h = previewImg.height(),
                        minL = Math.min(w, h),
                        diffL = w - h,
                        diffR = Math.abs(diffL)/ 2,
                        x1, x2, y1, y2;

                    // Create new offscreen image to test
                    var theImage = new Image();
                    theImage.src = src;
                    // Get accurate measurements from that.
                    var imageWidth = theImage.width,
                            scalePercent = imageWidth/w;
                    $('#scalePer').val(scalePercent);

                    if (diffL > 0) {
                        x1 = minL * 0.05 + diffR;
                        y1 = minL * 0.05;
                        x2 = minL * 0.95 + diffR;
                        y2 = minL * 0.95;
                    } else {
                        x1 = minL * 0.05;
                        y1 = minL * 0.05 + diffR;
                        x2 = minL * 0.95;
                        y2 = minL * 0.95 + diffR;
                    }
                    ias.setSelection(x1, y1, x2, y2, true);
                    ias.setOptions({ show: true });
                    ias.update();

                    setInfo(
                        null,
                        {literal}{
                            'x1': x1,
                            'y1': y1,
                            'width': x2 - x1,
                            'height': y2 - y1
                        }{/literal}
                    );
                }, 200);
            };
        });
    });
</script>
