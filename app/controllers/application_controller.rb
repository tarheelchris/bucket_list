class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_user
  
  def current_user
    if session[:uid].present?
      @current_user = User.find_by_id(session[:uid])
    end
  end
  
  def require_correct_user
    if List.find_by_id(params[:id])
      list = List.find_by_id(params[:id])
        if list.user != @current_user
        redirect_to lists_url, notice: "Nice Try"
        end
    else
      redirect_to new_user_url, notice: "Bucketlist does not exist" 
    end 
  end
  
  def require_sign_in
    @user = User.find_by_id(session[:uid])
    if @user.nil?
      redirect_to new_session_url, notice: "Please sign in first"
    end
  end
end
