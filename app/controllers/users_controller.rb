class UsersController < ApplicationController

    def new 
        @user = User.new
    end 
    

    def create
        @user = User.new(user_params)
        if @user.save
            session[:id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    private 

    # def user_params
    #     (email: params["email"], password: params[:password], params[:password_confirmation])
    # end 
    

end
