class ProductsController < ApplicationController

 def index
    if params[:user_id]
      @users = User.find(params[:user_id]).products
    else
      @users = User.all
    end
  end
 
  def new
    @product = Product.new(user_id: params[:user_id])
  end

end
