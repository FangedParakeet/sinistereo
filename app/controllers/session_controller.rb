class SessionController < ApplicationController
  
  def signup 
  end
  
  def new
    User.create(params)
    redirect_to home_url
  end
  
  def login
    user = User.find_by_username(params[:username])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to home_url
      else
        flash[:notice] = "Wrong password!"
        redirect_to root_url
      end
    else
      flash[:notice] = "Username does not exist!"
      redirect_to root_url
    end  
  end
  
end