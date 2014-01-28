class Api::V1::OrdersController < Spree::StoreController
  respond_to :json

  def show
    respond_with order, serializer: OrderSerializer
  end

  def update

    if order.update_attributes(order_params)

      if order.completed?
        order.process_payments!
      end

      respond_with(order) do |format|
        format.json { render json: order, :status => :created, serializer: OrderSerializer }
      end

    else
      render json: {error: "NO SAVE"}
    end

  end

  private

    def order
      @order = current_order(create_order_if_necessary = true)
    end

    def order_params
      params.require(:order).permit(:name, :number, :email, :state, :item_total, :completed_at,
        line_items_attributes: [:id, :quantity, :variant_id, :_destroy],
        ship_address_attributes: [:firstname, :lastname, :address1, :address2, :city, :zipcode, :phone, :country_id, :state_id], 
        payments_attributes: [:amount, :payment_method_id, source_attributes: [:last_digits, :month, :year, :cc_type, :gateway_payment_profile_id]],
      )
    end

end