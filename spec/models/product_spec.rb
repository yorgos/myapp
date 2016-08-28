require 'rails_helper'

describe Product do

  context 'when the product has comments' do

    # Checks if the average_rating method for product comments works
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
      @product.comments.create!(rating: 1, user: @user, body: "I would not buy it again")
      @product.comments.create!(rating: 3, user: @user, body: "Good but the condition was not impresive as advertised")
      @product.comments.create!(rating: 5, user: @user, body: "Excelent bike, excelent service!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq (3)
    end


    # Checks if a new product with just a description (but not a name)
    # would go through the validations
    it 'is not valid' do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end

  end

end
