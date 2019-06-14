{include file="$TMP/Layout/header.tpl"}

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{$USR}{$username}/">User</a></li>
                        <li class="breadcrumb-item active">Downloads</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->
   
{if $completed}<div class="alert alert-{$_COM_PURCHASE}">{$__COM_PURCHASE} You can leave a review for this item <a href="{$HOST}item/{$itm_complete}/{$itm_name}/">here</a></div>{/if}

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
					     {if !$download}
                          <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-warning"></i> No Records Were Found!</h3>
                          </div>
                         {else}
                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-download"></i> User Downloads</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>

                        <div class="cart-wrap">
                            <div class="row cart-header">
                               <div class="col-sm-2">
                                   <strong class="p-title">item</strong>
                               </div>
                               <div class="col-sm-4">
                                   <strong class="p-title">Name</strong>
                               </div>
                               <div class="col-sm-3">
                                   <strong class="p-title">price</strong>
                               </div>
                               <div class="col-sm-1">
                                   <strong class="p-title">Actions</strong>
                               </div>
                            </div> <!-- Cart Header End -->
                            
						 {foreach from=$download item=foo}
                            <!-- Single Cart Start-->
                            <div class="row single-cart">
                                <div class="col-sm-2 no-padding">
                                        <a href="{$HOST}item/{$foo['item_id']}/{$foo['link']}/"><img src="{$foo['icon_img']}" alt=""></a>
                                </div>
                                <div class="col-sm-5">
                                       <small><p>{$foo['name']}</p></small>
                                </div>
                                <div class="col-sm-1">
                                    <big><strong><span>{$sumbole}</span>{$foo['price']}</strong></big>
                                </div>
                                <div class="col-sm-3">
                                        <a href="{$HOST}download/{$foo['purchase_key']}/" class="custom-btn"><i class="fa fa-arrow-circle-down"></i> </a>
                           </div>

                            </div>
                            <!-- Single Cart End -->
				    	 {/foreach}
				    	 
                        </div>
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
                <div class="col-md-4 col-sm-12">
    <aside class="product-sidebar">
                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-download"></i> Download Immediately</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                    <p>You should download your purchases immediately as items may be removed from time to time.</p>
                                    </li>
                                </ul>
                            </div>
                            
                            <h3 class="prodect-info-heading"><i class="fa fa-bug"></i> Trouble with ZIP files?</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                        <p>If you are having trouble with "corrupt" or "missing files" in ZIP files, we suggest you try using <a href="http://winace.com" target="_blank">WinAce</a> to try and extract the files.</p>
								<p>People who have reported these problems have had success when using <a href="http://winace.com" target="_blank">WinAce</a>. Please try this before contacting support, posting comments, forum threads or negative ratings!</p>
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