<div class="login-box-inline">
<form action="{$smarty.server.PHP_SELF}" method="post">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="contactform">
    <div class="col-md-8">
        <div class="box border">
            <div class="box-title"><h4>Contact Us</h4></div>
            <div class="box-body">
                <div class="form-group">
                    <label for="senderName">Your Name</label>
                    <i class="fa fa-user"></i>
                    <input class="form-control" type="text" class="text tiny" name="senderName"
                           value="{$smarty.request.senderName|escape|default:""}" placeholder="Please type your name"
                           size="15" maxlength="100" required/>
                </div>
                <div class="form-group">
                    <label for="senderEmail">Your Email Address</label>
                    <i class="fa fa-envelope"></i>
                    <input class="form-control" type="text" class="text tiny" name="senderEmail"
                           value="{$smarty.request.senderEmail|escape|default:""}" placeholder="Please type your email"
                           size="50" maxlength="100" required/>
                </div>
                <div class="form-group">
                    <label for="senderEmail">Your Subject</label>
                    <i class="fa fa-file-text"></i>
                    <input class="form-control" type="text" class="text tiny" name="senderSubject"
                           value="{$smarty.request.senderSubject|escape|default:""}"
                           placeholder="Please type your subject" size="15" maxlength="100" required/>
                </div>
                <div class="form-group">
                    <label for="message">Your Message</label>
                    <textarea class="form-control" type="text" name="senderMessage" cols="80" rows="10" maxlength="10000"
                              required>{$smarty.request.senderMessage|escape|default:""}</textarea>
                </div>
                <center>{nocache}{$RECAPTCHA|default:""}{/nocache}</center>
            </div>
            <div class="toolbox bottom center">
                <div class="submit_link">
                    <input class="btn btn-info" type="submit" name="sendMessage" value="Send Email"/>
                </div>
            </div>
        </div>
    </div>
</form>
</div>
