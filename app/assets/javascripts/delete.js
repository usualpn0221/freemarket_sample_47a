$(document).on('turbolinks:load', function() {
  var modal = '.delete-modal-wrapper'
  $(function() {
    $('.product__link__destroy').click(function() {
      $(modal).fadeIn();
    });

    $('.delete-modal-wrapper').click(function() {
      $(modal).fadeOut();
    });

    $('.delete-modal__under__left').click(function() {
      $(modal).fadeOut();
    });

    $('.delete-modal__upper').click(function() {
      $(modal).fadeOut();
    });
  });
});
