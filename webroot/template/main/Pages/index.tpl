{include file="$TMP/Layout/header.tpl"}

   <!-- ABOUT PROMO START HERE -->
    <div class="promo-area overly-bg" data-stellar-background-ratio=".9" style="background-image: url({$background_image})">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="promo-text">
                        <h4>{$title}</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ABOUT PROMO END HERE -->

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="#">{$_PAGES}</a></li>
                        <li class="breadcrumb-item active">{$title}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->

    <!-- TEAM AREA START HERE -->
    <section class="team-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="section-intro">
                        <h3 class="section-title">{$title}</h3>
                        <p>{$content}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- TEAM AREA END HERE -->
    
{include file="$TMP/Layout/footer.tpl"}