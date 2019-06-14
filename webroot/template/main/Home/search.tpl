{include file="$TMP/Layout/header.tpl"}
    <!-- HERO AREA START HERE -->
    <section class="hero-area overly-bg" data-stellar-background-ratio=".9" style="background-image: url({$background_image})">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="hero-wrap">
                        <h2 class="hero-title"> {$_RESULTS_FOR} <b><i>{$term}</i></b></h2>
                        <form method="GET" action="{$HOST}search" class="item-search">
                            <input type="text" name="term" placeholder="{$_SEARCH_YOUR_ITEMS}" value="{$term}">
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- HERO AREA END HERE -->



    <!-- FREATURE PRODUCT AREA START HERE -->
    <section class="feature-product-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-intro">
                	{if !$wsearch}

                        <h2 class="section-title">{$NO_RECORDS_WERE_FOUND}</h2>
                        
                    {else}

                        <h2 class="section-title">{$_RESULTS_FOR} {$term}</h2>
                        
                	{/if}

                    </div>
                </div>
            </div>
            <div class="row">
                
	{foreach from=$wsearch item=foo}

                <!-- Single Product Start -->
                <div class="col-md-4 col-sm-4">
                    <div class="item-demo">
                        <figure>
                            <img src="{$foo['preview_img']}" alt="{$foo['name']}">
                            <div class="product-caption">
                                <div class="caption-cel">
                                    <div class="product-link">
                                        <div>
                                            <div>
                                                <a href="{$HOST}item/{$foo['id']}/{$foo['title_link']}/">{$_VIEW_DETAIL}<span><i class="fa fa-eye"></i></span></a>
                                            </div>
                                         
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </figure>
                        <div class="product-info">
                            <div class="product-header">
                                <h3 class="product-name"><a href="{$HOST}item/{$foo['id']}/{$foo['title_link']}/">{$foo['name']}</a> <span>{$sumbole}{$foo['price']}</span></h3>
                                <span class="p-author">
                                    <a href="#">@{$foo['username']}</a>
                                </span>
                            </div>
                            <div class="product-meta">
                               <span class="meta-download">
                               <i class="fa fa-cloud-download"></i>{$foo['sales']}
                               </span>
                            <div class="ratings">
                               <div class="empty-stars"></div>
                               <div class="full-stars" style="width:{$foo['stars'] * 2}0%"></div>
                             </div>
                           </div>
                        </div>
                    </div>
                </div>
                <!-- Single Product End -->
                
	{/foreach}
	
            </div>
        </div>
                <!-- PAGER  START HERE -->
                 <div class="pager">
                 {$paging}
				 </div>
                 <!-- PAGER  END HERE -->
    </section>
    <!-- FREATURE PRODUCT AREA END HERE -->

{include file="$TMP/Layout/footer.tpl"}