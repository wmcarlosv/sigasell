$(document).ready(function () {

    var mainNav = $('#main-nav'),
        slide_out_menu = $('#slide_out_menu'),
        $window = $(window);

    // Scroll Events
    $window.on('scroll', function (e) {

        var wScroll = $(this).scrollTop()

        // Activate menu
        if (wScroll > 20) {
            mainNav.addClass('active');
            slide_out_menu.addClass('scrolled');
        }
        else {
            mainNav.removeClass('active');
            slide_out_menu.removeClass('scrolled');
        }
        ;
        //Scroll Effects

    });

    // Navigation
    $('#navigation').on('click', function (e) {
        e.preventDefault();
        $(this).addClass('open');
        slide_out_menu.toggleClass('open');

        if (slide_out_menu.hasClass('open')) {
            $('.menu-close').on('click', function (e) {
                e.preventDefault();
                slide_out_menu.removeClass('open');
            })
        }
    });
    // Price Table
    var individual_price_table = $('#price_tables').find('.individual');
    var company_price_table = $('#price_tables').find('.company');


    $('.switch-toggles').find('.individual').addClass('active');
    $('#price_tables').find('.individual').addClass('active');

    $('.switch-toggles').find('.individual').on('click', function () {
        $(this).addClass('active');
        $(this).closest('.switch-toggles').removeClass('active');
        $(this).siblings().removeClass('active');
        individual_price_table.addClass('active');
        company_price_table.removeClass('active');
    });

    $('.switch-toggles').find('.company').on('click', function () {
        $(this).addClass('active');
        $(this).closest('.switch-toggles').addClass('active');
        $(this).siblings().removeClass('active');
        company_price_table.addClass('active');
        individual_price_table.removeClass('active');
    });


    // Wow Animations
    wow = new WOW(
        {
            boxClass: 'wow',      // default
            animateClass: 'animated', // default
            offset: 0,          // default
            mobile: true,       // default
            live: true        // default
        }
    )
    wow.init();


    // Menu For Xs Mobile Screens
    if ($(window).height() < 450) {
        slide_out_menu.addClass('xs-screen');
    }

    $(window).on('resize', function () {
        if ($(window).height() < 450) {
            slide_out_menu.addClass('xs-screen');
        } else {
            slide_out_menu.removeClass('xs-screen');
        }
    });
    // Magnific Popup
    $(".lightbox").magnificPopup();

    /* ========================================================== */
    /*   SmoothScroll                                             */
    /* ========================================================== */
    $("#main-nav li a, a.scrool").click(function (e) {

        var full_url = this.href;
        var parts = full_url.split("#");
        var trgt = parts[1];
        var target_offset = $("#" + trgt).offset();
        var target_top = target_offset.top;

        $('html,body').animate({scrollTop: target_top - 76}, 1000);
        return false;

    });
});

/* ========================================================== */
/*   menu                                        */
/* ========================================================== */

$("#main-nav .nav-active li a").click(function () {
    $(this).parent().addClass('active').siblings().removeClass('active');

});