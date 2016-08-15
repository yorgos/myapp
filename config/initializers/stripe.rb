if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_oLqj7DKbAqQaiR5gFXzxiKc3',
    :secret_key => 'sk_test_02xZx7Yeqto8oGobjaf4ShTI'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
