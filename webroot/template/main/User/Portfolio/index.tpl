{include file="$TMP/Layout/header.tpl"}

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="{$HOST}user/{$username_profile}/">{$_USER}</a></li>
                        <li class="breadcrumb-item active">{$_PORTFOLIO}</li>
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
	{if !$portfolio}

    <div class="product-widget">
       <h3 class="prodect-info-heading"><i class="fa fa-warning"></i> No Records Were Found!</h3>
    </div>
 
	{else}

                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-shopping-cart"></i> {$_AUTHOR_PORTFOLIO}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                        
                        <div class="cart-wrap">
                            <div class="row cart-header">
                               <div class="col-sm-2">
                                   <strong class="p-title">Item</strong>
                               </div>
                               <div class="col-sm-3">
                                   <strong class="p-title">Name</strong>
                               </div>
                               <div class="col-sm-3">
                                   <strong class="p-title">Sales</strong>
                               </div>
                               <div class="col-sm-1">
                                   <strong class="p-title">Price</strong>
                               </div>
                            </div> <!-- Cart Header End -->
                            
								 {foreach from=$portfolio item=foo}
		
                            <!-- Single Cart Start-->
                            <div class="row single-cart">
                                <div class="col-sm-2">
										   <a href="{$HOST}item/{$foo['id']}/{$foo['title_link']}/"><img src="{$foo['icon_img']}" alt=""></a>
                                </div>
                                <div class="col-sm-4 no-padding">
                                        <small> <a href="{$HOST}item/{$foo['id']}/{$foo['title_link']}/">{$foo['name']}</a></small>
                                </div>
                                <div class="col-sm-2">
										    {$foo['sales']}
                                </div>
                                <div class="col-sm-2">
                                    <big><strong><span>{$sumbole}</span>{$foo['price']}</strong></big>
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
                <div class="col-md-4 col-sm-12">
    <aside class="product-sidebar">
                        <div class="product-widget">
                            <h3 class="prodect-info-heading">{$_SEARCH_PORTFOLIO}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                        
                            <form action="{$HOST}search" method="GET" class="search-box">
                                <input type="text" name="term" placeholder="{$_SEARCH_PORTFOLIO}">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>

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