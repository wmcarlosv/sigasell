{include file="../Layout/header.tpl"}

  <title>Options - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

               <h1 class="title-bar-title">
                 <span class="d-ib"><div class="fa fa-cog"></div> Options</span>
               </h1>
            </div>
            <hr>
            <br>

    {if $generale}<div class='alert alert-success'><b>#Generale</b> Settings Updated Successfully!</div>{/if}
    {if $design}<div class='alert alert-success'><b>#Design</b> Settings Updated Successfully!</div>{/if}
    {if $interg}<div class='alert alert-success'><b>#Integration</b> Settings Updated Successfully!</div>{/if}
    {if $captcha}<div class='alert alert-success'><b>#Captcha</b> Settings Updated Successfully!</div>{/if}
    {if $system}<div class='alert alert-success'><b>#System</b> Settings Updated Successfully!</div>{/if}
    {if $social}<div class='alert alert-success'><b>#Social</b> Settings Updated Successfully!</div>{/if}
    {if $do_error}<div class='alert alert-danger'>Error: Somthing Wrong! Please Try again <small><b>[Reasons: Required Fields, SQL Error]</b></small></div>{/if}

<!-- Tab links -->
<br><div class="tab">
    
  <button class="tablinks" onclick="openCity(event, 'General')"{if $generale}id="defaultOpen"{/if}{if !$generale && !$design && !$interg && !$captcha && !$system && !$social}id="defaultOpen"{/if}><div class="fa fa-wrench"></div> General</button>
  <button class="tablinks" onclick="openCity(event, 'Design')"{if $design}id="defaultOpen"{/if}><div class="fa fa-paint-brush"></div> Design</button>
  <button class="tablinks" onclick="openCity(event, 'Integration')"{if $interg}id="defaultOpen"{/if}><div class="fa fa-code"></div> Integration</button>
  <button class="tablinks" onclick="openCity(event, 'Captcha')" {if $captcha}id="defaultOpen"{/if}><div class="fa fa-refresh"></div> Captcha</button>
  <button class="tablinks" onclick="openCity(event, 'System')"{if $system}id="defaultOpen"{/if}><div class="fa fa-gears"></div> System</button>
  <button class="tablinks" onclick="openCity(event, 'Social')"{if $social}id="defaultOpen"{/if}><div class="fa fa-feed"></div> Social Links</button>
</div>

          
          
<!-- Tab content -->
<div id="General" class="tabcontent">
 
    <!-- General start -->
    <h3>General</h3><hr>
 
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                     
                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label"> 
                               Site Name
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="name" class="form-control" type="text" maxlength="50" style="height: 45px;" value="{$name}"/>
                                    <em><b>Note: insert your site name not complete title! ex: Proads</b></em>
                                </div>
                            </div>
                      
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;"> 
                               Site title
                            </label>
                            <div class="col-sm-6">
                                    <input  id="titleNum" name="site_title" class="form-control" type="text" style="height: 45px;" value="{$site_title}"/>
                                        <em><b>Note: insert your home page title not name! ex: New Style Ad network</b></em>
                                </div>
                         </div>

                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label">
                                Description
                            </label>
                            <div class="col-sm-6">
                                    <textarea id="descNum" name="site_description" class="form-control" type="text" style="height:100px">{$site_description}</textarea>
                                </div>
                            </div>
                      
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label">
                                Keywords
                            </label>
                            <div class="col-sm-6">
                                    <textarea id="descNum" name="keywords" class="form-control" type="text" style="height:100px">{$keywords}</textarea>
                                       <em><b>Note: Seperate keywords with a comma</b></em>
                                </div>
                            </div>
                            
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                               Search Box
                            </label>
                            <div class="col-sm-6">
                                    <textarea id="descNum" name="short_desc" class="form-control" type="text" style="height:100px">{$short_desc}</textarea>
                                       <em><b>Note: Specify a short description displayed before search box in home page</b></em>
                                </div>
                            </div>

                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap; text-align: left; float: left;">
                               Main Domain
                            </label>
                            <div class="col-sm-6">
                                    <input id="urlNum" name="main_domain" class="form-control" type="url" required="required" style="height: 45px;" value="{$HOST}"/>
                                       <em><b>Note: insert with <b>(http://)</b> Or <b>(https:/)</b> and the trailing slash <b>(/)</b>. ex: http://domain.com/</b></em>
                                </div>
                            </div>
                 <div class="form-group">
                            <label for="paymentWay" class="col-sm-1 control-label">
                               Confirm
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="account_activate_email" class="form-control" style="height: 45px;">
                                    <option value="1"{if $account_activate_email == 1} selected="selected"{/if}>Yes</option>
                                    <option value="2"{if $account_activate_email == 2} selected="selected"{/if}>No</option>
                                    </select>
                                    <em><b>Note: Users need to confirm by email when signup?</b></em>
                                </div>
                            </div>


                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-generale" type="submit" value="Save"/>
                                        
                            </div>
                        </div>

                    </form>
    <!-- General ends -->
</div>

<div id="Design" class="tabcontent">
  <h3>Design</h3><hr>
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                    
                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap;"> 
                              Background
                            </label>
                            <div class="col-sm-6">
                               <input id="form-control-4" name="background_image" class="form-control" type="text" style="height: 45px; " value="{$background_image}"/>
                                <em><b>Note: This Image appear on background of searh box.</b></em>
                            </div>
                       </div>
                    
                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap;"> 
                             Logo Url (1)
                            </label>
                            <div class="col-sm-6">
                               <input id="form-control-4" name="logo_url" class="form-control" type="text" style="height: 45px; " value="{$Logo}"/>
                            </div>
                       </div>
                       
                      <div class="form-group">
                           <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap;"> 
                             Logo Url (2)
                            </label>
                            <div class="col-sm-6">
                               <input id="form-control-4" name="logo_url_home" class="form-control" type="text" style="height: 45px; " value="{$Logo2}"/>
                                <em><b>Note: This Logo appear in home/login pages with black text.</b></em>
                             </div>
                       </div>
                       
                        <div class="form-group">
                            <label for="accountNumber" class="col-sm-1 control-label" style="white-space: nowrap;">
                              Favicon URL
                            </label>
                            <div class="col-sm-6">
                               <input id="form-control-9" name="icon_url" class="form-control" type="text" style="height: 45px; " value="{$Favicon_url}"/>
                            </div>
                        </div>

                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-design" type="submit" value="Save" />
                                        
                            </div>
                        </div>

                    </form>
</div>

<div id="Integration" class="tabcontent">
  <h3>Integration</h3>
  <hr>
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                    
                     <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                              Front Head Code
                            </label>
                            <div class="col-sm-6">
                              <textarea id="form-control-9" name="head_code" class="form-control" type="text" style="height:100px" >{$code_head}</textarea>
                            </div>
                      </div>

                         <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                         After Body Tag Code
                            </label>
                            <div class="col-sm-6">
                               <textarea id="form-control-9" name="body_code" class="form-control" type="text" style="height:100px" >{$body_code}</textarea>
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                         After Footer Tag Code
                            </label>
                            <div class="col-sm-6">
                               <textarea id="form-control-9" name="footer_code" class="form-control" type="text" style="height:100px" >{$footer_code}</textarea>
                            </div>
                        </div>
                        
                        
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-interg" type="submit" value="Save"/>
                                        
                            </div>
                        </div>

                    </form>
</div>

<div id="Captcha" class="tabcontent">
  <h3>Captcha</h3><hr>
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                     
                         <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                             Captcha Type
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="captcha_type" class="form-control" style="height: 45px; ">
                                    <option value="recaptcha" selected="selected">Recaptcha</option>
                                    </select>
                                    <em><b>Note: Get your reCAPTCHA keys from <a href="https://www.google.com/recaptcha/" target="_blank">here</a>.</b></em>
                                </div>
                         </div>

                         <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              reCAPTCHA Site key
                            </label>
                            <div class="col-sm-6">
                                <input id="form-control-4" name="reCAPTCHA_site_key" class="form-control" type="text" style="height: 45px;" value="{$reCAPTCHA_site_key}"/>
                            </div>
                         </div>
                         
                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              reCAPTCHA Secret key
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="reCAPTCHA_secret_key" class="form-control" type="text" style="height: 45px; " value="{$reCAPTCHA_secret_key}"/>
                                </div>
                            </div>
                  

                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Enable Captcha on signup
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="captcha_signup" class="form-control" style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1"{if $captcha_signup == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if $captcha_signup == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                     
                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Enable Captcha on login
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="captcha_login" class="form-control" style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1"{if $captcha_login == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if $captcha_login == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                    
                        </div>
                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Enable Captcha on Forgot<br> Password
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="captcha_forgot" class="form-control" style="height: 45px; ">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1"{if $captcha_forgot == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if $captcha_forgot == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                       
                        
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-captcha" type="submit" value="Save"/>
                                        
                            </div>
                        </div>

                    </form>
 
</div>

<div id="System" class="tabcontent">
  <h3>System</h3><hr>
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                        
                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label" style="white-space: nowrap; text-align: left; float: left;">
                               Default Language
                            </label>
                            <div class="col-sm-6">
                                <select id="form-control-6" name="language" class="form-control" style="height: 45px; ">
                                   <option value="en_US"{if $language == 'en_US'} selected="selected"{/if}>English United States</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Home "Featured Items"
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="enable_home_featured" class="form-control" style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1"{if $enable_home_featured == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if $enable_home_featured == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>

                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Home "Popular Items"
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="enable_home_popular" class="form-control" style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1"{if $enable_home_popular == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if $enable_home_popular == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                            
                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Home "Why Choose Us"
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="enable_home_why" class="form-control" style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1"{if $enable_home_why == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if $enable_home_why == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                            
                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Home "Testimonials"
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="enable_home_testimonial" class="form-control" style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1"{if $enable_home_testimonial == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if $enable_home_testimonial == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                            
                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                              Home "Announcements"
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="enable_home_announcement" class="form-control" style="height: 45px;">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
                                        <option value="1"{if $enable_home_announcement == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if $enable_home_announcement == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                        
                            
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-system" type="submit" value="Save"/>
                                        
                            </div>
                        </div>

                    </form>
</div>

<div id="Social" class="tabcontent">
  <h3>Social Links</h3><hr>
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                       
                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Facebook
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="fb_link" class="form-control" type="text" style="height: 45px;" value="{$fb_link}"/>
                                </div>
                            </div>

                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Google plus
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="go_link" class="form-control" type="text" style="height: 45px;" value="{$go_link}"/>
                                </div>
                            </div>

                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Twitter
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="tweet_link" class="form-control" type="text" style="height: 45px;" value="{$tweet_link}"/>
                                </div>
                            </div>

                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Pinterest
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="pin_link" class="form-control" type="text" style="height: 45px;" value="{$pin_link}"/>
                                </div>
                            </div>

                            
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="up-social" type="submit" value="Save"/>
                                        
                            </div>
                        </div>

                    </form>
</div>


<div id="Security" class="tabcontent">
  <h3>Security</h3><hr>
                    <form id="changeDataVO" class="form form-horizontal" data-toggle="validator" method="POST">
                        <div class="form-group">
                            <label for="paymentWay" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;">
                               Enable ip/date note
                            </label>
                            <div class="col-sm-6">
                                    <select id="form-control-6" name="enable_note" class="form-control" style="height: 45px; ">
                                        <option value="" disabled="disabled" selected="selected">Select...</option>
            <option value="1"{if {$enable_note} == 1} selected="selected" {else}{/if}>Yes</option>
   
            <option value="2"{if {$enable_note} == 2} selected="selected" {else}{/if}>No</option>

                                    </select>
                                </div>
                            </div>
                     
                       <div class="form-group">
                            <label for="accountNumber" class="col-sm-2 control-label"style="white-space: nowrap; text-align: left; float: left;"> 
                              Max ip per 24H
                            </label>
                            <div class="col-sm-6">
                                    <input id="form-control-4" name="max_ip_day" class="form-control" type="text" style="height: 45px;" value="{$max_ip_day}"/>
                                    <b>Note: insert max counting for single ip per 24H for all ads</b>
                                </div>
                            </div>
                     
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="Save_security" type="submit" value="Save"/>
                                        
                            </div>
                        </div>

                    </form>
</div>
</div>
 <hr>
{include file="../Layout/footer.tpl"}