{include file="$TMP/Layout/header.tpl"}

<style>
.rating {
    overflow: hidden;
    display: inline-block;
}

.rating-input {
    float: right;
    width: 17px;
    height: 17px;
    padding: 0;
    margin: 0 0 0 -17px;
    opacity: 0;
}


.rating:hover .rating-star:hover,
.rating:hover .rating-star:hover ~ .rating-star,
.rating-input:checked ~ .rating-star {
    background-position: 0 0;
}

.rating-star,
.rating:hover .rating-star {
    position: relative;
    float: right;
    display: block;
    width: 17px;
    height: 17px;
    background: url('https://www.everythingfrontend.com/samples/star-rating/star.png') 0 -17px;
}

</style>

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="{$HOST}category/{$category_link}">{$category}</a></li>
                        <li class="breadcrumb-item active">{$title}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->
    {if $radded}<div class="alert alert-{$_REVIEW_ADDED}">{$__REVIEW_ADDED}</div>{/if}
    {if $cadded}<div class="alert alert-{$_COMMENT_ADDED}">{$__COMMENT_ADDED}</div>{/if}
    {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
    {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}


    <!-- PRODUCT DETAILS AREA START HERE -->
    <main class="product-details">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-12">
                    <!-- SINGLE PRODUCT START -->
                    <div class="single-product">
                        <div class="s-product-thumb">
                            <img src="{$preview_img}" alt="{$title}">
                            <h3 class="product-title">{$title}</h3>
                        </div>
                        <div class="demo-social">
                        {if $enable_previewlink == '1'}<div class="p-demo-btn">
                                <a href="{$HOST}redirect/{$item_id}/" class="custom-btn" target="_blank"><i class="fa fa-desktop"></i> {$_PREVIEW}</a>
                            </div>{/if}
                            
                            <div class="p-demo-social">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-pinterest"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- S-product Tab Start -->
                        <div class="s-product-tab">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#i-details" aria-controls="i-details" role="tab" data-toggle="tab">{$_ITEM_DETAILS}</a>
                                </li>
                                
                               {if $enable_comments == '1'}<li role="presentation"><a href="#comments" aria-controls="comments" role="tab" data-toggle="tab">{$_COMMENTS} ({$comments_num})</a>
                                </li>{/if}
                                
                                {if $enable_reviews == '1'}<li role="presentation"><a href="#rating" aria-controls="rating" role="tab" data-toggle="tab">{$_REVIEWS} ({$reviews_num})</a>
                                </li>{/if}
                                
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="i-details">
                                    <div class="item-detail-tab">
					            	{$content}
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="comments">
                                    <!-- PRODUCTS COMMENT -->
                                    <div class="comment-area">
                                    {if !$wcm}<h3>{$_NO_COMMENTS}</h3>{/if}
                                    
                                        <ol class="comment-wrap">
                                            
                {foreach from=$wcm item=foo}

                                            <li>
                                                <div class="single-comment">
                                                    <div class="comment-thumb">
                                                        <img src="{$foo['avatar']}" alt="">
                                                    </div>
                                                    <div class="comment-txt">
                                                        <h4 class="name">{$foo['username']} <a href="#">{$foo['ago']}</a></h4>
                                                        <p>{$foo['comment']}</p>
                                                    </div>
                                                </div>
                                            </li>
                {/foreach}

                                        </ol>
                                    </div>
                                    <!-- PRODUCTS COMMENT -->

						
								{if $logged}

                                    <!-- ADD A COMMENT -->
                                    <div class="add-comment">
                                        <h3>{$_LEAVE_COMMENT}</h3>
                                        <div class="ac-wrap">
                                            <form method="POST">
									        <input type="hidden" name="csrf" value="{$csrfToken}" />
                                                <div class="row">
                                                    <div class="col-sm-12">
						                                 <textarea name="comment_txt" placeholder="{$_LEAVE_COMMENT}"></textarea>
                                                        <button class="custom-btn" name="comment" value="comment">{$_POST_COMMENT}</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    
								{else}
									
	                               <h4>{$__NO_COMMENTS}</h4>
								{/if}
	           
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="rating">
                                    
                                    <!-- PRODUCTS COMMENT -->
                                    <div class="comment-area">
                                    {if !$wrv}<h3>{$_NO_REVIEWS}</h3>{/if}
                                    
                                        <ol class="comment-wrap">
                                            
                {foreach from=$wrv item=foo}

                                            <li>
                                                <div class="single-comment">
                                                    <div class="comment-thumb">
                                                        <img src="{$foo['avatar']}" alt="">
                                                    </div>
                                                    <div class="comment-txt">
                                                        <h4 class="name">{$foo['username']} 
                                                        
                                                       <div class="ratings">
                                                         <div class="empty-stars"></div>
                                                         <div class="full-stars" style="width:{$foo['stars'] * 2}0%"></div>
                                                        </div>
                                                        <a href="#">{$foo['ago']}</a>
                                                        </h4>
                                                        
                                                        <p>{$foo['review']}</p>
                                                    </div>
                                                </div>
                                            </li>
                {/foreach}

                                        </ol>
                                    </div>
                                    <!-- PRODUCTS COMMENT -->
					
                               {if $buyer && $isreviewed == 2}
                                    <!-- ADD A REVIEW -->
                                    <div class="add-comment">
                                       <hr> <h3>{$_LEAVE_REVIEW}</h3>
                                        <div class="ac-wrap">
                                            <form method="POST">
									        <input type="hidden" name="csrf" value="{$csrfToken}" />
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        
                                                         <span class="rating">
                                                         <input type="radio" class="rating-input"
                                                                id="rating-input-1-5" name="rate_5" value="5">
                                                         <label for="rating-input-1-5" class="rating-star"></label>
                                                         <input type="radio" class="rating-input"
                                                                id="rating-input-1-4" name="rate_4" value="4">
                                                         <label for="rating-input-1-4" class="rating-star"></label>
                                                         <input type="radio" class="rating-input"
                                                                id="rating-input-1-3" name="rate_3" value="3">
                                                         <label for="rating-input-1-3" class="rating-star"></label>
                                                         <input type="radio" class="rating-input"
                                                                id="rating-input-1-2" name="rate_2" value="2">
                                                         <label for="rating-input-1-2" class="rating-star"></label>
                                                         <input type="radio" class="rating-input"
                                                                id="rating-input-1-1" name="rate_1" value="1">
                                                         <label for="rating-input-1-1" class="rating-star"></label>
                                                         </span>
                                                        
						                                 <textarea name="review_txt" placeholder="{$_LEAVE_REVIEW}"></textarea>
                                                        <button class="custom-btn" name="review" value="review">{$_POST_REVIEW}</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
					           {/if}

                                </div>
                            </div>
                        </div>
                        <!-- PRODUCT TAB END -->
                    </div>
                    <!-- SINGLE PRODUCT END -->
                </div>
                
                <div class="col-md-4 col-sm-12">
                    <aside class="product-sidebar">
                       
                  {if $item_type == 'free'}
                     {if $logged}
                        <div class="product-widget">
                            <div class="sells-number">
                                <h3><p><small>This item is for Free</small></p>
                                <a href="{$HOST}free/{$item_id}/" class="custom-btn"><i class="fa fa-download"></i> Download for free</a>
                          </h3>
                            </div>
                         </div>
                     {else}
                        <div class="product-widget">
                            <div class="sells-number">
                                <h3><p><small>This item is for Free</small></p>
                                <a href="{$HOST}oauth?r={$link_encode}" class="custom-btn"><i class="fa fa-user-plus"></i> Signup First</a>
                          </h3>
                            </div>
                         </div>
                     {/if}
                  {/if}
                        
                {if $buyer}
                 <div class="alert alert-warning">{$_ALREADY_PURCHASED}</div>
                {else}
            
                        <div class="product-widget">
                            <a href="#" class="currency">{$sumbole}{$price}</a>
                            <div class="price-info">
                                <div class="price-form">
										<small>
											<i class="fa fa-check"></i> Free support<br>
											<i class="fa fa-check"></i> Quality checked by {$name}<br>
											<i class="fa fa-check"></i> Future product updates<br>
											<i class="fa fa-check"></i> No transaction fees<br>
											<i class="fa fa-check"></i> Lowest price guarantee<br>
										</small>
										<hr>
                                    <form method="POST">
                                        
                                    <button type="submit" name="purchase" class="custom-btn">{$_BUY_NOW}</button>

                                   </form>
                                </div>
                            </div>
                        </div>
                  {/if}

                        <div class="product-widget">
                            <div class="sells-number">
                                <h3><i class="fa fa-cart-arrow-down" aria-hidden="true"></i> <span>{$sales}</span>Sales
                               
                        <div class="ratings">
                          <div class="empty-stars"></div>
                           <div class="full-stars" style="width:{$stars * 2}0%"></div>
                          </div>
                          </h3>
                            </div>
                        </div>

                        <div class="product-widget">
                            <div class="pay-method">
                                <img src="{$AST}img/p-method.png" alt="">
                            </div>
                        </div>

                        <div class="product-widget">
                            <h3 class="prodect-info-heading">{$_ITEM_INFORMATION}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                        <span class="info-name">{$_ITEM_RELEASED}</span>
                                        <label>:</label>
                                        <span class="info-value"> {$created}</span>
                                    </li>
                                    <li>
                                        <span class="info-name">{$_CATEGORY}</span>
                                        <label>:</label>
                                        <span class="info-value">{$category}</span>
                                    </li>
                                    
                               {if $enable_browsers == '1'}
                                    <li>
                                        <span class="info-name">{$_COMPATIBLE_BROWSERS}</span>
                                        <label>:</label>
                                        <span class="info-value">{$browsers}</span>
                                    </li>
                               {/if}
                                    <li>
                                        <span class="info-name">{$_TAGS}</span>
                                        <label>:</label></br>
                                        
                            <div class="tagclouds">{$tags}</div>

                                    </li>
                                </ul>
                            </div>
                        </div>
               
                
                    </aside>
                </div>
                
            </div>
        </div>
    </main>
    <!-- PRODUCT DETAILS AREA END HERE -->

    <!-- RELATED PRODUCT START -->
    <div class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="related-p-heading">
                        <h3>{$_RELATED_PRODUCTS}</h3>
                    </div>
                </div>
            </div>
            <div class="related-wrap owl-carousel">
                
                {foreach from=$related item=foo}

                <!-- Single Product Start -->
                
                <div class="item-demo">
                    <figure>
                        <img src="{$foo['preview_img']}" alt="">
                        <div class="product-caption">
                            <div class="caption-cel">
                                <div class="product-link">
                                    <div>
                                        <div>
                                            <a href="{$HOST}item/{$foo['id']}/{$foo['link']}/">View Details <span><i class="fa fa-eye"></i></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </figure>
                    <div class="product-info">
                        <div class="product-header">
                            <h3 class="product-name"><a href="{$HOST}item/{$foo['id']}/{$foo['link']}/">{$foo['name']}</a> <span>{$sumbole}{$foo['price']}</span></h3>
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
                
                <!-- Single Product End -->
		
	   		    {/foreach}

            </div>
        </div>
    </div>
    <!-- RELATED PRODUCT END -->
    
{include file="$TMP/Layout/footer.tpl"}