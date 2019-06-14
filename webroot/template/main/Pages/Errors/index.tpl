{include file="$TMP/Layout/header.tpl"}

   <!-- PAGE PROMO START HERE -->
    <div class="promo-area overly-bg" data-stellar-background-ratio=".9" style="background-image: url({$background_image})">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="promo-text">
                        <h4>{$_ERROR_CSRF}</h4>
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
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a>
                        </li>
                        <li class="breadcrumb-item"><a href="#">{$_ERROR}</a>
                        </li>
                        <li class="breadcrumb-item active">{$_ERROR_CSRF}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->

    <!-- CONTACT AREA START HERE -->
    <main class="error-area main-content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="error-wrap">
                        <h3 class="error-heading">{$_CSRF_MIS}</h3><hr>
                        <p>{$__CSRF_MIS}</p>
                        <form action="{$HOST}search" class="error-form">
                            <input type="text" placeholder="{$_SEARCH_YOUR_ITEMS}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- CONTACT AREA END HERE -->

{include file="$TMP/Layout/footer.tpl"}