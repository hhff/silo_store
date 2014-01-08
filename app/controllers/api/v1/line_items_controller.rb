class Api::V1::LineItemsController < Spree::StoreController
  respond_to :json

  def create
    @order = current_order(create_order_if_necessary = true)
    authorize! :update, @order, params[:order_token]

    variant = Spree::Variant.find(params[:line_item][:variant_id])
    @line_item = @order.contents.add(variant, params[:line_item][:quantity])
    if @line_item.save
      @order.ensure_updated_shipments

      respond_with(@order) do |format|
        format.html { render json: current_order, serializer: OrderSerializer }
        format.json { render json: current_order, serializer: OrderSerializer }
      end

    else
      invalid_resource!(@line_item)
    end
  end

  private

    def order
      @order = current_order(create_order_if_necessary = true)
    end

    def line_item_params
      params.require(:line_item).permit(:quantity, :variant_id)
    end

end
