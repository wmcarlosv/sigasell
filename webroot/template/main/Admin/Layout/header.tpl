<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="//code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,400italic,500,700">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="{$AST}admin/css/vendor.min.css">
<link rel="stylesheet" href="{$AST}admin/css/elephant.min.css">
<link rel="stylesheet" href="{$AST}admin/css/private/application.min.css">
<link rel="stylesheet" href="{$AST}admin/css/private/side.css">
<link rel="icon" href="{$Favicon_url}">

</head>

<body class="layout layout-header-fixed">

<div class="layout-header">
    <div class="navbar navbar-default">
        <div class="navbar-header" style="background-color: #00a65a; color: #00a65a;">
            <a class="navbar-brand navbar-brand-center" href="{$HOST}">
                <img class="navbar-brand-logo" src="{$Logo}">
            </a>
            <button class="navbar-toggler visible-xs-block collapsed" type="button" data-toggle="collapse"
                    data-target="#sidenav">
                <span class="sr-only">Toggle navigation</span>
                <span class="bars">
                    <span class="bar-line bar-line-1 out"></span>
                    <span class="bar-line bar-line-2 out"></span>
                    <span class="bar-line bar-line-3 out"></span>
                </span>
                <span class="bars bars-x">
                    <span class="bar-line bar-line-4"></span>
                    <span class="bar-line bar-line-5"></span>
                </span>
            </button>
            <button class="navbar-toggler visible-xs-block collapsed" type="button" data-toggle="collapse"
                    data-target="#navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="arrow-up"></span>
                <span class="ellipsis ellipsis-vertical"></span>
            </button>
        </div>
        <div class="navbar-toggleable">
            <nav id="navbar" class="navbar-collapse collapse" style="background-color: #00a65a; color: #00a65a;">
                <form id="command" action="{$HOST}signout" method="POST">

                    <ul class="nav navbar-nav navbar-right" style="background-color: #00a65a; color: #00a65a;">
                        <li class="visible-xs-block">
                            <h4 class="navbar-text text-center">
                                Hello, Admin!
                                <input type="submit" class="btn btn-info" style="padding: 14px 18px;"
                                       value="Logout"/>
                            </h4>
                        </li>

                        <style>
                            .icon-small {
                                height: 18px;
                                margin: 0;
                                padding: 0;
                            }
                        </style>

                        <li>
                            <a href="#" data-toggle="dropdown" style="background-color: #00a65a; color: #ffffff;">
                                <div class="fa fa-language"></div>
                                <span id="lanNavSel">Language</span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a id="navEN" href="#" class="language">
                                        <img id="imgNavEN" src="{$AST}admin/images/en.gif" class="icon-small">
                                        <span id="lanNavEN">English</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="hidden-xs" style="background-color: #00a65a; color: #00a65a;">
                            <a href="dashboard">
                             Hello, <b>Admin!</b>
                            </a>
                        </li>

                        <li class="hidden-xs">
                            <a href="{$HOST}" style=" background-color: #000000;"><div class="fa fa-user "></div> 
                                 Client Area
                            </a>
                        </li>
                        
                        <li class="hidden-xs">
                                  <a href="{$HOST}signout"><div class="fa fa-sign-out"></div> 
                                 Signout
                                 </a>
                          
                        </li>
                        
                    </ul>
                </form>
            </nav>
        </div>
    </div>
</div>
<div class="layout-main">

<div class="layout-sidebar">
    <div class="layout-sidebar-backdrop"></div>
    <div class="layout-sidebar-body">
        <nav id="sidenav" class="sidenav-collapse collapse">
            <ul class="sidenav">
                <li class="sidenav-heading"><div class="fa fa-dashboard"></div> Statistics</li>
                <li class="sidenav-item">
                    <a href="{$ADM}dashboard">
                        <span class="sidenav-label"><div class="fa fa-dashboard"></div> Dashboard</span>
                    </a>
                </li>
                </li>
                <li class="sidenav-item">
                    <a href="{$ADM}items/index">
                        <span class="sidenav-label"><div class="fa fa-cubes"></div> Admin Items </span>
                    </a>
                </li>
                <li class="sidenav-item">
                    <a href="{$ADM}categories/index">
                        <span class="sidenav-label"><div class="fa fa-sitemap"></div> Categories</span>

                    </a>
                </li>
                <li class="sidenav-item">
                    <a href="{$ADM}sales/index">
                        <span class="sidenav-label"><div class="fa fa-shopping-cart"></div> Sales</span>

                    </a>
                </li>

                <li class="sidenav-heading"><div class="fa fa-line-chart"></div> Users Area</li>
                <li class="sidenav-item">
                <li class="sidenav-item">
                    <a href="{$ADM}users/index">
                        <span class="sidenav-label"><div class="fa fa-users"></div> Users</span>
                    </a> 
                    </li>
                <li class="sidenav-item">
                    <a href="{$ADM}sales/downloads">
                        <span class="sidenav-label"><div class="fa fa-download"></div> Downloads </span>
                    </a>
                <li class="sidenav-item">
                    <a href="{$ADM}invoices/index">
                        <span class="sidenav-label"><div class="fa fa-bank"></div> Invoices</span>
                    </a>
                <li class="sidenav-item">
                    <a href="{$ADM}invoices/transactions">
                        <span class="sidenav-label"><div class="fa fa-history"></div> Transactions</span>
                    </a>
                <li class="sidenav-heading"><div class="fa fa-info-circle"></div> Site Info</li>

               <li class="sidenav-item">
                    <a href="{$ADM}testimonials/index">
                        <span class="sidenav-label"><div class="fa fa-quote-left"></div> Testimonials</span>
                    </a>
                </li>
               <li class="sidenav-item">
                    <a href="{$ADM}announcements/index">
                        <span class="sidenav-label"><div class="fa fa-bullhorn"></div> Announcements</span>
                    </a>
                </li>
               <li class="sidenav-item">
                    <a href="{$ADM}pages/index">
                        <span class="sidenav-label"><div class="fa fa-files-o"></div> Pages</span>
                    </a>
                </li>
                
                <li class="sidenav-heading"><div class="fa fa-gears"></div> Settings</li>
                <li class="sidenav-item">
                    <a href="{$ADM}options/themes">
                         
                        <span class="sidenav-label"><div class="fa fa-paint-brush"></div> Themes</span>
                    </a>
                </li>
                <li class="sidenav-item">
                    <a href="{$ADM}options/index">
                         
                        <span class="sidenav-label"><div class="fa fa-cog"></div> Options</span>
                    </a>
                </li>
                <li class="sidenav-item">
                    <a href="{$ADM}options/email">
                         
                        <span class="sidenav-label"><div class="fa fa-envelope"></div> Email</span>
                    </a>
                </li>
                <li class="sidenav-item">
                    <a href="{$ADM}options/payment">
                         
                        <span class="sidenav-label"><div class="fa fa-cog"></div> Payment Methods</span>
                    </a>
                </li>

            </ul>
        </nav>
    </div>
</div>