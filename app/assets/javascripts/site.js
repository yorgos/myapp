// This file contains side-wide javascript

// If there are any other event listeners running on $(document) itself (e.g. $(document).on("click", ...) that one should not be inside the $(document).on('turbolinks ... function. Instead, it should be next to it (either below or above).

var refreshRating = function() {

  // Fadein-Fadeout
  $('.alert').delay(500).fadeIn('normal', function() {
     $(this).delay(1500).fadeOut();
  });

  // Raty Plugin
  $('.rating').raty({ path: '/assets', scoreName: 'comment[rating]'});

  $('.rated').raty({
    path: '/assets',
    readOnly:true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
};

$(document).on('turbolinks:load', function(){
  // Raty plugin from above
  refreshRating();

  // ElevateZoom Plugin
  $('.img-zoom').elevateZoom({
  zoomType: "inner",
  cursor: "crosshair"
  });
});
