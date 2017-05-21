class SportsController < ApplicationController

    def index 
        @sports = Sport.all 
        if !params[:sport].blank?
            @sort_by_sport = Sport.sort_by_sport
        else 
            @sports = Sport.all
        end 
    end 
    
    def new
        @sport = Sport.new 
    end 
    
    def show 
        @sport = Sport.find_by(id: params[:id])
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @sport }
        end
    end 

    def create
        @sport = Sport.find_or_create_by(name: sports_params[:name])
        @product = Product.new(product_name: sports_params[:products_attributes]["0"][:product_name], product_description: sports_params[:products_attributes]["0"][:product_description])
        @user = User.find_by(id: sports_params[:products_attributes]["0"][:user_id])
        @product.user_id = @user.id
        @sport.products << @product
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
