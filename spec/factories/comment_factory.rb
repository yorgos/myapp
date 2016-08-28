# Using Factory girl to define factories
FactoryGirl.define do

  factory :comment do
    body "Test"
    rating 3
    user
    product
  end
end
