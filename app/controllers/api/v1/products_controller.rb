class Api::V1::ProductsController < ApplicationController
  respond_to :json
  # before_filter :authenticate_user!

  def index
    # @products = current_user.products
    @products = Spree::Product.find(:all)
    respond_with @products, each_serializer: ProductSerializer
  end

  def show
    # @products = current_user.products
    @product = Spree::Product.find(params[:id])
    respond_with @product, serializer: ProductSerializer
  end 

end
