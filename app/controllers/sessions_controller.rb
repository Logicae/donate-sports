class SessionsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => [:create]

    def new
        @user = User.new
    end

    def create
        user = User.find_or_create_by(:provider => auth_hash[:provider], :uid => auth_hash[:uid]) do |user|
            user.name = auth_hash[:info][:name]
        end
        
        session[:user_id] = user.id
 
        redirect_to user_path(user)
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end

    private 

    def auth_hash
        request.env['omniauth.auth']
    end
end
