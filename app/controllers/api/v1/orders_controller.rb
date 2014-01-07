class Api::V1::OrdersController < Spree::Api::BaseController
  respond_to :json
  # before_filter :authenticate_user!
  # before_filter :authenticate_api
  # include Spree::Api::OrdersHelpers



  def index
    @order = current_order
    respond_with @order
  end

  private

    def find_order
      @order = Spree::Order.find_by!(number: params[:id])
      authorize! :update, @order, params[:order_token]
    end

    # def authenticate_api
    #   find_order
    #   authorize! :update, @order, params[:token]
    # end

end
