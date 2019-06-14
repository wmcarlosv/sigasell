{include file='../Layout/header.tpl'}
    <title>Edit Item - Admin</title>

    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-pencil"></div> Edit Item</span>
                </h1>
                
 {include file='../Items/menu2.tpl'}
                
            {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
            {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                
            </div>

            <div class="col-sm-12">
                <div class="demo-form-wrapper">
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                   
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                             Name
                            </label>
                            <div class="col-sm-6">
                               
                                    <input id="form-control-4" name="name" class="form-control" type="text" required="true" value="{$r_name}" style="height: 45px;"/>
                                    <em><b>Maximum 80 characters</b></em>
                                </div>
                            </div>

                    <div class="form-group">
                      <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                               Description
                            </label>
                        <div class="col-sm-9">
                        <script src="{$AST}admin/ckeditor/ckeditor.js"></script>

                        <textarea name="description" id="editor1" rows="10" cols="90">{$r_description}</textarea>
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
                                    <textarea id="descNum" name="tags" class="form-control" type="text" style="height:50px">{$r_tags}</textarea>
                                    <em><b>Seperate tags by comma</b></em>
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                             Price
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="price" class="form-control" type="number" step=".01" required="true" value="{$r_price}" style="height: 45px;"/>
                                </div>
                            </div>
                           
                      {if $enable_browsers == '1'}
                        <div class="form-group">
            			  <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
            			    Compatible <br>Browsers
            		   	  </label>
                          <div class="col-sm-6">
			          	<select class="form-control" name="compatibleBrowsers[]" multiple="multiple" size="6"> 
					     <option value="Internet Explorer" {if in_array('Internet Explorer',$r_browsers)} selected="selected"{/if}>Internet Explorer</option>
					     <option value="Firefox" {if in_array('Firefox',$r_browsers)} selected="selected"{/if}>Firefox</option>
					     <option value="Chrome" {if in_array('Chrome',$r_browsers)} selected="selected"{/if}>Chrome</option>
					     <option value="Safari" {if in_array('Safari',$r_browsers)} selected="selected"{/if}>Safari</option>
					     <option value="Opera"  {if in_array('Opera',$r_browsers)} selected="selected"{/if}>Opera</option>						
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
                               
                                    <input id="form-control-4" name="demo" class="form-control" type="url" required="true" value="{$r_demo}" style="height: 45px;"/>
                                    <em><b>Link to a live preview (i.e. http://example.com/demo/).</b></em>
                                </div>
                            </div>  
                      {/if}
                      
                       <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Category
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="category" class="form-control" required="true" style="height: 45px;">
                                    {foreach from=$categories item=foo}
                                     <option value="{$foo['id']}" {if $r_category == $foo['id']} selected="selected"{/if}>{$foo['name']}</option>
                                    {/foreach}
                                    </select>
                                </div>
                            </div>
                            
                       <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Type
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="type" class="form-control" required="true" style="height: 45px;">
                                        <option value="paid" {if $r_type == 'paid'} selected="selected"{/if} >Paid</option>
                                        <option value="free" {if $r_type == 'free'} selected="selected"{/if} >Free</option>
                                    </select>
                                </div>
                            </div>
                            
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>
                                <br>
                                <button class="btn btn-info" name="up-item" type="submit" value="up-item"><i class="fa fa-check"></i> Update</button>
                                        
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
{include file='../Layout/footer.tpl'}