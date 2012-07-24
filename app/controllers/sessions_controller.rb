class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    if (user = User.find_by_email(params[:email])) && user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      flash[:notice] = "Sign in unsuccessful. Please try again."
    end
    
    redirect_to root_url
  end
  
  def destroy
    reset_session
    redirect_to root_url
  end
end