class UsersController < ApplicationController

    def new 
        @user = User.new
    end 
    
    def create
        if auth_hash = request.env["omniauth.auth"] 
            @user = User.find_or_create_by_onmiauth(auth_hash)
            session[:user_id] = user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(email: params[:email])
            if @user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    end

    def show 
        @user = User.find_by(id: params[:id])
    end 
    
    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 
    

end
