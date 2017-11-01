$( document ).ready(function() {
  $( ".c-team" ).click(function() {
    $('.c-team').removeClass('c-team--active');
    $(this).addClass('c-team--active');
  });
});
