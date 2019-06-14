{include file="$TMP/Layout/header.tpl"}

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="{$USR}{$username}/">User</a></li>
                        <li class="breadcrumb-item active">{$_MAKE_A_DEPOSIT}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->
    

 {if $small}<div class="alert alert-danger">Error: Oops.. Amount too small.</div>{/if}
 {if $error}<div class="alert alert-danger">Error: {$coinpayment_msg}</div>{/if}
 {if $success}<div class="alert alert-{$_DEP_SUCCESS}">{$__DEP_SUCCESS}</div>{/if}
 {if $failed}<div class="alert alert-{$_DEP_FAILED}">{$__DEP_FAILED}</div>{/if}

    <!-- PRODUCT DETAILS AREA START HERE -->
    <main class="product-details">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-12">
                    
                    
                {include file='../Tabs/index.tpl'}

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active">
                                    <div class="item-detail-tab">
                           
                                   <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-usd"></i> {$_HOW_MUCH_DO_YOU_WANT_TO_DEPOSIT}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                	<div>{$__HOW_MUCH_DO_YOU_WANT_TO_DEPOSIT}</div>
                                    </li>
                                </ul>
                            </div>
                            
                            <div class="prodect-information">
                                <ul>
                                    <li>
							<div class="center">
							    
						   <form action="{$HOST}user/deposit" method="POST">
						    
						   <input type="hidden" name="csrf" value="{$csrfToken}">
						 
                        {if $PayPal_status == 1}
						  <div class="col-md-3 col-sm-2">
                           <div class="service-entry color-2">
                             <div class="service-icon pcolor">
                             <img src="https://codsem.com/proads/template/Main/Assest/images/private/pay/PayPal.jpg">
                             </div>
                              <input type="radio" name="paymentWay" value="paypal" checked="checked" style="height: 16px;">
                          </div>
                                  
                          
                          
                          </div>
                        {/if}
                        {if $btc_status == 1}
						  <div class="col-md-3 col-sm-2">
                           <div class="service-entry color-2">
                             <div class="service-icon pcolor">
                             <img src="https://codsem.com/proads/template/Main/Assest/images/private/pay/BTC.jpg">
                             </div>
                              <input type="radio" name="paymentWay" value="bitcoin" style="height: 16px;">
                          </div>

                          </div>
                        {/if}

						    <hr></br>
						     <select name="amount" class="form-control" style="margin-top: 200px;">
                               	
                               	 {foreach from=$credits item=foo}
                               
                                  <option value="{$foo['amount']}">{$foo['amount']}{$sumbole}</option>
                                  
                               	 {/foreach}
                                  
                                </select>
                    		    </br>
                                <button type="submit" name="deposit" class="custom-btn"><i class="fa fa-usd"></i> Deposit</button>
				            </form>
	            		    </br>
							</div>


                                    </li>
                                </ul>
                            </div>
                            

                            
                        </div>

							
                 </div>
                 </div>
                 </div>
                 
                 </div>
                 
                <div class="col-md-4 col-sm-12">
    <aside class="product-sidebar">
                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-bank"></i> {$_CURRENT_BALANCE}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                    <big id="current-balance"><span>{$sumbole}</span>{$balance}</big>
                                	<div>{$__CURRENT_BALANCE}</div>
                                    </li>
                                </ul>
                            </div>
                            
                            <h3 class="prodect-info-heading"><i class="fa fa-question"></i> {$_WHAT_IS_THIS}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                        <p>{$__WHAT_IS_THIS}</p>
                                    </li>
                                </ul>
                            </div>
                            
                        </div>
                 </aside>
              </div>  
              
				</div>  
				</div>  
    </main>	
{include file="$TMP/Layout/footer.tpl"}