/*=============================================
Booking Form
==============================================*/

$(function() {
    "use strict";
    if ( $('#video').length != 0 ) {
        // Pause video before the page is ready
        $('#video').get(0).pause();
    }
    // use jQuery Bootstrap Validation to validate the booking form input
    // $("input,textarea").jqBootstrapValidation({
    //     preventSubmit: true,
    //     submitError: function($form, event, errors) {
    //         // additional error messages or events
    //     },
    //     submitSuccess: function($form, event) {
    //         event.preventDefault(); // prevent default submit behaviour
    //         // get values from FORM
    //         var name            = $("input#first_name1").val() + ' ' + $("input#last_name1").val();
    //         var email           = $("input#email1").val();
    //         var phone           = $("input#phone1").val();
    //         var reservDate      = $('input#reserv_date1').val();
    //         var numGuests       = $('input#numb_guests1').val();
    //         var altDate         = $('input#alt_reserv_date1').val();
    //         var bookingTime     = $('input#time1').val();
    //         var message         = $("textarea#message").val();
    //         $.ajax({
    //             url: "././assets/php/mail/booking.php",
    //             type: "POST",
    //             data: {
    //                 name: name,
    //                 phone: phone,
    //                 email: email,
    //                 reservDate: reservDate,
    //                 numGuests: numGuests,
    //                 altDate: altDate,
    //                 bookingTime: bookingTime,
    //                 message: message
    //             },
    //             cache: false,
    //             success: function() {
    //                 // Success message
    //                 $('#success').html("<div class='alert alert-success'>");
    //                 $('#success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
    //                     .append("</button>");
    //                 $('#success > .alert-success')
    //                     .append("<strong>Your booking has been submitted. </strong>");
    //                 $('#success > .alert-success')
    //                     .append('</div>');

    //                 //clear all fields
    //                 $('#contactForm').trigger("reset");
    //             },
    //             error: function() {
    //                 // Fail message
    //                 $('#success').html("<div class='alert alert-danger'>");
    //                 $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
    //                     .append("</button>");
    //                 $('#success > .alert-danger').append("<strong>Sorry, the mail server is not responding. Please try again later!");
    //                 $('#success > .alert-danger').append('</div>');
    //                 //clear all fields
    //                 $('#contactForm').trigger("reset");
    //             },
    //         });
    //     },
    //     filter: function() {
    //         return $(this).is(":visible");
    //     },
    // });
});

/*============================================
Match height of header carousel to window height
==============================================*/
function matchCarouselHeight() {
    "use strict";
    // Adjust Header carousel .item height to same as window height
    var wH = $(window).height();
    $('#hero-carousel .item').css("height", wH);
}

/*====================================================================================================
Any JS inside $(window).load function is called when the window is ready and all assets are downloaded
======================================================================================================*/
$(window).load(function() {
    "use strict";

    // Remove loading screen when window is loaded after 1.5 seconds
    setTimeout(function() {
        $(window).trigger('resize');
        $('.loading-screen').fadeOut(); // fade out the loading-screen div
        if ( $('#video').length != 0 ) {
            // Play video once the page is fully loaded and loading screen is hidden
            $('#video').get(0).play();
        }
    },1500); // 1.5 second delay so that we avoid the 'flicker' of the loading screen showing for a split second and then hiding immediately when its not needed


});

/*==================================================
Any JS inside $(window).resize(function() runs when the window is resized
====================================================*/

$(window).resize(function() {
    "use strict";
    // Call the matchCarouselheight() function when the window is resized
    matchCarouselHeight();
});

/*==================================================
Any JS inside $(window).scroll(function() runs when the window is scrolled
====================================================*/

$(window).scroll(function() {
    "use strict";
    if ($(this).scrollTop() > 100) {
        $('.scroll-up').fadeIn();
    } else {
        $('.scroll-up').fadeOut();
    }
});

/*==================================================
Any JS inside $(function() runs when jQuery is ready
====================================================*/
$(function() {
    "use strict";
    // We use strict mode to encounter errors when using JSHint/JSLint

    // Call matchCarouselHeight() function
    matchCarouselHeight();

    //Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-shrink',
        offset: 85
    });

    // Smooth scrolling links - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);

        if ( $anchor.hasClass('header-scroll') ) {
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top
            }, 1500, 'easeInOutExpo');
        }
        else{
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top - 75
            }, 1500, 'easeInOutExpo');
        }
        event.preventDefault();
    });

    // Call the matchCarouselHeight() function when the carousel slide.bs event is triggered
    $('#hero-carousel').on('slide.bs.carousel', function () {
        matchCarouselHeight();
    });

    // Initialise WOW.js for section animation triggered when page scrolling
    new WOW().init();
});
