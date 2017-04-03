class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        @user = User.find_by(email: params[:user][:email])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to users_path
        else 
            redirect_to login_path
        end 
    end

    def destroy
        if !session[:email].nil?
            session.clear
        end
        redirect_to login_path
    end
end
