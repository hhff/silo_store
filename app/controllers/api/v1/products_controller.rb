class Api::V1::ProductsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    respond_with current_user.products
  end
end
