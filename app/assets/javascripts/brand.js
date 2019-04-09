$(document).on('turbolinks:load', function() {
  var brand_accordion = '.inner-header__under__left__brand__text__accordion'
  $(function() {
    $('.inner-header__under__left__brand__text').hover(function() {
      $(brand_accordion).fadeIn();
    });
  });

  $('.header').hover(function() {
    $(brand_accordion).fadeOut();
  });
});

