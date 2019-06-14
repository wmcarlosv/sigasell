{include file='../Layout/header.tpl'}
    <title>License Activation - Admin</title>

    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-check-circle"></div> License Activation</span>
                </h1><hr>
            </div>

<br>

           <br>



<br>
{if $wrong}<div class="alert alert-danger">{$license_msg}</div>{/if}
            <div class="col-sm-12">
                <div class="demo-form-wrapper">
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                    
                        
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               API Key
                            </label>
                            <div class="col-sm-6">
                               
                                    <input id="form-control-4" name="api_key" class="form-control" type="text" required="true" style="height: 45px;"/>
                                    <em><b>Get your API key from <a href="https://codsem.com/user/setting?r=api-key" target="_blank">here</a>.</b></em>
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Purchase Code
                            </label>
                            <div class="col-sm-6">
                               
                                    <input id="form-control-4" name="purchase_code" class="form-control" type="text" required="true" style="height: 45px;"/>
                                    <em><b> Get your Purchase code from <a href="https://codsem.com/user/downloads" target="_blank">here</a>.</b></em>
                                </div>
                            </div>
                        
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="activation-verify" type="submit" value="Activate"/>
                                        
                            </div>
                        </div>

                    
                    </form>
                </div>
            </div>
        </div>
    </div>
{include file='../Layout/footer.tpl'}