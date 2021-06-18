class Api::V1::SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:session][:username])

        if @user && @user.authenticate(params[:sesssion][:password])
            session[:user_id] = @user.id
            render json: UserSerializer.new(@user), status: ok
        else
            render json: {
                error: "Invalid username or password. Please try again."
            }
        end
    end

    def get_current_user
        if logged_in?
            render json: current_user
        else
            render json: {
                error: "Please log in."
            }
        end
    end
end
