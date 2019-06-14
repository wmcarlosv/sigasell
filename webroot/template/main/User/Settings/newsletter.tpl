{include file="$TMP/Layout/header.tpl"}


    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="{$HOST}user/{$username}/">{$_USER}</a></li>
                        <li class="breadcrumb-item active">{$_EMAIL_NOTIFICATIONS}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->
    
    
{if $notifications}<div class="alert alert-{$_NOTIFICATION}">{$__NOTIFICATION}</div>{/if}
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
										
						<!-- E-mail notifications -->

                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-envelope"></i> {$_EMAIL_NOTIFICATIONS}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                        
						<form method="POST">
								    
						 <input type="hidden" name="csrf" value="{$csrfToken}" />

                            <div class="form-group">
                              <label><input type="checkbox" name="newsletter" value="1" {if $newsletter == '1'}checked="checked"{/if} style="height: 20px; width: 20px;" /> {$_EMAIL_NEWSLETTERS}</label>
                            </div>
                            
                            <br><br>
                            <div class="form-group">
                               <button type="submit" name="notifications" value="notifications" class="custom-btn"><i class="fa fa-floppy-o"></i> {$_SAVE}</button>
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