$(document).on('turbolinks:load', function() {
  $(function() {
    $('.product__link__destroy').click(function() {
      console.log('aiueo')
      $('.delete-modal-wrapper').fadeIn();
    });

    $('.delete-modal-wrapper').click(function() {
      $('.delete-modal-wrapper').fadeOut();
    });

    $('.delete-modal__under__left').click(function() {
      $('.delete-modal-wrapper').fadeOut();
    });

    $('.delete-modal__upper').click(function() {
      $('.delete-modal-wrapper').fadeOut();
    });
  });
});



