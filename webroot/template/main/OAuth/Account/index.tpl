{include file="$TMP/Layout/header.tpl"}


    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item active">{$site_title}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->

    <!-- ALERTS START HERE -->

    {if $mail_sent}<div class="alert alert-{$_SENT}">{$__SENT}</div>{/if}
    {if $rep_username}<div class="alert alert-{$_REPEAT}">{$__REPEAT}</div>{/if}
    {if $passwords}<div class="alert alert-{$_PASSWORDS}">{$__PASSWORDS}</div>{/if}
    {if $rep_email}<div class="alert alert-{$_EXIST}">{$__EXIST}</div>{/if}
    {if $express_login}<div class="alert alert-{$_EXPRESS}">{$__EXPRESS}</div>{/if}
    {if $activated}<div class="alert alert-{$_ACTIVATED}">{$__ACTIVATED}</div>{/if}
    {if $recaptcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
    {if $pending}<div class="alert alert-{$_PENDING}">{$__PENDING}</div>{/if}
    {if $banned}<div class="alert alert-{$_BANNED}">{$__BANNED}</div>{/if}
    {if $invalid}<div class="alert alert-{$_INVALID}">{$__INVALID}</div>{/if}
    {if $expired}<div class="alert alert-{$_EXPIRED}">{$__EXPIRED}</div>{/if}
    {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}

    
    <!-- ALERTS END HERE -->


    <!-- CONTACT AREA START HERE -->
    <main class="account-area main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-sm-5">
                    <div class="register-wrap">
                        <h3>{$_CREATE_AN_ACCOUNT}</h3>
                  
                    <form method="POST">
                            
                    <input type="hidden" id="authenticity_token" name="csrf" value="{$csrfToken}" />
                    
                            <div class="form-group">
                                <label for="name">{$_USERNAME}<span class="required">*</span></label>
                                <input type="text" name="username">
                            </div>

                            <div class="form-group">
                                <label for="name">{$_FIRST_NAME}<span class="required">*</span></label>
                                <input type="text" name="f_name">
                            </div>

                            <div class="form-group">
                                <label for="name">{$_LAST_NAME}<span class="required">*</span></label>
                                <input type="text" name="l_name">
                            </div>

                            <div class="form-group">
                                <label for="name">{$_EMAIL_ADDRESS}<span class="required">*</span></label>
                                <input type="email" name="email">
                            </div>

                            <div class="form-group">
                                <label for="name">{$_PASSWORD}<span class="required">*</span></label>
                                <input type="password" name="password">
                            </div>
                            <div class="form-group">
                                <label for="password">{$_CONFIRM_PASSWORD} <span class="required">*</span></label>
                                <input type="password" name="passwordcheck">
                            </div>
                            
                            
{if {$captcha_signup}== '1'}

                            <div class="form-group">
                                <label for="password">{$_PROVE_YOUR_HUMAN}<span class="required">*</span></label>
											<div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{$reCAPTCHA_site_key}"></div>
									</div>
{/if}

                            <div class="form-group form-inline">
                             <button class="custom-btn" name="register" value="register">{$_SIGN_UP}</button>
                             <label class="inline"><input type="checkbox"  name="signup_newsletter" value="1" checked="checked" style="height: 15px; width: 15px;"> {$_NEWSLETTER}</label>
                            </div>
                        
                        </form>
                    </div>
                </div>
                <div class="col-md-5 col-md-offset-2 col-sm-5 col-sm-offset-2">
                    <div class="loging-wrap">
                        <h3>{$_SIGN_IN}</h3>
                        
                        <form method="POST">
                            
                          <input type="hidden" name="csrf" value="{$csrfToken}" />

                            <div class="form-group">
                                <label for="name">{$_USERNAME}<span class="required">*</span></label>
                                <input type="text" name="username">
                            </div>
                            <div class="form-group">
                                <label for="password">{$_PASSWORD}<span class="required">*</span></label>
                                <input type="password" name="password">
                            </div>
                        
{if {$captcha_login}== '1'}

                            <div class="form-group">
                                <label for="password">{$_PROVE_YOUR_HUMAN}<span class="required">*</span></label>
											<div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{$reCAPTCHA_site_key}"></div>
									</div>
{/if}

                            <div class="form-group form-inline">
                                <button name="login" value="login" class="custom-btn red">{$_SIGN_IN}</button>
                                <label class="inline"><input type="checkbox"> {$_REMEMBER_ME}</label>
                            </div>
                            
                            <p class="lost-pass"><a href="{$HOST}forgot-password">{$_FORGOT_PASSWORD}</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- CONTACT AREA END HERE -->

{include file="$TMP/Layout/footer.tpl"}