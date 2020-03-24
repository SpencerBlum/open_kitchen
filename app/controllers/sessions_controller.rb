class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(first_name: params[:user][:first_name],last_name: params[:user][:last_name])

    user = user.try(:authenticate, params[:user][:password])

    if user
      session[:user_id] = user.id
      @user = user
      redirect_to controller: 'welcome', action: 'home'
    else
      flash[:message] = 'User dose not exists'
      return redirect_to(controller: 'sessions', action: 'new') unless user
    end  
    # return redirect_to(controller: 'sessions', action: 'new') unless user

    # session[:user_id] = user.id

    # @user = user

    # redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
end