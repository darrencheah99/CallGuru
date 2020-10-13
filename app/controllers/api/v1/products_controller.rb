class Api::V1::ProductsController < ActionController::Base
  def index
    @products = Product.all
    render json: @products
  end
end
