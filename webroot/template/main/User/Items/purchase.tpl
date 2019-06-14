{include file="$TMP/Layout/header.tpl"}

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a>
                        </li>
                        <li class="breadcrumb-item active">{$_PURCHASE}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->

    <!-- ALERTS START HERE -->
    {if $small}<div class="alert alert-{$_SMALL_BALANCE}">{$__SMALL_BALANCE}</div>{/if}
    <!-- ALERTS END HERE -->

    <!-- CHECKOUT AREA START HERE -->
    <main class="checkout-area main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                       <!-- CART AREA START HERE -->
        <div class="product-cart">
            <div class="container">
                <div class="row">                                                                               
                    <div class="col-md-7">
                        <div class="cart-wrap">
                            <div class="row cart-header">
                               <div class="col-sm-2">
                                   <strong class="p-title">item</strong>
                               </div>
                               <div class="col-sm-6">
                                   <strong class="p-title">price</strong>
                               </div>
                              <div class="col-sm-2">
                                   <strong class="p-title">rating</strong>
                               </div>
                            </div> <!-- Cart Header End -->
                            <!-- Single Cart Start-->
                            <div class="row single-cart">
                                <div class="col-sm-5">
                                        <strong><p>{$i_name}</p></strong>
                                </div>
                                <div class="col-sm-3">
                                   <p>{$sumbole}{$i_price}</p>
                                </div>
                                <div class="col-sm-2">
                        <div class="ratings">
                          <div class="empty-stars"></div>
                           <div class="full-stars" style="width:{$i_stars * 2}0%"></div>
                          </div>
                                </div>
                             </div>
                             
                            </div> <!-- Single Cart End -->
                            
                            </div> <!-- Cart Wrap End -->
                    </div>
                        </div> <!-- Cart Wrap End -->
                    </div>

                    {if !$logged}

                    <div class="billing-details">
                        
                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-user"></i> {$_PURCHASE_NON_LOGGED}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>

                        <form action="{$HOST}oauth" method="POST" id="checkout-form">

                          <input type="hidden" name="csrf" value="{$csrfToken}">
                          
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="text" id="town" name="f_name" placeholder="{$_FIRST_NAME}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="text" id="town" name="l_name" placeholder="{$_LAST_NAME}">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="text" id="town" name="username" placeholder="{$_USERNAME}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="email" name="email" placeholder="{$_EMAIL_ADDRESS}">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="password" id="town" name="password" placeholder="{$_PASSWORD}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="password" name="passwordcheck" placeholder="{$_CONFIRM_PASSWORD}">
                                    </div>
                                </div>
                            </div>
                            
{if {$captcha_signup}== '1'}

                            <div class="form-group">
                                <label for="password">{$_PROVE_YOUR_HUMAN}<span class="required">*</span></label>
											<div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{$reCAPTCHA_site_key}"></div>
									</div>
{/if}
                            <div class="row">
                                <div class="col-sm-12">
                                    <button type="submit" name="register" value="register" class="custom-btn">{$_CONTINUE}</button>
                                </div>
                            </div>
                        </form>

                                    </li>
                                </ul>
                            </div>
                            

                            
                        </div>

                    </div>
                    
                    {/if}

                </div>
                
                <div class="col-md-5 col-md-offset-1 col-sm-12">
                    <div class="payment-method">
                        <h3 class="check-title">{$_YOUR_ORDER}</h3>
                        <div class="cart-total pay-cart">
                            <h3>{$_CART_TOTAL}</h3>
                            <ul class="cart-list">
                                <li>{$_SUBTOTAL} <span> {$sumbole}{$i_price}</span></li>
                                <li>{$_TAXES_COST} <span>{$sumbole}{$taxes}</span></li>
                            </ul>
                            <strong>{$_TOTAL} <span>{$sumbole}{$i_price + $taxes}</span></strong>
                        </div>

                        {if $logged}
                        
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                  {$_PAYPAL}
                                </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        
                          <form action="{$HOST}purchase" method="POST">

                          <input type="hidden" name="csrf" value="{$csrfToken}">

                          <input type="hidden" name="payment_type" value="paypal">

                          <div class="place-order">
                             <button type="submit" name="purchase" value="purchase" class="custom-btn">{$_PAY_BY_PAYPAL}</button>
                          </div>
                          
                        </form>
                                   </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  {$_BALANCE}
                                </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                     
                          <form action="{$HOST}purchase" method="POST">

                          <input type="hidden" name="csrf" value="{$csrfToken}">

                          <input type="hidden" name="payment_type" value="cart">

                           <div class="place-order">
                              <button type="submit" name="purchase" value="purchase" class="custom-btn">{$_PAY_BY_BALANCE}</button>
                           </div>
                           
                        </form>

</div>
                                </div>
                            </div>

                        </div>
                        
                        {/if}

                    </div>
                </div>
            </div>

        </div>
    </main>
    <!-- CHECKOUT AREA END HERE -->

{include file="$TMP/Layout/footer.tpl"}