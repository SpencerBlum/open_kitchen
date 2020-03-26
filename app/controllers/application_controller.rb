class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :current_user

    def current_user
        @user = (User.find_by(id: session[:user_id]) || User.new)
    end

    def logged_in?
        current_user.id != nil
    end

    def require_logged_in
        if !logged_in?
            flash[:message] = 'Login needed'
            redirect_to(controller: 'sessions', action: 'new') unless logged_in?
        end
        # return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end

    def admin_user
        !!current_user.is_owner
    end
end
