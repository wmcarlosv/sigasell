{include file='../Layout/header.tpl'}
    <title>User #{$r_id} - Admin</title>

    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">
                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-user"></div> 
                        User #{$r_id}
                    </span>
                </h1>
<style>
    div.col-xs-6.col-md-3 {
    width: 1100px;
}

</style>
            </div>
            <center>
        </center>
<br>

            <div class="row gutter-xs">
                <div class="col-xs-6 col-md-3" style="background-color: #2ecc71;">
                    <div class="card bg-success">
                        <div class="card-values" style=" background-color: #2ecc71;">
                            <div class="p-x">
                                <div class="media">
                                    <div class="media-middle media-left">
                                        <img style="margin-top: 5px"
                                             src="{$AST}admin/images/private/dollar.png">
                                    </div>
                                    <div class="media-middle media-left" style="  background-color: #2ecc71;">
                                        <b><small><div class="fa fa-question-circle" alt="" data-toggle="tooltip" title="This is current user #{$r_id} Balance"></div> 
                                             balance
                                        </small></b>
                                        <h3 class="fw-l">{$sumbole}{$r_balance}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
              
       <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                           aria-expanded="true" aria-controls="collapseOne">
                            Account Info</a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                           <tr>
                             <td>Id</td>
                             <td>#{$r_id}</td>
                           </tr>
                           <tr>
                            <td>Status</td>
                            
                          {if $r_status == '1'}
                            <td>Active</td>
                          {elseif $r_status == '2'}
                            <td>Pending</td>
                          {elseif $r_status == '3'}
                            <td>Inactive</td>
                          {/if}
                          
                            </tr>
                            <tr>
                             <td>Username</td>
                             <td>{$r_username}</td>
                            </tr>
                            <tr>
                              <td>role</td>
                              <td>{$r_role}</td>
                            </tr>
                            <tr>
                              <td>Email</td>
                              <td>{$r_email}</td>
                            </tr>
                            <tr>
                              <td>Current User balance</td>
                              <td>{$sumbole}{$r_balance}</td>
                            </tr>
                            <tr>
                              <td>Created</td>
                              <td>{$r_created}</td>
                            </tr>
                        </table>
                    </div>
                </div>
           </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            IP Info</a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td>Login IP</td>
                                <td>{$r_login_ip}</td>
                            </tr>
                            <tr>
                                <td>Registred IP</td>
                                <td>{$r_register_ip}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

           
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Billing Info</a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td>First Name</td>
                                <td>{$r_first_name}</td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td>{$r_last_name}</td>
                            </tr>
                            <tr>
                                <td>Country</td>
                                <td>{$r_country}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

        </section>
        </div>
 {include file='../Layout/footer.tpl'}