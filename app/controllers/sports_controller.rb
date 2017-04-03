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

    end 
    
    private 

    def sports_params 
        params.require(:sport).permit(:name)
    end 
    
end
