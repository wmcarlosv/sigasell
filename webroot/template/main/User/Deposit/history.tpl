{include file="$TMP/Layout/header.tpl"}

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="{$USR}{$username}/">User</a></li>
                        <li class="breadcrumb-item active">{$_DEPOSIT_HISTORY}</li>
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

					  	 {if !$invoices}
                          <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-warning"></i>{$_NO_RECORDS_WERE_FOUND}</h3>
                          </div>
					  	 {else}

                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-history"></i> {$_DEPOSIT_HISTORY}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>

                        <div class="cart-wrap">
                            <div class="row cart-header">
                               <div class="col-sm-2">
                                   <strong class="p-title">{$_DATE}</strong>
                               </div>
                               <div class="col-sm-2">
                                   <strong class="p-title">{$_STATUS}</strong>
                               </div>
                               <div class="col-sm-1">
                                   <strong class="p-title">{$_AMOUNT}</strong>
                               </div>
                               <div class="col-sm-3">
                                   <strong class="p-title">{$_METHOD}</strong>
                               </div>
                            </div> <!-- Cart Header End -->
                            
							 {foreach from=$invoices item=foo}
                            <!-- Single Cart Start-->
                            <div class="row single-cart">
                                <div class="col-sm-2 no-padding">
                                    <div class="product-heading">
                                         <p>{$foo['created']}</p>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="product-heading">
										    {if $foo['status'] == 1}
											Completed
										    {elseif $foo['status'] == 2}
											Canceled
										    {/if}
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="product-heading">
                                    <strong><span>{$sumbole}</span>{$foo['amount']}</strong>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="product-heading">
                                         <p>{ucfirst($foo['method'])}</p>
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
                            
                                   </li>
                                 </ul>
                            
                         </div>

                        
                         {/if}        
                                </div>
                            </div>
                </div>
                </div>

                </div>
              </div>  
        </div>
	</main>						
{include file="$TMP/Layout/footer.tpl"}