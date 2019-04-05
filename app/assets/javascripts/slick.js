$(document).ready(function(){
  $('.slides').slick({
    accessibility: true,
    autoplay: true,
    dots: true,
    arrows: true,
    centerMode: true,
    autoplaySpeed: 3000,
    speed: 3000,
    pauseOnDotsHover: true,
    fade: true,
    infinite:true,
    focusOnSelect:true,
    swipe:true,
    slidesToShow: 1,
    slidesToScroll: 1,
  });
});
