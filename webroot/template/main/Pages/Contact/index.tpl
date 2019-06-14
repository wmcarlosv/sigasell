{include file="$TMP/Layout/header.tpl"}

   <!-- PAGE PROMO START HERE -->
    <div class="promo-area overly-bg" data-stellar-background-ratio=".9" style="background-image: url({$background_image})">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="promo-text">
                        <h4>{$_CONTACT_US}</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- PAGE PROMO END HERE -->

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="#">{$_PAGES}</a></li>
                        <li class="breadcrumb-item active">{$_CONTACT_US}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->


   <!-- CONTACT AREA START HERE -->
    <main class="contact-area main-content">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                   {if $sent}<div class="alert alert-success">Your Message Was Sent!</div>{/if}
                   {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
                   {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                    <div class="contact-wrap">
                        <h3 class="contact-heading">{$_CONTACT_FORM}</h3>
                        <p>{$__CONTACT_FORM}</p>
                        <div id="form-messages"></div>
                        
                            <form id="ajax-contact" method="POST" action="{$HOST}contact">
                                    <input type="hidden" name="csrf" value="{$csrfToken}" />
                                <div class="input_top">
                                    <input type="text" class="form_control" id="name" name="name" placeholder="{$_EMAIL_ADDRESS}" required/>
                                </div>
                                
                                <div class="input_top">
                                    <input type="email" class="form_control" name="email" placeholder="{$_YOUR_NAME}" required/>
                                </div>                         
                                <div class="textarea">
                                    <textarea id="message"  class="form_control" name="message" placeholder="{$_YOUR_MESSAGE}" required></textarea>
                                </div>
                                <button type="submit" id="submit" name="contact" class="custom-btn">{$_SEND_MESSAGE}</button>
                            </form>
                            
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- CONTACT AREA END HERE -->
    
{include file="$TMP/Layout/footer.tpl"}