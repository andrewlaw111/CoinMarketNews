$(window).scroll(function () {
        if ($(document).scrollTop() > $('h1').offset().top) {
            $('.navbar').addClass('white');
        }
        else {
            $('.navbar').removeClass('white');
        }
    }
);