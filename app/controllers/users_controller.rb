class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show, :destroy]
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
       @user = User.new(user_params)
       if @user.save
           flash[:success] = "Welcome to the Alpha-Blog #{@user.username}!"
           redirect_to articles_path
       else
           render 'new'
       end
    end
    
    def edit
        #uses set_user to find the correct user to update before going to update
    end
    
    def update
        if @user.update(user_params)
          flash[:success] = "User was successfully updated!"
          redirect_to article_path
        else
          render :edit
        end
    end
    
    def show
        #uses set_user to find the correct user to show
    end
    
    
    
    private
    def user_params
       params.require(:user).permit(:username, :email, :password) 
    end
    
    def set_user
       @user = User.find(params[:id]) 
    end
end