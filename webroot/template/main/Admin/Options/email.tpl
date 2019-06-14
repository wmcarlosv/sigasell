{include file="../Layout/header.tpl"}
   
    <title>Email Settings - Admin</title>
      <div class="layout-content">
         <div class="layout-content-body">
            <div class="title-bar">

             <h1 class="title-bar-title">
                <span class="d-ib"><div class="fa fa-envelope"></div> Email</span>
             </h1>
                <hr>
                <br>

          {if $mailer}<div class='alert alert-success'>Email settings saved with success</div>{/if}
          {if $do_error}<div class='alert alert-danger'>Error: Somthing Wrong! Please Try again.</div>{/if}

         </div>

                    <form class="form form-horizontal" method="POST">
					                 <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                                Type of mail
                            </label>
                            <div class="col-sm-6">
                   <select id="select_role" name="option" class="form-control" style="height: 45px; ">
                          <option value="smtp" {if $mail_option == smtp} selected="selected" {else}{/if}>SMTP Mail</option>
                          <option value="php_mail" {if $mail_option == php_mail} selected="selected" {else}{/if} >PHP Mail</option>
                                    </select>
                                </div>
                            </div>

   <script>
    document.getElementById('select_role').addEventListener('change', function () {
    var style = this.value == 'php_mail' ? 'block' : 'yes';
    document.getElementById('hidden_div').style.display = style;
	var style = this.value == 'smtp' ? 'block' : 'none';
    document.getElementById('hidden_div').style.display = style;
	});
</script>
                <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Support email 
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="support_email" class="form-control" type="text" style="height: 45px;" value="{$support_email}"/>
                                </div>
                            </div>

      <div id="hidden_div"{if $mail_option == smtp} style="display: yes;" {else} style="display: none;" {/if}>
    
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Username 
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="username" class="form-control" type="text" style="height: 45px;" value="{$mail_username}"/>
                                </div>
                        </div>
                            
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Port 
                            </label>
                            <div class="col-sm-6">
                                  <input id="form-control-4" name="port" class="form-control" type="text" style="height: 45px;" value="{$mail_port}"/>
                             </div>
                        </div>

                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Host 
                            </label>
                            <div class="col-sm-6">
                                <input id="form-control-4" name="host" class="form-control" type="text" style="height: 45px;" value="{$mail_host}"/>
                            </div>
                         </div>

					    <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                                Use
                            </label>
                            <div class="col-sm-6">
                              <select name="ssl" class="form-control" style="height: 45px; ">
                                <option value="ssl" {if $mail_ssl == ssl} selected="selected" {/if}>SSL</option>
                                <option value="tls" {if $mail_ssl == tls} selected="selected" {/if} >TLS</option>
                              </select>
                            </div>
                         </div>

							
                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Password
                            </label>
                            <div class="col-sm-6">
                               <input id="form-control-4" name="pass" class="form-control" type="text" style="height: 45px;" value="{$mail_pass}"/>
                             </div>
                        </div>
							
</div>

                       <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-email" type="submit" value="Save" />
                                        
                            </div>
                        </div>
                        </form>
<hr>
<h4>How SMTP Gmail Works ?</h5>
To know more about how SMTP for gmail works, Please <b><a href="{$HOST}pages/smtp-gmail-setup" target="_blank">Click here</a></b>
              </div>
        </div>

{include file="../Layout/footer.tpl"}