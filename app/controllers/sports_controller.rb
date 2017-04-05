class SportsController < ApplicationController

    def index 
        @sports = Sport.all 
        @sort_by_sport = self.sort_by_sport
    end 
    
    def new
        @sport = Sport.new 
    end 
    
    def show
    end 

    def create
        @sport = Sport.new(sports_params)
        if @sport.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end 
    
    private 

    def sports_params 
        params.require(:sport).permit(:name, product_ids:[], products_attributes: [:product_name, :product_description, :user_id])
    end 
    
end
