require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "POST create" do 

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "creates a session for existing user" do

      post :create, login: {username: @user.username, password: @user.password}

      expect(response).to redirect_to user_activities_path(@user)

    end

  end


  describe "DELETE destroy" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "destroys the session" do

      post :create, login: {username: @user.username, password: @user.password}

      delete :destroy
      expect(session[:current_user]).to eq nil

    end

  end

end
