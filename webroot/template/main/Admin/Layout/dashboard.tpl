{include file='../Layout/header.tpl'}

    <title>Dashboard - Admin </title>

    <div class="layout-content">
        <div class="layout-content-body">

 <div id="showTags" title="Help : Step by Step!" class="btn btn-success"><div class="fa fa-question-circle"></div> Help <div class="fa fa-caret-down"></div></div>
<ul id="subforms" class="subforums hide">
 <hr>
<p>- <b>Howdy Admin! :</b> Welcome to your dashboard here you will see all statistics when you login in.</p>
<p>- <b>Settings :</b> First thing you have to do is to go <a href="{$HOST}admin/set/settings">here</a> and setup all info and data.</p>
<p>- <b> Email :</b> You have to setup Your support email <a href="{$HOST}admin/set/email">here</a> ,So that you can receive all messages from users.</p>
<p>- <b> Payments :</b> You have to set up deposits options <a href="{$HOST}admin/set/payment">here</a></p>
<p>- <b> Note !</b> Please fill out all informations otherwise you will have serious problems!</p>
<p>- <b> Updates :</b> Every time i'll update this script :)</p>
<hr>
    </ul>

    <hr>

            <div class="title-bar">
                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-dashboard"></div> 
                        Dashboard 
                    </span>
                </h1>
               
            </div>
            <center>
                
<p>{if $app_version}{$msg_version}{/if}</p>

        </center>
<br>


            <div class="row gutter-xs">
                <div class="col-xs-6 col-md-3" style="  background-color: #2ecc71;">
                    <div class="card bg-success">
                        <div class="card-values" style="  background-color: #2ecc71;">
                            <div class="p-x">
                                <div class="media">
                                    <div class="media-middle media-left">
                                        <img style="margin-top: 5px"
                                             src="{$AST}admin/images/private/dollar.png">
                                    </div>
                                    <div class="media-middle media-left" style="  background-color: #2ecc71;">
                                        <b><small><div class="fa fa-question-circle " alt="" rel="tooltip" title="This is what you earn so far"></div> 
                                            Owner Earnings </b>
                                       </small>
                                        <h3 class="fw-l"><b> {$sumbole}{$admearn}</b></h3>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-xs-6 col-md-3" style="background-color: #ff5930;
    color: #ffffff; border-color: #ff5930; ">
                    <div class="card"style="background-color: #ff5930;
    color: #ffffff; border-color: #ff5930;">
                        <div class="card-values"style="background-color: #ff5930;
    color: #ffffff; border-color: #ff5930;">
                            <div class="p-x"style="background-color: #ff5930;
    color: #ffffff; border-color: #ff5930;">
                               <b> <small><div class="fa fa-question-circle" alt="" data-toggle="tooltip" title="Number of sales so far"></div> 
                                  Owner Sales 
                                </small></b>
                                <h3 class="fw-l"><div class="fa fa-shopping-cart"></div> <b> {$sales}</b></h3>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-xs-6 col-md-3" style="background-color: #6e1ed6;
    color: #ffffff; border-color: #6e1ed6;">
                    <div class="card"style="background-color: #6e1ed6;
    color: #ffffff; border-color: #6e1ed6;">
                        <div class="card-values"style="background-color: #6e1ed6;
    color: #ffffff; border-color: #6e1ed6;">
                            <div class="p-x">
                              <b>  <small><div class="fa fa-question-circle" alt="" data-toggle="tooltip" title="Users Balance"></div> 
                                   Users Balance</b>
                                </small>
                                <h3 class="fw-l"><div class="fa fa-money"></div>
                                   <b> {$sumbole}{$balances}</b>
                                </h3>
                            </div>
                        </div>

                    </div>
                </div>
                
                <div class="col-xs-6 col-md-3" style="background-color: #0a0a0a;
    color: #ffffff; border-color: #0a0a0a; ">
                    <div class="card"style="background-color: #0a0a0a;
    color: #ffffff; border-color: #0a0a0a;">
                        <div class="card-values"style="background-color: #0a0a0a;
    color: #ffffff; border-color: #0a0a0a;">
                            <div class="p-x"style="background-color: #0a0a0a;
    color: #ffffff; border-color: #0a0a0a;">
                               <b> <small><div class="fa fa-question-circle" alt="" data-toggle="tooltip" title="Number of all users that joined so far"></div> 
                                  Users
                                </small></b>
                                <h3 class="fw-l"><div class="fa fa-users"></div> <b> {$users}</b></h3>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-6 col-md-3" style="background-color: #13e1f0;
    color: #ffffff; border-color: #13e1f0; ">
                    <div class="card"style="background-color: #13e1f0;
    color: #ffffff; border-color: #13e1f0;">
                        <div class="card-values"style="background-color: #13e1f0;
    color: #ffffff; border-color: #13e1f0;">
                            <div class="p-x"style="background-color: #13e1f0;
    color: #ffffff; border-color: #13e1f0;">
                                <b><small><div class="fa fa-question-circle" alt="" data-toggle="tooltip" title="Number of items for sale"></div> 
                                  Items</b>
                                </small>
                                <h3 class="fw-l"><div class="fa fa-cubes"></div><b> {$items}</b></h3>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xs-6 col-md-3" style="background-color: #b31e55;
    color: #ffffff; border-color: #b31e55; ">
                    <div class="card"style="background-color: #b31e55;
    color: #ffffff; border-color: #b31e55;">
                        <div class="card-values"style="background-color: #b31e55;
    color: #ffffff; border-color: #b31e55;">
                            <div class="p-x"style="background-color: #b31e55;
    color: #ffffff; border-color: #b31e55;">
                                <b><small><div class="fa fa-question-circle" alt="" data-toggle="tooltip" title="Number of categories"></div> 
                                  Categories
                                </small></b>
                                <h3 class="fw-l"><div class="fa fa-sitemap"></div><b> {$categories}</b></h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-md-3" style="background-color: #386acf;
    color: #ffffff; border-color: #386acf;">
                    <div class="card"style="background-color: #386acf;
    color: #ffffff; border-color: #386acf;">
                        <div class="card-values"style="background-color: #386acf;
    color: #ffffff; border-color: #386acf;">
                            <div class="p-x">
                              <b>  <small><div class="fa fa-question-circle" alt="" data-toggle="tooltip" title="Number of Announcements"></div> 
                                   Announcements
                                </small></b>
                                <h3 class="fw-l"><div class="fa fa-bullhorn"></div>
                                   <b> {$announcements}</b>
                                </h3>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-xs-6 col-md-3" style="background-color: #f0b848;
    color: #ffffff; border-color: #f0b848;">
                    <div class="card"style="background-color: #f0b848;
    color: #ffffff; border-color: #f0b848;">
                        <div class="card-values"style="background-color: #f0b848;
    color: #ffffff; border-color: #f0b848;">
                            <div class="p-x">
                                <b><small><div class="fa fa-question-circle" alt="" data-toggle="tooltip" title="Number of Pages"></div> 
                                  Pages
                                </small></b>
                                <h3 class="fw-l"><div class="fa fa-files-o"></div>
                                  <b> {$pages}</b>
                                </h3>
                            </div>
                        </div>

                    </div>
                </div>
           <div class="row gutter-xs">
                <div class="col-xs-12 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3><div class="fa fa-line-chart"></div> 
                                Performance <small> (Today) </small>
                            </h3>
                            <hr>
                        </div>
                        
                        <div class="card-body" style="
    line-height: 1px;">
                           <div class="table-responsive">
                                <table class="table table-middle">
                                    <thead>
                                    <tr>
                                        <th style="text-align: center"><div class="fa fa-shopping-cart"></div> Sales</th>
                                        <th style="text-align: center"><div class="fa fa-comment"></div> Comments</th>
                                        <th style="text-align: center"><div class="fa fa-star"></div> Rating</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <td style="text-align: center">{$sales}</td>
                                    <td style="text-align: center">{$comments}</td>
                                    <td style="text-align: center">{$items}</td>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4><div class="fa fa-users"></div>
                                Users
                            </h4>
                            <hr>
                        </div>
                        <div class="card-body">
                           <div class="table-responsive">
                                <table class="table table-middle">
                                    <thead>
                                    <tr>
                                        <th style="text-align: center"><div class="fa fa-check"></div> Active</th>
                                        <th style="text-align: center"><div class="fa fa-history"></div> Pending</th>
                                        <th style="text-align: center"><div class="fa fa-ban"></div> Inactive</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <td style="text-align: center">{$active_users}</td>
                                    <td style="text-align: center">{$pending_users}</td>
                                    <td style="text-align: center">{$inactive_users}</td>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

            <div class="row gutter-xs">
                <div class="col-xs-12 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3><div class="fa fa-dollar"></div>
                                Earnings
                            </h3>
                            <hr>
                        </div>
                        
                        <div class="card-body" style="
    line-height: 1px;">
                           <div class="table-responsive">
                                <table class="table table-middle">
                                    <thead>
                                    <tr>
                                        <th style="text-align: center"><div class="fa fa-shopping-cart"></div> Sales</th>
                                        <th style="text-align: center"><div class="fa fa-money"></div> Earn</th>
                                        <th style="text-align: center"><div class="fa fa-times"></div> Refund</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <td style="text-align: center">{$sales}</td>

                                    <td style="text-align: center">{$sumbole}{$admearn}</td>

                                    <td style="text-align: center">{$sumbole}0.00</td>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4><div class="fa fa-bank"></div>
                                Invoices
                            </h4>
                            <hr>
                        </div>
                        <div class="card-body">
                           <div class="table-responsive">
                                <table class="table table-middle">
                                    <thead>
                                    <tr>
                                        <th style="text-align: center"><div class="fa fa-plus"></div> Invoices</th>
                                        <th style="text-align: center"><div class="fa fa-check-circle"></div> Paid</th>
                                        <th style="text-align: center"><div class="fa fa-times"></div> Unpaid</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <td style="text-align: center">{$deposcount}</td>
                                    <td style="text-align: center">{$sumbole}{$depospaid}</td>
                                    <td style="text-align: center">{$sumbole}{$deposunpaid}</td>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                     </div> </div>

{include file='../Layout/footer.tpl'}