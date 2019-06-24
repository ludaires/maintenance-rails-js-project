class SessionsController < ApplicationController

    def new

    end

    def create
       @user = User.find_by(username: params[:username])
       if @user  && @user.authenticate(params[:password])
        set_session
        redirect_to user_path(@user)
       else
        flash[:message] = "Something went wrong!"
        redirect_to root_path
       end
    end

    def create_from_omniauth
       @user = User.create_from_google(auth)
        set_session
        if logged_in?
            flash[:message] = "Successfully authenticated via Google!"
            redirect_to user_path(@user)
        else
            flash[:message] = "Something went wrong. Try again"
            redirect_to root_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end