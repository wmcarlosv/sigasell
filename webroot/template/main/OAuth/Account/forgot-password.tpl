{include file="$TMP/Layout/header.tpl"}

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a>
                        </li>
                        <li class="breadcrumb-item active">{$_FORGOT_PASSWORD}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->

    <!-- ALERTS START HERE -->
    {if $sent}<div class="alert alert-{$_SENT}">{$__SENT}</div>{/if}
    {if $recaptcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
    {if $not_found}<div class="alert alert-{$_USRNOT_FOUND}">{$__USRNOT_FOUND}</div>{/if}
    {if $recovered}<div class="alert alert-{$_RECOVERED}">{$__RECOVERED}</div>{/if}
    {if $inrecover}<div class="alert alert-{$_INRECOVER}">{$__INRECOVER}</div>{/if}
    {if $required}<div class="alert alert-danger">{$__REQUIRED}</div>{/if}
    <!-- ALERTS END HERE -->

    <!-- CHECKOUT AREA START HERE -->
    <main class="checkout-area main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                       <!-- CART AREA START HERE -->

                    <div class="billing-details">
                        
                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-refresh"></i> {$_FORGOT_PASSWORD}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>

                        <form action="{$HOST}forgot-password" method="POST" id="checkout-form">

                          <input type="hidden" name="csrf" value="{$csrfToken}">
                          
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="text" id="town" name="username" required="required" placeholder="{$_USERNAME}">
                                    </div>
                                </div>
                            </div>
{if {$captcha_forgot}== '1'}

                            <div class="form-group">
                                <label for="password">{$_PROVE_YOUR_HUMAN}<span class="required">*</span></label>
											<div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{$reCAPTCHA_site_key}"></div>
									</div>
{/if}
                            <div class="row">
                                <div class="col-sm-12">
                                  <button type="submit" name="rec" value="rec" class="custom-btn">{$_RECOVER}</button>
                                </div>
                            </div>
                        </form>

                                    </li>
                                </ul>
                            </div>
                            

                            
                        </div>

                    </div>
                    
                </div>
                
            </div>

        </div>
    </main>
    <!-- CHECKOUT AREA END HERE -->

{include file="$TMP/Layout/footer.tpl"}