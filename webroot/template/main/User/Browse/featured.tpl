{include file="$TMP/Layout/header.tpl"}

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME} </a>
                        </li>
                        <li class="breadcrumb-item active">{$site_title}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->


    <!-- PRODUCT AREA START HERE -->
    <main class="product-area main-content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="promo-item-wrap">


	{if !$wfeatured}<h4>{$_NO_RECORDS_WERE_FOUND}</h4>{/if}

                        <!-- TAB PANES CONTENT START -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="seller">
                                <div class="row">

	{foreach from=$wfeatured item=foo}

                                    <!-- Single Product Start -->
                                    <div class="col-md-4 col-sm-6">
                                        <div class="item-demo">
                                            <figure>
                                                <img src="{$foo['preview_img']}" alt="">
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
                            <!-- HOT TAB PANEL END -->
                        </div>
                        <!-- PAGER  START HERE -->
                        <div class="pager">
                            
					{if $wfeatured}{$paging}{/if}
						  
                        </div>
                        <!-- PAGER  END HERE -->
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- PRODUCT AREA END HERE -->
    
{include file="$TMP/Layout/footer.tpl"}