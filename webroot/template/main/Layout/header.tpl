<!DOCTYPE html>
<html lang="en">
<head>
    <!-- start meta
    ==================================================-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- responsive viewport 
    ==================================================-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Title -->
    <title>{$site_title} | {$name}</title>
    
    <!-- Keywords -->
    <meta name="keywords" content="{$keywords}" />

    <!-- Description -->
    <meta name="description" content="{$site_description}" />

    <!-- Robots -->
    <meta name="robots" content="index, follow"/>

    <!-- Verification -->
    {$code_head}
        
	<!-- Favicon
    ==================================================================-->
	<link rel="icon" href="{$Favicon_url}">

    <!-- Google Font
    ==================================================================-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">

    <!-- Bootstrap css
    ==================================================================-->
    <link rel="stylesheet" href="{$AST}user/bootstrap.min.css">

    <!-- FontAwesome css
    =====================================================================-->
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

    <!-- MeanManu css
    =====================================================================-->
    <link rel="stylesheet" href="{$AST}user/meanmenu.css">

    <!-- SimpleTicker css
    =====================================================================-->
    <link rel="stylesheet" href="{$AST}user/jquery.simpleTicker.css">

    <!-- Owl Carousel css
    =====================================================================-->
    <link rel="stylesheet" href="{$AST}user/owl.carousel.min.css">

    <!-- Style css
    ==================================================================== -->
    <link rel="stylesheet" href="{$AST}user/style.css">

    <!-- Side css
    ==================================================================== -->
    <link rel="stylesheet" href="{$AST}user/side.css">

    <!-- Responsive css
    ===================================================================== -->
    <link rel="stylesheet" href="{$AST}user/responsive.css">

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
        
   <!-- Canonical 
   ==================================================================== -->
   <link rel="canonical" href="{$canonical}" />


   <!-- Open Graph
   ==================================================================== -->
   <meta property="og:locale" content="en_US" />
   <meta property="og:title" content="{$site_title} | {$name}" />
   <meta property="og:type" content="website" />
   <meta property="og:url" content="{$canonical}" />
   <meta property="og:description" content="{$site_description}" />
   <meta property="og:site_name" content="{$name}" />
   <meta property="og:image" content=""/>
   <meta property="og:image:secure_url" content="" /> 
   <meta property="og:image:type" content="application/octet-stream">
   <meta property="og:image:width" content="" />
   <meta property="og:image:height" content=""/>

   <!-- COOKIECONSENT
   ==================================================================== -->
   <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.3/cookieconsent.min.css" />
   <script src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.3/cookieconsent.min.js"></script>
   <script src="{$AST}js/coockieconsent.js"></script>

   <!-- reCAPTCHA
   ==================================================================== -->
   <script src='https://www.google.com/recaptcha/api.js'></script>

</head>

<body>
    <!-- HEADER START HERE -->
    <header class="header-area">
        <!-- Header Top Start -->
        <div class="header-top hidden-xs hidden-sm">
            <div class="container">
                <div class="row">
                    
    {if $enable_home_announcement == '1'}

              {if $announcements}
                    <div class="col-md-6 col-sm-6">
                        
                        <div class="n">
                            <div id="sticker-item" class="ticker">
                                <ul>
                  	{foreach from=$announcements item=foo}
	
	                          <li><a href="{$HOST}announcement/{$foo['id']}/" style="color: #ffffff;"><div class="fa fa-bullhorn"></div> {$foo['title']}</a></li>
	   
                    {/foreach}
                                </ul>
                            </div>
                        </div>
                    </div>
              {/if}
        
    {else}  
                    <div class="col-md-6 col-sm-6">
                        
                        <div class="n">
                            <div id="sticker-item" class="ticker">
                                <ul>
	                          <li><div class="fa fa-user"></div> {$_WELCOME_BACK}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
    {/if}

                    
                    <div class="col-md-6 col-sm-6">
                        <div class="h-phone">
                            <p>{$_NEED_HELP} {$support_email}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header Top End -->

        <!-- USER AREA START -->
        <div class="user-board-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-2  hidden-sm ">
                        <div class="logo hidden-xs">
                            <a href="{$HOST}"><img src="{$Logo}" alt="{$name}">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-7  hidden-xs">
                        <div class="user-menu">
                            <nav>
                                <ul id="nav">
                                    
                  	{foreach from=$pages item=foo}
	
	                          <li><a href="{$HOST}page/{$foo['id']}/">{$foo['title']}</a></li>
	   
                    {/foreach}

                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!-- Userboard Start Here -->
                    <div class="col-md-4 col-sm-5 col-xs-12 no-padding">
                        <div class="userboard">
                            <ul class="board-item">
                                
                                {if $logged}
                                  <li class="price-cart"><img class="user-avatar" src="{if empty($avatar)}{$AST}img/avatar.jpg{else}{$avatar}{/if}" alt="{$username}"/> {$username} <i class="fa fa-caret-down"></i>
                                     <ul class="cart-details">
                                         <li>
                                            <div class="cart-info">
                                                <a href="{$USR}{$username}/"><i class="fa fa-user"></i> {$_MY_PROFILE}</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="cart-info">
                                                <a href="{$USR}settings"><i class="fa fa-cog"></i> {$_SETTINGS}</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="cart-info">
                                                <a href="{$USR}downloads"><i class="fa fa-download"></i> {$_DOWNLOADS}</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="cart-info">
                                                <a href="{$USR}deposit"><i class="fa fa-usd"></i> {$_MAKE_A_DEPOSIT}</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="cart-info">
                                                <a href="{$USR}deposit-history"><i class="fa fa-history"></i> {$_DEPOSIT_HISTORY}</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="cart-info">
                                                <a href="{$USR}statement"><i class="fa fa-book"></i> {$_STATEMENT}</a>
                                            </div>
                                        </li> </br>
                                        <li>
                                            <div class="cart-info">
                                                <a href="{$HOST}signout"><i class="fa fa-sign-out"></i> {$_SIGN_OUT}</a>
                                            </div>
                                        </li>
                                      </ul>
                                  </li>

                                 {if $role == 'admin'}
                                
                                  <li><a href="{$ADM}dashboard"><i class="fa fa-dashboard"></i> <strong>{$_ADMINISTRATION}</strong></a></li>
                                
                                 {elseif $role == 'user'}
                                
                                  <li><a href="{$HOST}contact"><i class="fa fa-envelope"></i> <strong>{$_CONTACT}</strong></a></li>
                                
                                 {/if}
                                
                                {/if}

                                {if $notlogged}
                                <li><a href="{$HOST}contact"> <strong>{$_CONTACT}</strong></a></li>

                                <li><a href="{$HOST}oauth"><i class="fa fa-user-plus"></i> {$_CREATE_AN_ACCOUNT}</a></li>
                                <li><button class="btn-filled" type="button" data-toggle="modal" data-target="#storola-modal"><i class="fa fa-user"></i>{$_SIGN_IN}</button></li>
                                <!-- Modal -->
                                <div class="modal fade" id="storola-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <div class="modal-logo">
                                                    <a href="{$HOST}"><img src="{$Logo}" alt="{$name}"></a>
                                                </div>
                                            </div>
                                   <div class="modal-body">
                                     <h3>{$_SIGN_IN_TO_YOUR_ACCOUNT}</h3>
                                  <form action="{$HOST}oauth" method="POST">
                                      
                                 <input type="hidden" name="csrf" value="{$csrfToken}">

                                   <div class="form-group">
                                        <label>{$_USERNAME}</label>
                                        <input type="text" name="username">
                                          </div>
                                          <div class="form-group">
                                        <label>{$_PASSWORD}</label>
                                        <input type="password" name="password">
                                   </div>
{if {$captcha_login}== '1'}

                            <div class="form-group">
                                <label for="password">{$_PROVE_YOUR_HUMAN}<span class="required">*</span></label>
											<div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{$reCAPTCHA_site_key}"></div>
									</div>
{/if}
                                  <div class="form-group">
                                      <button class="btn-filled" name="login" value="login">{$_SIGN_IN}</button>
                                   </div>
                                    </form>
                                   </div>
                                </div>
                            </div>
                         </div>
                                <!-- Modal End -->
                                
                                {else}
                                
                                <!-- User Balance -->
                                
                                <li><button class="btn-filled" type="button"><i class="fa fa-dollar"></i> {$balance}</button></li>
                                
                                {/if}

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- USER AREA END -->

        <!-- MAIN MENU AREA START -->
        <div class="main-menu-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-menu">
                            <nav>
                                <ul id="nav">
                                <li><a href="{$HOST}"><i class="fa fa-home"></i></a></li>
                                   <li><a href="{$HOST}category/all">{$_ALL_ITEMS}</a>
                                       <ul class="sub-menu">
                                        <li><a href="{$HOST}browse/popular"> {$_POPULAR_ITEMS}</a></li>
                                        <li><a href="{$HOST}browse/featured"> {$_FEATURED_ITEMS}</a></li>
                                        </ul>
                                    </li>
                                    
                                    
                  	{foreach from=$categories item=foo}
	
                                    <li><a href="{$HOST}category/{$foo['link']}">{$foo['name']}</a>
                    
                    {/foreach}


                                    </li>
                                    
                                  <li><a href="{$HOST}browse/freebee">{$_FREEBEE}</a></li>
                                </ul>
                            </nav>
                            <!-- Menu Item End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- MOBILE-MENU-AREA START -->
        <div class="mobile-menu-area">
            <div class="mobile-menu">
                <div class="m-logo">
                    <a href="{$HOST}"><img src="{$Logo}" alt="{$name}">
                    </a>
                </div>
                <nav id="dropdown">
                    <ul>
                    <li><a href="{$HOST}"><i class="fa fa-home"></i></a></li>
                    <li><a href="{$HOST}category/all">{$_ALL_ITEMS}</a>
                    <ul class="sub-menu">
                    <li><a href="{$HOST}browse/popular">{$_POPULAR_ITEMS}</a></li>
                          <li><a href="{$HOST}browse/featured">{$_FEATURED_ITEMS}</a></li>
                          </ul>
                        </li>
                        
                  	{foreach from=$categories item=foo}
	
                        <li><a href="{$HOST}category/{$foo['link']}">{$foo['name']}</a>
                    
                    {/foreach}                          
                          
                         <li><a href="{$HOST}browse/freebee">{$_FREEBEE}</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- MOBILE-MENU AREA END -->
    </header>
    <!-- HEADER END HERE -->