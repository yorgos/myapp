
// this function is used so that the alerts and notices to the user are fading in and out smoothly
$(function() {
   $('.alert').delay(500).fadeIn('normal', function() {
      $(this).delay(1500).fadeOut();
   });
});
