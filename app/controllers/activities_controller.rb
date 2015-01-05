class ActivitiesController < ApplicationController
  before_action :logged_in

  def index
    @activities = Activity.all.where(user_id: @current_user)
  end

  def show
    @activity = Activity.find(params[:id])
    @new_item = @activity.items.build
    @items = @activity.items.all.order('id DESC')
  end

  def new
    @user = User.find(params[:user_id])
    @activity = @user.activities.new
  end

  def create

    @user = User.find(params[:user_id])
    @activity = @user.activities.new(activity_params)
    
    if @activity.save
      redirect_to user_activity_path(@activity.user_id, @activity)
    else
      render 'new'
    end    
  end

  def edit

    @activity = Activity.find(params[:id])

  end

  def update

    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)

      redirect_to user_activity_path(@activity.user_id, @activity)
    else
    
      render 'edit'
    end    
    
  end

  def destroy

    @activity = Activity.find(params[:id])

    @activity.destroy

    redirect_to user_activities_path(current_user)
    
  end


  def activity_params
    params.require(:activity).permit(:title, :activity_begin, :activity_end)
  end




end
