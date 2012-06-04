class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_user
  
  def find_user
    @user = User.find_by_id(session[:uid])    
  end
  
  def require_login
    if @user.blank?
      redirect_to root_url, notice: "You must be logged in!"
    end
  end
  
end
