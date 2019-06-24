class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :redirect_if_not_logged_in!

    private
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in!
        if !logged_in?
            flash[:message] = "You must be logged to complete this action"
            redirect_back fallback_location: root_path
        end
    end

    def set_session
        session[:user_id] = @user.id
    end

end
