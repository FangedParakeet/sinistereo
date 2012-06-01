class SessionsController < ApplicationController
  
  def signup 
  end
  
  def new
    if User.find_by_username(params[:username])
      flash[:notice] = "Sorry, username already exists!"
      redirect_to signup_url
    else
      user = User.create(params)
      if params[:artist][:is_artist] == "Yes"
        Artist.create(params, user)
      end
      session[:user_id] = user.id
      redirect_to home_url
    end
  end
  
  def login
    user = User.find_by_username(params[:username])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to home_url
      else
        flash[:notice] = "Username or password is incorrect!"
        render signup
      end
    else
      flash[:notice] = "Username or password is incorrect!"
      render signup
    end  
  end
  
  def destroy
    reset_session
    redirect_to root_url, notice: "Bye!"
  end
  
end
