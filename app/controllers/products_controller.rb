class ProductsController < ApplicationController

 def index
    if params[:sport_id]
      @sports = Sport.find(params[:sport_id]).products
    else
      @sports = Sport.all
    end
    render json: @sports
  end
 
  def new
    @product = Product.new(sport_id: params[:sport_id])
  end

  def create 
     @product = Product.new(products_params)
     @product.user_id = current_user.id
        if @product.save
            redirect_to user_path(current_user)
        else
            render :new
        end
  end 

   private
 
    def products_params
        params.require(:product).permit(:product_name, :product_description, :sport_id)
    end

end
