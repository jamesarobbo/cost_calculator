require 'rails_helper'

describe UsersController do

  describe "POST create" do

    it "creates a new user in the db" do
 
      expect{post :create, user: FactoryGirl.attributes_for(:user)}.to change(User, :count).by(1)

    end

  end

end