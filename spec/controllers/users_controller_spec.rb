require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    # FIxture for creating test user
    # @user = User.create!(email: "test3@test.com", password: "password", first_name: "test3", last_name: "test3")

    # Using Factory instead of Fixture for creating test users
    @user = FactoryGirl.create(:user)
  end

  describe "GET #show" do

    context "User is logged in" do
      before do
        sign_in @user
      end

      it "loads correct user details" do
        get :show, id: @user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context "No user is logged in" do
      it "redirects to login" do
        get :show, id: @user.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end
