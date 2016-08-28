require 'rails_helper'

describe Comment do

  context "comment is missing requirements" do

    before do
      @comment = FactoryGirl.create(:comment)
    end

    it "has no content" do
      @comment.body = nil
      expect(@comment).to_not be_valid
    end

    it "has no rating" do
      @comment.rating = nil
      expect(@comment).to_not be_valid
    end

  end
end
