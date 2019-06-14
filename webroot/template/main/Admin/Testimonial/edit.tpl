{include file='../Layout/header.tpl'}

    <title> Edit Testimonial - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-cog"></div> Edit Testimonial #{$r_id}</span>
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
                                Full Name
                            </label>
                            <div class="col-sm-6">
                               
                                    <input id="form-control-4" name="name" class="form-control" type="text" required="true" style="height: 45px;" value="{$r_name}"/>
                                </div>
                            </div>

                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                                User Job
                            </label>
                            <div class="col-sm-6">
                               
                                    <input id="form-control-4" name="job" class="form-control" type="text" required="true" style="height: 45px;" value="{$r_job}"/>
                                </div>
                            </div>
                      
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                               User Review
                            </label>
                            <div class="col-sm-6">
                                    <textarea id="descNum" name="content" class="form-control" type="text" style="height:100px">{$r_content}</textarea>
                                </div>
                            </div>

                        <div class= "form-group" style="display:inline-block;margin-right:1px;">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-testimonial" type="submit" value="Save" />

                            </div>
                        </div>

                    </form>
                    
                </div>
            </div>
        </div>
    </div>
{include file='../Layout/footer.tpl'}