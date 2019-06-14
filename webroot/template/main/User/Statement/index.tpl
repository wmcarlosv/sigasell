{include file="$TMP/Layout/header.tpl"}


    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{$USR}{$username}/">User</a></li>
                        <li class="breadcrumb-item active">Statement </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->

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
						  
			 {if !$statements}
               <div class="product-widget">
                 <h3 class="prodect-info-heading"><i class="fa fa-warning"></i> No Records Were Found!</h3>
              </div>
	       	 {else}
  
                          <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-book"></i> User Statments</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                        <div class="cart-wrap">
                            <div class="row cart-header">
                               <div class="col-sm-2">
                                   <strong class="p-title">Date</strong>
                               </div>
                               <div class="col-sm-2">
                                   <strong class="p-title">Type</strong>
                               </div>
                               <div class="col-sm-1">
                                   <strong class="p-title">Amount</strong>
                               </div>
                               <div class="col-sm-3">
                                   <strong class="p-title">Detail</strong>
                               </div>
                            </div> <!-- Cart Header End -->
                            
													 {foreach from=$statements item=foo}


                            <!-- Single Cart Start-->
                            <div class="row single-cart">
                                <div class="col-sm-2 no-padding">
                                         <p>{$foo['created']}</p>
                                </div>
                                <div class="col-sm-2">
                                  

										    {if $foo['type'] == 'purchase'}
										    
											Purchase
											
										    {elseif $foo['type'] == 'deposit'}
										    
											Deposit
											
										    {elseif $foo['type'] == 'refund'}
										    
											Refund
											
										    {/if}
										    
                                </div>
                                <div class="col-sm-2">
                                    <strong><span>{$sumbole}</span>{$foo['amount']}</strong>
                                </div>

                                <div class="col-sm-6">
                                   <small>
										    {if $foo['type'] == purchase}
										    
											Bought <a href="{$HOST}item/{$foo['item_id']}/{$foo['title_name']}/">{$foo['name']}</a>
											
										    {elseif $foo['type'] == deposit}
										    
											Deposit {$sumbole}{$foo['amount']}

										    {elseif $foo['type'] == refund}
										    
											Refund {$sumbole}{$foo['amount']}
											
										    {/if}
								</small>	    
                           </div>

                            </div>
                            <!-- Single Cart End -->
				    	 {/foreach}
				    	 
                        </div> <!-- Cart Wrap End -->

                        <!-- PAGER  START HERE -->
                        <div class="pager">
                           {$paging}
						</div>
                        <!-- PAGER  END HERE -->
                                    </li>
                                </ul>
                            </div>
                            

                            
                        </div>

                        
                         {/if}        
                                </div>
                            </div>
                </div>
                </div>

                </div>
              </div>  
    </main>			

{include file="$TMP/Layout/footer.tpl"}