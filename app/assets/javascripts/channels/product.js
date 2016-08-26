App.product = App.cable.subscriptions.create("ProductChannel", {

  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();

    $('.product-reviews-wrapper').prepend(data.comment);
    refreshRating();
  },

  listen_to_comments: function() {
    // ActionCable provides a function to call the methods of the ActionCable backend - including the one you just wrote. You call it with App.product.perform(). App is what you defined inside your application.js before. App.product represents the subscriber object for the product channel. As long as you're inside the object of the create() function, you can also simply refer to App.product as this. perform() expects at least one argument. The first argument is the name of the method you want to call. In this case, it's listen. Any additional arguments are going to be values for the arguments of the listen method. Since we defined a single argument for the listen method, we will add an object as second argument of the perform() function.
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }

});

// This will make sure that listen_to_comments() is called every time the user loads a new page.
$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});
