{include file='../Layout/header.tpl'}
    <title>Edit Files - Admin</title>

    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-file-text"></div> Edit Files</span>
                </h1>
                
 {include file='../Items/menu2.tpl'}
 
            {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
            {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                
            </div>

            <div class="col-sm-12">
                <div class="demo-form-wrapper">
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST" enctype="multipart/form-data">
                   
                                  <input type="hidden" name="csrf" value="{$csrfToken}"/>

                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                             Thumbnail
                            </label>
                            <div class="col-sm-6">
                               
                                    <input type="file" class="form-control" name="thumbnail">
                                    <em><b>80x80 JPEG/PNG</b></em>
                                </div>
                            </div>
                    
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                             Preview Image
                            </label>
                            <div class="col-sm-6">
                               
                                    <input type="file" class="form-control" name="previewImage">
                                    <em><b>680x340 JPEG/PNG</b></em>
                                </div>
                            </div>
	
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                             Main File(s)
                            </label>
                            <div class="col-sm-6">
                               
                                    <input type="file" class="form-control" name="mainfiles">
                                    <em><b>ZIP - All Files for Download</b></em>
                                </div>
                            </div>

                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>
                                <br>
                                <button class="btn btn-info" name="up-files" type="submit" value="up-files"><i class="fa fa-check"></i> Update</button>
                                        
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
{include file='../Layout/footer.tpl'}