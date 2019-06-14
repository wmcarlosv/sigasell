{include file="$TMP/Layout/header.tpl"}

    <!-- HERO AREA START HERE -->
    <section class="hero-area overly-bg" data-stellar-background-ratio=".9" style="background-image: url({$background_image})">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="hero-wrap">
                      <h2 class="hero-title">{$num_items}{$_ITEMS_FOR_SALE}</h2>
                        <p class="hero-intro">{$short_desc}</p>
                        <form method="GET" action="{$HOST}search" class="item-search">
                            <input type="text" name="term" placeholder="{$_SEARCH_YOUR_ITEMS}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- HERO AREA END HERE -->
    
   {if $enable_home_featured == '1'}

    <!-- FREATURE PRODUCT AREA START HERE -->
    <section class="feature-product-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-intro">
                        <h2 class="section-title">{$_FEATURED_ITEMS}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                
	{foreach from=$wfeatured item=foo}

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
                                                <a href="{$HOST}item/{$foo['id']}/{$foo['title_link']}/">{$_VIEW_DETAIL} <span><i class="fa fa-eye"></i></span></a>
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
    </section>
    <!-- FREATURE PRODUCT AREA END HERE -->
    
   {/if}
   
   {if $enable_home_popular == '1'}

    <!-- POPULAR PRODUCT AREA START HERE -->
    <section class="feature-product-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-intro">
                        <h2 class="section-title">{$_POPULAR_ITEMS}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                
	{foreach from=$wpopular item=foo}

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
                                                <a href="{$HOST}item/{$foo['id']}/{$foo['title_link']}/">{$_VIEW_DETAIL} <span><i class="fa fa-eye"></i></span></a>
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
    </section>
    <!-- POPULAR PRODUCT AREA END HERE -->

   {/if}

    <!-- NEW PRODUCT AREA START HERE -->
    <section class="new-product-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-intro">
                        <h2 class="section-title">{$_NEW_ITEMS}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="n-prodruct-wrap">
                    <!-- Product Container Start -->
                    <div class="product-container">
                        
	{foreach from=$wnew item=foo}
										  
                        <div class="single-new">
                            <figure>
                                <img src="{$foo['preview_img']}" alt="{$foo['name']}">
                                <div class="product-caption">
                                    <div class="caption-cel">
                                        <div class="product-link">
                                            <div>
                                                <div>
                                                    <a href="{$HOST}item/{$foo['id']}/{$foo['title_link']}/">{$_VIEW_DETAIL} <span><i class="fa fa-eye"></i></span></a>
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

	{/foreach}         

                    </div></br>
                    <!-- Product Container End -->
                    <div class="product-button">
                        <a href="{$HOST}category/all" class="custom-btn">{$_VIEW_ALL_ITEMS}</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- FEATEAR AREA END HERE -->

   {if $enable_home_why == '1'}

    <!-- CHOOSING AREA START HERE -->
    <section class="choose-us-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-intro">
                     <h2 class="section-title">{$_WHY_YOU_SHOULD_CHOOSE_US}</h2>
                        <p>{$__WHY_YOU_SHOULD_CHOOSE_US}</p>
                    </div>
                    <div class="choose-wrap owl-carousel owl-theme">
                        <div class="choose-entry color-1">
                            <span class="choose-icon">
                                <i class="fa fa-users"></i>
                            </span>
                            <div class="choose-info">
                                <h4>{$_GREAT_SUPPORT}</h4>
                                <p>{$__GREAT_SUPPORT}</p>
                            </div>
                        </div>
                        <!-- Choose Entry End -->
                        <div class="choose-entry color-2">
                            <span class="choose-icon">
                                <i class="fa fa-heart"></i>
                            </span>
                            <div class="choose-info">
                                <h4>{$_BEAUTIFUL_THEMES}</h4>
                                <p>{$__BEAUTIFUL_THEMES}</p>
                            </div>
                        </div>
                        <!-- Choose Entry End -->
                        <div class="choose-entry color-3">
                            <span class="choose-icon">
                                <i class="fa fa-globe"></i>
                            </span>
                            <div class="choose-info">
                                <h4>{$_EXELLENT_QUALITY}</h4>
                                <p>{$__EXELLENT_QUALITY}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- CHOOSING AREA END HERE -->

   {/if}

   {if $enable_home_testimonial == '1'}

	 {if $testimonial}
    <!-- CLIENT AREA START HERE -->
    <section class="client-area overly-bg" data-stellar-background-ratio="0.6" style="background-image: url(images/client/client-bg.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="client-wrap owl-carousel">
                        
	{foreach from=$testimonial item=foo}

                        <!-- Singel Quote Start -->
                        <div class="single-quote">
                            <div class="quote-thumb">
                                <img src="{$foo['avatar']}" alt="">
                            </div>
                            <p>{$foo['content']}</p>
                            <div class="client-name">
                                <h5>{$foo['name']}</h5>
                                <span>{$foo['job']}</span>
                            </div>
                        </div>
                        <!-- Singel Quote End -->

	{/foreach}

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- CLIENT AREA END HERE -->
	 {/if}
	 
   {/if}

    <!-- PROMO AREA START HERE -->
    <section class="promo-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <span class="promo-icon"><i class="fa fa-laptop"></i></span>
                        <h3 class="promo-heading">{$_HIGH_QUALITY_PRODUCTS}</h3>
                        <p>{$__HIGH_QUALITY_PRODUCTS}</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <span class="promo-icon"><i class="fa fa-clock-o"></i></span>
                        <h3 class="promo-heading">{$_CUSTOMER_SERVICES}</h3>
                        <p>{$__CUSTOMER_SERVICES}</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <span class="promo-icon"><i class="fa fa-thumbs-o-up"></i></span>
                        <h3 class="promo-heading">{$_SATISFACTION}</h3>
                        <p>{$__SATISFACTION}</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <span class="promo-icon"><i class="fa fa-money"></i></span>
                        <h3 class="promo-heading">{$_MONEY_BACK_GUARANTEE}</h3>
                        <p>{$__MONEY_BACK_GUARANTEE}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- PROMO AREA END HERE -->

{include file="$TMP/Layout/footer.tpl"}