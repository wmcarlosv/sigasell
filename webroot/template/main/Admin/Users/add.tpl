{include file='../Layout/header.tpl'}
    <title>Add User - Admin</title>

    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-plus-circle"></div> Add user</span>
                </h1>
                
 {include file='../Users/menu.tpl'}
                
     {if $do_exist}<div class="alert alert-danger">Error: Username/Email Already Exist! Please Try again.</div>{/if}
     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}

            </div>

            <div class="col-sm-12">
                <div class="demo-form-wrapper">
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                        
                                    <input type="hidden" name="csrf" value="{$csrfToken}"/>

                       <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                               Role
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="role" class="form-control" data-msg-required="Please select a status admin!." required="true"style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="admin">Admin</option>
                                        <option value="user">User</option>
                                    </select>
                                </div>
                            </div>
                      
                       <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                               Status
                            </label>
                            <div class="col-sm-6">
                            
                                    <select id="form-control-6" name="status" class="form-control" required="true" style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1">Active</option>
                                        <option value="2">Pending</option>
                                        <option value="3">Inactive</option>

                                    </select>
                                </div>
                            </div>
                     
                        
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Username
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="username" class="form-control" type="text" required="true" style="height: 45px;"/>
                                </div>
                            </div>
                    
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Email
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="email" class="form-control" type="email" required="true" style="height: 45px;"/>
                                </div>
                            </div>
                      
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Password
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="password" class="form-control" type="password" required="true" style="height: 45px;"/>
                                </div>
                        </div>
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="add-user" type="submit" value="Add"/>
                                        
                            </div>
                        </div>

                    
                    </form>
                </div>
            </div>
        </div>
    </div>
{include file='../Layout/footer.tpl'}