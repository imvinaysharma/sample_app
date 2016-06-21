class SessionsController < ApplicationController
  def new
  
  end
  
  
  def create
   user = User.find_by(email: params[:session][:email].downcase)
   
   if user && user.authenticate(params[:session][:password])
       log_in user
	 #  remember user
	 #  params[:session][:remember_me] == '1' ? remember(user) : forget(user)
	   redirect_back_or user
	 else
       flash.now[:danger] = "iiiiiiInvalid email/password combination"
       render 'new'
   end
  
  end
  
  def destroy
  log_out if logged_in?   # error in production ??
  
  #redirect_to @user
  redirect_to root_path
  end
  
  
  
end
