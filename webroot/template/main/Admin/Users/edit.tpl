{include file='../Layout/header.tpl'}

    <title> Edit User - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-cog"></div> Edit User #{$r_id}</span>
                </h1>
                <hr><br>
          
     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}

            </div>

            <div class="col-sm-12">
                <div class="demo-form-wrapper">
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                       <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Role
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="role" class="form-control" required="true" style="height: 45px;">
                                        <option value="" disabled="disabled" >Select...</option>
                                        <option value="admin" {if $r_role == 'admin'} selected="selected"{/if}>Admin</option>
                                        <option value="user" {if $r_role == 'user'} selected="selected"{/if} >User</option>
                                    </select>
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
                                        <option value="2" {if $r_status == '2'} selected="selected"{/if} >Pending</option>
                                        <option value="3"{if $r_status == '3'} selected="selected"{/if}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                    
                        
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Username
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="username" class="form-control" type="text" required="true" maxlength="100" style="height: 45px;" value="{$r_username}"/>
                                </div>
                            </div>
                 
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               First Name
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="f_name" class="form-control" type="text" required="true" maxlength="100" style="height: 45px;" value="{$r_first_name}"/>
                                </div>
                            </div>
                            
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Last Name
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="l_name" class="form-control" type="text" required="true" maxlength="100" style="height: 45px;" value="{$r_last_name}"/>
                                </div>
                            </div>
                            
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Email
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="email" class="form-control" type="email" required="true" maxlength="100" style="height: 45px;" value="{$r_email}"/>
                                </div>
                            </div>
                            
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                              Balance
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="balance" class="form-control" type="text" required="true" style="height: 45px;" value="{$r_balance}"/>
                                </div>
                            </div>


                        <div class= "form-group" style="display:inline-block;margin-right:1px;">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-user" type="submit" value="Save" />

                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
{include file='../Layout/footer.tpl'}