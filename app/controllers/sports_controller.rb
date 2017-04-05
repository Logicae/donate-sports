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
        binding.pry
        @sport = Sport.new(sports_params)
        redirect_to user_path(current_user)
        # else
        #     redirect_to new_user_path
        # end
    end 
    
    private 

    def sports_params 
        params.require(:sport).permit(:name, product_ids:[], products_attributes: [:product_name, :product_description, :user_id])
    end 
    
end
