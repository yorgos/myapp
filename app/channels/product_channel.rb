# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # this chanel streams updates from all products to all products
    # stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data)
    # Default method provided by ActionCable to stop all previous streams, to make sure a user only streams from a single channel
    stop_all_streams

    # Stream from a channel that's specific to one of the products
    stream_for data["product_id"]
  end

end
