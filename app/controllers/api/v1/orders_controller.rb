class Api::V1::OrdersController < Spree::StoreController
  respond_to :json
  # before_filter :authenticate_user!
  # before_filter :authenticate_api
  # include Spree::Api::OrdersHelpers

  def show
    @order = current_order(create_order_if_necessary = true)
    respond_with @order, serializer: OrderSerializer
  end

  private

    # def find_order
    #   @order = Spree::Order.find_by!(number: params[:id])
    #   authorize! :update, @order, params[:order_token]
    # end

    # def authenticate_api
    #   find_order
    #   authorize! :update, @order, params[:token]
    # end

end
