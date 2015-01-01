class SessionsController < ApplicationController

  def new
    
  end

  def create

    @username = params[:login][:username]
    @password = params[:login][:password]

    @user = User.find_by_username(@username)

    if @user && @user.authenticate(@password)

      session[:current_user] = @user.id

      redirect_to user_activities_path(@user)

    else

      redirect_to root_path
    
    end  

  end


  def destroy

    reset_session
    redirect_to root_path
    
  end


end
