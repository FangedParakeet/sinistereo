class SessionsController < ApplicationController
  
  
  
  def new
    respond_to do |format|
      format.js
      format.html
    end
  end
 
  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:uid] = user.id
        redirect_to root_url, notice: "Welcome!"
      else
        flash[:notice] = "Try again"
        render 'new'
      end
    else
      flash[:notice] = "Try again"
       render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Bye!"
  end
  
end
