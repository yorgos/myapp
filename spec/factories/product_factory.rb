# Using Factory girl to define factories
FactoryGirl.define do

  factory :product do
    name "test-bike"
    image_url "http://www.testurl.com"
    price 4550
    colour "red"
    description "test-bike-description"
  end
end
