class SessionsController < ApplicationController
   
   def new
       
   end
   
   def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
           flash[:success] = "Successfully logged in!"
           session[:user_id] = user.id
           redirect_to user_path(user)
       else
           flash.now[:danger] = "Email/password incorrect"
          render 'new' 
       end
   end
   
   def destroy
       session[:user_id] = nil
       flash[:success] = "Successfully logged out!"
       redirect_to root_path
   end
    
end