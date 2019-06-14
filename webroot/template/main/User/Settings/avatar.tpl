{include file="$TMP/Layout/header.tpl"}

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="{$HOST}user/{$username}/">{$_USER}</a></li>
                        <li class="breadcrumb-item active">{$_AVATAR_IMAGES}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->
    
{if $upavatar}<div class="alert alert-{$_UPAVATAR}">{$__UPAVATAR}</div>{/if}
{if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}


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

					<!-- Avatar-homepage images -->	
								
                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-image"></i> {$_AVATAR_IMAGES}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                        
								<form method="post" enctype="multipart/form-data">
								    
									<input type="hidden" name="csrf" value="{$csrfToken}" />
									

                                        <div class="form-group">
                                           <p><img src="{if empty($avatar)}{$AST}img/avatar.jpg{else}{$avatar}{/if}" width="80" height="80" class="img-border" alt=""></p>
											    
											<input type="file" name="photo" />   
								            <small><em>80x80 - JPEG, GIF, PNG</em></small>
										</div>
									
										
										<div class="form-submit">
										  <button type="submit" name="avatar" value="avatar" class="custom-btn"><i class="fa fa-floppy-o"></i> {$_SAVE}</button> 
									   </div>
								</form>
								</li>
                                   </ul>
                                   
                               </div>
                            </div>
							
                               </div>
                            </div>
                </div>
                </div>
                             {include file='../Tabs/settings.tpl'}

                </div>
              </div>  
    </main>

{include file="$TMP/Layout/footer.tpl"}