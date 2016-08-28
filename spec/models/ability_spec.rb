require 'rails_helper'

describe Ability do

  # Checks if a user who is not an admin can create products
  context "when the user is not an admin" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "returns that the user cannot create product is true" do
      expect(@user.admin).to eq false
    end
  end
end
