class PaymentsController < ApplicationController

  # Set your secret key: remember to change this to your live secret key in production
  # See your keys here https://dashboard.stripe.com/account/apikeys

  # Stripe.api_key = Rails.configuration.stripe[:secret_key]

  # POST /payments/payment_created
  def create
    # Setting an instance variable that finds a particular product by reading the params of the hidden field in the stripe checkout button form
    @product = Product.find(params[:product_id])
    @user = current_user

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        # We can access the price of the product because we have set the instance variable above
        :amount => @product.price.to_i*100,
        :currency => "eur",
        :source => token,
        :description => params[:stripeEmail]
      )

    # Checking whether the payment has been successfull
    # .paid is a method provided by Stripe
    # If payment was successfull, the order is being created
    if charge.paid
      Order.create(
        :product_id => @product,
        :user_id => @user,
        :total => @product.price
      )
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    # render :create
    # redirect_to "payments/payment_created.erb"
    # another option is: redirect_to product_path(@product)

  end
end
