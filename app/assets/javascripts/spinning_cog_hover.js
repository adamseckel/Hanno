$(function() { 
  $(document).ready(function () {
    $('.icon-link a').hover(function () {
      $(this).addClass('fa-spin');
    }, function () {
      $(this).removeClass('fa-spin');
    });
  });
});