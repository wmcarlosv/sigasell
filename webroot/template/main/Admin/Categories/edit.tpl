{include file='../Layout/header.tpl'}

    <title> Edit Category - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-cog"></div> Edit Category #{$r_id}</span>
                </h1>
                <hr><br>
          
     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}

            </div>

            <div class="col-sm-12">
                <div class="demo-form-wrapper">
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
               
               
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                                Name
                            </label>
                            <div class="col-sm-6">
                               
                                    <input id="form-control-4" name="name" class="form-control" type="text" required="true" style="height: 45px;" value="{$r_name}"/>
                                </div>
                            </div>
                      
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label">
                                Description
                            </label>
                            <div class="col-sm-6">
                                    <textarea id="descNum" name="short_desc" class="form-control" type="text" style="height:100px">{$r_description}</textarea>
                                </div>
                            </div>
                      
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label" style="white-space: nowrap; text-align: left; float: left;"> 
                               Enable  :
                            </label>
                            <div class="col-sm-6">
                          <label class="container">Preview Link <em>(Demo)</em>
                            <input value="1" type="checkbox" {if $preview_link == '1'}checked="checked"{/if} name="preview_link">
                            <span class="checkmark"></span>
                          </label>
                           <label class="container">Compatible Browsers
                            <input value="1" type="checkbox" {if $compatible_browsers == '1'}checked="checked"{/if} name="compatible_browsers">
                            <span class="checkmark"></span>
                          </label>
                          <label class="container">Comments Section
                           <input value="1" type="checkbox" {if $comments_section == '1'}checked="checked"{/if} name="comments_section">
                           <span class="checkmark"></span>
                          </label>
                          <label class="container">Reviews Section
                           <input value="1" type="checkbox" {if $reviews_section == '1'}checked="checked"{/if} name="reviews_section">
                           <span class="checkmark"></span>
                          </label>
                                </div>
                            </div>
                      
                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Status
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="status" class="form-control" required="true" style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1" {if $r_status == '1'} selected="selected"{/if} >Active</option>
                                        <option value="2" {if $r_status == '2'} selected="selected"{/if} >Inactive</option>
                                    </select>
                                </div>
                            </div>

                        <div class= "form-group" style="display:inline-block;margin-right:1px;">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-cat" type="submit" value="Save" />

                            </div>
                        </div>

                    </form>
                    
                 <script>
                   $("form").submit(function () {
                   var this_master = $(this);
                   this_master.find('input[type="checkbox"]').each( function () {
                   var checkbox_this = $(this);

                  if( checkbox_this.is(":checked") == true ) {
                   checkbox_this.attr('value','1');
                  } else {
                   checkbox_this.prop('checked',true);
                   //DONT' ITS JUST CHECK THE CHECKBOX TO SUBMIT FORM DATA    
                   checkbox_this.attr('value','2');
                  }
                    })
                  })
                </script>

                </div>
            </div>
        </div>
    </div>
{include file='../Layout/footer.tpl'}