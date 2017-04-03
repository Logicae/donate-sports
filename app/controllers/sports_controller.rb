class SportsController < ApplicationController

    def index 
        @sports = Sport.all 
    end 
    
    def show
    end 

    def create
    end 
    
end
