class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            set_session
            flash[:message] = "You are successfully Signed Up!"
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def show
        # TODO
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
end