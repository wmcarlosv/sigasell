    <!-- FOOTER AREA START HERE -->
    <footer class="footer-area">
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-sm-4">
                        <div class="footer-widget">
                            <h3 class="footer-title">{$_MARKET} </h3>
                            <ul class="our-company">
                           <span class="community-count">
                           <li><strong>{$user_n}</strong>{$_MEMBERS}</li>
                           <li><strong>{$sales_n}</strong>{$_SALES}</li>
                           <li><strong>{$num_items}</strong>{$_FILES}</li>
                           </span>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-4">
                        <div class="footer-widget support-pd">
                            <h3 class="footer-title">{$_SUPPORT}</h3>
                            <ul class="our-support">
                             <li><a href="{$HOST}contact">{$_CONTACT}</a></li>
                  	{foreach from=$protected item=foo}
	                          <li><a href="{$HOST}page/{$foo['id']}/">{$foo['title']}</a></li>
                    {/foreach}
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2 col-md-offset-1 col-sm-4">
                        <div class="footer-widget">
                            <h3 class="footer-title">{$_CATEGORIES}</h3>
                            <ul class="product-list">
                  	{foreach from=$categories item=foo}
                                    <li><a href="{$HOST}category/{$foo['link']}">{$foo['name']}</a>
                    {/foreach}
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 col-md-offset-1 col-sm-3">
                        <div class="footer-widget">
                            <h3 class="footer-title">{$_MORE_INFO}</h3>
                            <ul class="our-company">
                  	{foreach from=$pages item=foo}
	                          <li><a href="{$HOST}page/{$foo['id']}/">{$foo['title']}</a></li>
                    {/foreach}
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-buttom">
            <div class="container">
                <div class="row">
                    <div class="col-sm-5 col-md-6 col-xs-12">
                        <div class="copy-right">
                        <p>{$_COPYRIGHT} {$date} © {$name} {$_ALL_RIGHTS_RESERVED}. </p>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-7 col-xs-12">
                        <div class="footer-social">
                            <ul>
                               {if !empty($fb_link)}<li class="fb"><a href="{$fb_link}"><i class="fa fa-facebook-square"></i>{$_FACEBOOK}</a></li>{/if}
                               {if !empty($go_link)}<li class="gp"><a href="{$go_link}"><i class="fa fa-google-plus"></i>{$_GOOGLE}</a></li>{/if}
                               {if !empty($pin_link)}<li class="be"><a href="{$pin_link}"><i class="fa fa-pinterest"></i>{$_PINTEREST}</a></li>{/if}
                               {if !empty($tweet_link)}<li class="tw"><a href="{$tweet_link}"><i class="fa fa-twitter"></i>{$_TWITTER}</a></li>{/if}
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- FOOER AREA END HERE -->

    <!-- jQuery Min
    ==============================================================-->
    <script src="{$AST}user/jquery.min.js"></script>

    <!-- Bootstrap Js 
    ==============================================================-->
    <script src="{$AST}user/bootstrap.min.js"></script>

    <!-- Meanmenu Js 
    ==============================================================-->
    <script src="{$AST}user/jquery.meanmenu.js"></script>

    <!-- Isotope Js 
    ==============================================================-->
    <script src="{$AST}user/isotope.pkgd.min.js"></script>

    <!-- Steller Js 
    ==============================================================-->
    <script src="{$AST}user/jquery.stellar.min.js"></script>

    <!-- Simple-sticker Js 
    ==============================================================-->
    <script src="{$AST}user/jquery.simpleTicker.js"></script>
    
    <!-- Syotimer Js 
    ==============================================================-->
    <script src="{$AST}user/jquery.syotimer.min.js"></script>

    <!-- Owl Carosel Js 
    ==============================================================-->
    <script src="{$AST}user/owl.carousel.min.js"></script>

    <!-- Custom Js 
    ================================================================-->
    <script src="{$AST}user/main.js"></script>
</body>

</html>