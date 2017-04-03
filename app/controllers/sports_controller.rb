class SportsController < ApplicationController

    def index 
        @sports = Sport.all 
    end 
    
    def new
        @sport = Sport.new 
    end 
    
    def show
    end 

    def create
        @sport = Sport.new(sports_params)
        @sport.save
        redirect_to user_path(current_user)
        # else
        #     redirect_to new_user_path
        # end
    end 
    
    private 

    def sports_params 
        params.require(:sport).permit(:name)
    end 
    
end
