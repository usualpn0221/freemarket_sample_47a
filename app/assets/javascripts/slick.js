$(document).on('turbolinks:load', function() {
  $('.slides').slick({
    accessibility: true,
    autoplay: true,
    dots: true,
    arrows: true,
    centerMode: true,
    autoplaySpeed: 2000,
    speed: 1000,
    pauseOnDotsHover: true,
    fade: true,
    infinite: true,
    focusOnSelect: true,
    swipe: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    cssEase: 'ease-in-out',
    centerPadding:'5%',
    focusOnSelect:true,
    prevArrow: '<button class="slide-arrow prev-arrow"></button>',
    nextArrow: '<button class="slide-arrow next-arrow"></button>',
    dotsClass: 'slide-dots'
  });
});
