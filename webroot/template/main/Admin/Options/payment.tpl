{include file="../Layout/header.tpl"}
    
    <title>Payment Methods - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"> <div class="fa fa-money"></div> Payment Methods</span>
                </h1><hr>
                
             {if $updated}<div class='alert alert-success'>Payment Settings Updated Successfully!</div>{/if}
             {if $do_error}<div class='alert alert-danger'>Error: Somthing wrong! Please Try again.</div>{/if}

            </div>
            

         <form class="form form-horizontal" method="POST">
                        
             <div class="form-group">
                    <label for="paymentWay" class="col-sm-2 control-label" style="white-space: nowrap; text-align: left; float: left;">
                      Currency Code
                    </label>
                  <div class="col-sm-6">
                   <select id="form-control-6" name="currency" class="form-control" style="height: 45px; ">
                    <option value="USD"{if $currency == 'USD'} selected="selected"{/if}>USD</option>
                    <option value="EUR"{if $currency == 'EUR'} selected="selected"{/if}>EUR</option>
                    <option value="GBP"{if $currency == 'GBP'} selected="selected"{/if}>GBP</option>
                    <option value="CAD"{if $currency == 'CAD'} selected="selected"{/if}>CAD</option>
                    <option value="AUD"{if $currency == 'AUD'} selected="selected"{/if}>AUD</option>
                    <option value="INR"{if $currency == 'INR'} selected="selected"{/if}>INR</option>
                    <option value="IDR"{if $currency == 'IDR'} selected="selected"{/if}>IDR</option>
                   </select>
                  </div>
             </div>
             
             <div class="form-group">
                  <label for="paymentWay" class="col-sm-2 control-label" style="white-space: nowrap; text-align: left; float: left;">
                    Currency Symbole
                  </label>
                 <div class="col-sm-6">
                    <input  id="titleNum" name="sumbole" class="form-control" type="text" style="height: 45px;" value="{$sumbole}"/>
                 </div>
            </div>
                        
            <div class="form-group">
                 <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                   Minumum Deposit
                 </label>
                <div class="col-sm-6">
                    <input  id="titleNum" name="min_deposit" class="form-control" type="text" style="height: 45px;" value="{$min_deposit}"/>
                </div>
            </div>
            
            <div class="form-group">
                 <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                     Taxes
                 </label>
                <div class="col-sm-6">
                  <input  id="titleNum" name="taxes" class="form-control" type="text" style="height: 45px;" value="{$taxes}"/>
                </div>
            </div>

    <hr>
    <h3>PayPal Settings</h3><br>
    <span class="help"><i class="fa fa-question"></i> For instructions step by step click <a href="{$HOST}pages/paypal-setup" target="_blank">here</a>.</span>
    
                 <div class="form-group">
                      <label for="paymentWay" class="col-sm-2 control-label" style="white-space: nowrap; text-align: left; float: left;">
                       Enable PayPal
                       </label>
                    <div class="col-sm-6">
                      <select id="form-control-6" name="post_paypal" class="form-control" style="height: 45px; ">
                        <option value="1"{if {$PayPal_status} == 1} selected="selected" {else}{/if}>Yes</option>
                        <option value="2"{if {$PayPal_status} == 2} selected="selected" {else}{/if}>No</option>
                       </select>
                    </div>
                 </div>

                <div class="form-group">
                     <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                        Payment Business Email
                     </label>
                    <div class="col-sm-6">
                        <input id="urlNum" name="paypal_business" class="form-control" type="text" style="height: 45px;" value="{$paypal_account}"/>
                    </div>
               </div>
               
                 <div class="form-group">
                      <label for="paymentWay" class="col-sm-2 control-label" style="white-space: nowrap; text-align: left; float: left;">
                         Processor
                      </label>
                    <div class="col-sm-6">
                       <select id="form-control-6" name="checkout" class="form-control" style="height: 45px; ">
                         <option value="1" selected="selected">Express checkout</option>
                       </select>
                    </div>
                 </div>
                            
                 <hr>
                 <h3>Bitcoin Processor</h3>
                 <div class="col-sm-6">
                    <select id="form-control-6" name="bitcoin_processor" class="form-control" style="height: 45px; ">
                      <option selected="selected">Coinpayments</option>
                    </select>
                  </div><br><br>
                  
                  <h3>CoinPayments Settings</h3><br>
                  <span class="help"><i class="fa fa-question"></i> For instructions step by step click <a href="{$HOST}pages/coinpayments-setup" target="_blank">here</a>.</span>
                 <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Enable coinpayments
                            </label>
                            <div class="col-sm-6">
                                  <select id="form-control-6" name="post_bitcoin" class="form-control" style="height: 45px; ">
                                     <option value="1"{if $btc_status == 1} selected="selected"{/if}>Yes</option>
                                     <option value="2"{if $btc_status == 2} selected="selected"{/if}>No</option>
                                  </select>
                                </div>
                 </div>
                            
                  <div class="form-group">
                       <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                         Bitcoin Address
                       </label>
                        <div class="col-sm-6">
                           <input id="form-control-4" name="btcaddr" class="form-control" type="text" style="height: 45px;" value="{$btc_address}"/>
                                    <em><b>Note: Your Bitcoin Address Where You Get deposits</b></em>
                         </div>
                  </div>
                  
                      <div class="form-group">
                           <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               CoinPayments Public Key
                           </label>
                          <div class="col-sm-6">
                             <input id="form-control-4" name="publick_key" class="form-control" type="text" style="height: 45px;" value="{$publick_key}"/>
                          </div>
                      </div>
                            
                      <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               CoinPayments Private Key
                            </label>
                          <div class="col-sm-6">
                               <input id="form-control-4" name="secret_key" class="form-control" type="text" maxlength="100"style="height: 45px;" value="{$secret_key}"/>
                          </div>
                       </div>
                       
                      <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               CoinPayments Merchant Id
                            </label>
                           <div class="col-sm-6">
                                <input id="form-control-4" name="merchant_id" class="form-control" type="text" style="height: 45px;" value="{$merchant_id}"/>
                           </div>
                       </div>
                       
                      <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                              CoinPayments IPN Secret
                            </label>
                            <div class="col-sm-6">
                                 <input id="form-control-4" name="ipn" class="form-control" type="text" style="height: 45px;" value="{$ipn}"/>
                            </div>
                       </div>

<script>
$("form").submit(function () {

    var this_master = $(this);

    this_master.find('input[type="checkbox"]').each( function () {
        var checkbox_this = $(this);


        if( checkbox_this.is(":checked") == true ) {
            checkbox_this.attr('value','1');
        } else {
            checkbox_this.prop('checked',true);
            //DONT' ITS JUST CHECK THE CHECKBOX TO SUBMIT FORM DATA    
            checkbox_this.attr('value','2');
        }
    })
})
</script>

                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-payments" type="submit" value="Save" />
                                        
                            </div>
                        </div>


                    </form>
                 
</div>
 <hr>
{include file="../Layout/footer.tpl"}