class UsersController < ApplicationController
    def index
      if admin_user
      @users = User.all
      else
        flash[:message] = "You can not access admin menu"
        redirect_to controller: 'welcome', action: 'error'  
      end
    end

    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      if @user
        session[:user_id] = @user.id
        if @user.is_owner
          redirect_to controller: 'welcome', action: 'home' 
        else
          redirect_to controller: 'posts', action: 'index' 
        end   
      else
        flash[:message] = "Can't create user #{user_params[:first_name]}"
        redirect_to controller: 'users', action: 'new' 
        # redirect_to new_user_path 
      end
      # return redirect_to controller: 'users', action: 'new' unless @user.save
      # session[:user_id] = @user.id
      # redirect_to controller: 'welcome', action: 'home'  
    end
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
