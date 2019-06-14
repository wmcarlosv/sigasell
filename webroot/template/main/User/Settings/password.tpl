{include file="$TMP/Layout/header.tpl"}


    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="{$HOST}user/{$username}/">{$_USER}</a></li>
                        <li class="breadcrumb-item active">{$_CHANGE_YOUR_PASSWORD}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->
    

{if $pass}<div class="alert alert-{$_PASS_CHANGED}">{$__PASS_CHANGED}</div>{/if}
{if $confirm}<div class="alert alert-{$_PASS_NOTMATCH}">{$__PASS_NOTMATCH}</div>{/if}
{if $unchange}<div class="alert alert-{$_PASS_UNCHANGE}">{$__PASS_UNCHANGE}</div>{/if}
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
                                        
								<!-- Change your password -->
								
                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-lock"></i> {$_CHANGE_YOUR_PASSWORD}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                                        
								<form method="post">
								    
									<input type="hidden" name="csrf" value="{$csrfToken}" />
									
                                          <div class="form-group">
											<label for="password">{$_CURRENT_PASSWORD}</label>
												<input type="password" name="prepass" /> 
											</div>
                                          <div class="form-group">
											<label for="new_password">{$_NEW_PASSWORD}</label>
												<input type="password" name="newpassword" /> 
											</div>
                                          <div class="form-group">
											<label for="new_password2">{$_RETYPE_NEW_PASSWORD}</label>
												<input type="password" name="confnewpassword" /> 
											</div>
										<div class="form-submit">
											<button type="submit" name="pass" value="pass" class="custom-btn"><i class="fa fa-floppy-o"></i> {$_SAVE}</button> 
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