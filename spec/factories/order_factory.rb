# Using Factory girl to define factories
FactoryGirl.define do

  factory :order do
    product
    user
    total 5100
  end

end
