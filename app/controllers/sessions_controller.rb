class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth_hash = request.env["omniauth.auth"] 
            user = User.create_with_omniauth(auth_hash)
            session[:user_id] = user.id    
            redirect_to user_path(user)
        elsif
            user = User.find_by(email: params[:user][:email])
            if user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            end  
        else 
            redirect_to login_path
        end
    end
    
    def auth
        request.env['omniauth.auth']
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end
end
