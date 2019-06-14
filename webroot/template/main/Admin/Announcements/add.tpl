{include file='../Layout/header.tpl'}
    <title>Add Announcement - Admin</title>

    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-plus-circle"></div> Add Announcement</span>
                </h1>
                
 {include file='../Announcements/menu.tpl'}
                
            {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
            {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                
            </div>

            <div class="col-sm-12">
                <div class="demo-form-wrapper">
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST" enctype="multipart/form-data">
                   
                                  <input type="hidden" name="csrf" value="{$csrfToken}"/>

                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                                 Title
                            </label>
                            <div class="col-sm-6">
                               
                                    <input id="form-control-4" name="title" class="form-control" type="text" required="true" style="height: 45px;"/>
                                </div>
                            </div>

                        <div class="form-group">
                      <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Content
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


                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="add-announcement" type="submit" value="Add"/>
                                        
                            </div>
                        </div>

                    
                    </form>

                </div>
            </div>
        </div>
    </div>
{include file='../Layout/footer.tpl'}