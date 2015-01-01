require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do

  describe "POST create" do
    before(:each) do
      @activity = FactoryGirl.create(:activity)
      session[:current_user] = @activity.user_id  
    end

    it "creates a new item" do
      
      expect{
        post :create, {user_id: @activity.user_id, activity_id: @activity.id, item: FactoryGirl.attributes_for(:item, activity_id: @activity.id)}
        }.to change(Item, :count).by(1)
    end

  end

end
