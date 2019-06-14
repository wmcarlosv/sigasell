{include file='../Layout/header.tpl'}
    <title>Add New Item - Admin</title>

    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-plus-circle"></div> Item Details</span>
                </h1>
                
 {include file='../Items/menu.tpl'}
                
            {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
            {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                
            </div>

            <div class="col-sm-12">
                <div class="demo-form-wrapper">
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                   
                                  <input type="hidden" name="csrf" value="{$csrfToken}"/>

                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                             Name
                            </label>
                            <div class="col-sm-6">
                               
                                    <input id="form-control-4" name="name" class="form-control" type="text" required="true" style="height: 45px;"/>
                                    <em><b>Maximum 80 characters</b></em>
                                </div>
                            </div>

                    <div class="form-group">
                      <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                               Description
                            </label>
                        <div class="col-sm-9">
                        <script src="{$AST}admin/ckeditor/ckeditor.js"></script>

                        <textarea name="content" id="editor1" rows="10" cols="90"></textarea>
                        <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace( 'editor1' );
                        </script>

                       </div>
                         </div>

                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                               Tags
                            </label>
                            <div class="col-sm-6">
                                    <textarea id="descNum" name="tags" class="form-control" type="text" style="height:50px"></textarea>
                                    <em><b>Seperate tags by comma</b></em>
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                             Price
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="price" class="form-control" type="number" step=".01" required="true" style="height: 45px;"/>
                                </div>
                            </div>
                            
                      {if $enable_browsers == '1'}
                        <div class="form-group">
            			  <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
            			    Compatible <br>Browsers
            		   	  </label>
                          <div class="col-sm-6">
			          	<select class="form-control" name="compatibleBrowsers[]" multiple="multiple" size="6">    
					     <option value="Internet Explorer">Internet Explorer</option>
					     <option value="Firefox">Firefox</option>
					     <option value="Chrome">Chrome</option>
					     <option value="Safari">Safari</option>
					     <option value="Opera">Opera</option>						
			   	       </select>  
			           </div>
		              </div>
		              {/if}
                      {if $enable_previewlink == '1'}
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                             Demo URL
                            </label>
                            <div class="col-sm-6">
                               
                                    <input id="form-control-4" name="demo" class="form-control" type="url" required="true" style="height: 45px;"/>
                                    <em><b>Link to a live preview (i.e. http://example.com/demo/).</b></em>
                                </div>
                            </div>  
                      {/if}
                      
                       <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Type
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="type" class="form-control" required="true" style="height: 45px;">
                                        <option value="paid" selected="selected">Paid</option>
                                        <option value="free">Free</option>
                                    </select>
                                </div>
                            </div>
                            
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>
                                <br>
                                <button class="btn btn-info" name="next" type="submit" value="NEXT"><i class="fa fa-angle-double-right"></i> NEXT</button>
                                        
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
{include file='../Layout/footer.tpl'}