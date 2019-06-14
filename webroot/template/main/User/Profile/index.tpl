{include file="$TMP/Layout/header.tpl"}


    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="{$HOST}user/{$username}/">{$_USER}</a></li>
                        <li class="breadcrumb-item active">{$_PROFILE}</li>
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
	

						<div class="preview profile space">
						 <img src="{if empty($homepage)}{$AST}img/homepage.jpg{else}{$homepage}{/if}" width="680" height="280" alt="{$username}" />
							</div>  </br>
							
                </div>
                </div>
                </div>
                
                </div>
                
                <div class="col-md-4 col-sm-12">
                 <aside class="product-sidebar">
                        <div class="product-widget">
                            <h3 class="prodect-info-heading">User information</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                    <p>Welcome Back {if $logged}{$username}{else}User{/if}!</p>
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