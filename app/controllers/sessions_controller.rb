class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if request.env['omniauth.auth']
            @user = User.create_with_omniauth(request.env['omniauth.auth'])
            session[:user_id] = @user.id    
            redirect_to user_path(@user)
        else
            @user = User.find_by(email: params[:user][:email])
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                redirect_to login_path
            end  
        end
    end
    
    def auth
        binding.pry
        request.env['omniauth.auth']
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end
end
