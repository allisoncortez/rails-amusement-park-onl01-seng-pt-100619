class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
    
        # @user = User.find_or_create_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :happiness, :nausea, :height, :password, :password_confirmation)
    end
end
