require 'rails_helper'

RSpec.describe ActivitiesController, :type => :controller do

  describe "GET index" do

    before(:each) do
      @activity = FactoryGirl.create(:activity)
    end

    context 'when user is logged in' do

      before(:each) do
        session[:current_user] = @activity.user_id
      end

      it "shows index page" do
        get :index, {user_id: @activity.user_id}
        expect(response).to be_success      
      end

    end

    context 'when user is anonymous' do

      it "redirects to root" do
        get :index, {user_id: @activity.user_id}
        expect(response).to redirect_to root_path

      end

    end

  end

  describe "GET show" do

    before(:each) do
      @activity = FactoryGirl.create(:activity)
      session[:current_user] = @activity.user_id
    end

    it "renders show page" do
      get :show, {user_id: @activity.user_id, id: @activity}
      expect(response).to render_template :show
    end

  end


end