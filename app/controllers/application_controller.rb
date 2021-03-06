class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in
  helper_method :current_user

  def current_user

    @current_user ||= User.find_by_id(session[:current_user]) if session[:current_user]
    
  end

  def logged_in

    unless current_user
      redirect_to root_path
    end
      
  end

end
