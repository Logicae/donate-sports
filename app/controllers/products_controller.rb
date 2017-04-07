class ProductsController < ApplicationController

 def index
    if params[:sport_id]
      @sports = Sport.find(params[:sport_id]).products
    else
      @sports = Sport.all
    end
  end
 
  def new
    @product = Product.new(user_id: params[:user_id])
  end

#   def create 
#      @product = Product.new(products_params)
#         if @product.save
#             redirect_to user_path(current_user)
#         else
#             render :new
#         end
#   end 

#   private
 
#     def products_params
#         params.require(:product).permit(:product_name, :products_description)
#     end

end
