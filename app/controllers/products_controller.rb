class ProductsController < ApplicationController

 def index
    if params[:user_id]
      @users = User.find(params[:user_id]).products
    else
      @users = User.all
    end
  end
 
  def new
    @sport = Sport.new
    @product = Product.new(user_id: params[:user_id])
  end

  def create 
     @product = Product.new(products_params)
        if @product.save
            redirect_to user_path(current_user)
        else
            render :new
        end
  end 

  private
 
    def products_params
        params.require(:product).permit(:product_name, :product_description, :user_id, sport_ids:[], sports_attributes: [:name])
    end

end
