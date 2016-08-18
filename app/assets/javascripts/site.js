// This file contains side-wide javascript

// If there are any other event listeners running on $(document) itself (e.g. $(document).on("click", ...) that one should not be inside the $(document).on('turbolinks ... function. Instead, it should be next to it (either below or above).

$(document).on('turbolinks:load', function(){

  // Raty Plugging
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]'} );

  $('.rated').raty( { path: '/assets', readOnly:true, score: function() {
    return $(this).attr('data-score');
    }
  });

  // ElevateZoom Pluggin
  $('.img-zoom').elevateZoom({
  zoomType: "inner",
  cursor: "crosshair"
  });

});
