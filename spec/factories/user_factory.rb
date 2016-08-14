# Using Factory girl to define factories
FactoryGirl.define do

  # Sequence for generating user emails
  # every time the Factory is used it will use a new email
  # examples: user1@example.com, user2@example.com etc.
  sequence(:email) { |n| "user#{n}@example.com" }

  # I would have to write:
  # factory :user, class: User do
  # in order to specify which class (model) this factory is using.
  # but FactoryGirl is smart enough to "guess" the User model if I name the factory :user.
  factory :user do
    email # No need to initialize an email as it is handled by the sequesnce above
    password "password"
    first_name "test3"
    last_name "test3"
    admin false
  end

  factory :admin, class: User do
    email # No need to initialize an email as it is handled by the sequesnce above
    password "password"
    first_name "Admin"
    last_name "User"
    admin true
  end


end
