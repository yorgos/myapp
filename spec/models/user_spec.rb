require 'rails_helper'

describe User, :type => :model do
  it "should not validate users without an email address" do
    # Using `build` we avoid saving anything to the db, the user creating happens on the fly
    @user = FactoryGirl.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end
end
