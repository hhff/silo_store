class Api::V1::LineItemsController < Spree::StoreController
  respond_to :json

  def create
    # @order = current_order(create_order_if_necessary = true)
    # authorize! :update, @order, params[:order_token]

    variant = Spree::Variant.find(params[:line_item][:variant_id])

    @line_item = order.contents.add(variant, params[:line_item][:quantity])
    
    if @line_item.save
      @order.ensure_updated_shipments

      respond_with(@order) do |format|
        format.json { render json: current_order, serializer: OrderSerializer }
      end

    else
      invalid_resource!(@line_item)
    end
  end

  def update
    @line_item = order.line_items.find(params[:id])
    @line_item.quantity = params[:line_item][:quantity]

    if @line_item.save
      @order.ensure_updated_shipments

      respond_with(@order) do |format|
        format.json { render json: current_order, serializer: OrderSerializer }
      end

      # respond_with(@line_item, default_template: :show)

    else
      invalid_resource!(@line_item)
    end
  end

  # def destroy
  #   @line_item = order.line_items.find(params[:id])
  #   @line_item.destroy

  #   respond_with(@order) do |format|
  #     format.html { render json: current_order, serializer: OrderSerializer }
  #     format.json { render json: current_order, serializer: OrderSerializer }
  #   end
    
  # end

  private

    def order
      @order = current_order(create_order_if_necessary = true)
    end

    def line_item_params
      params.require(:line_item).permit(:quantity, :variant_id, :order_id)
    end

end




# module Spree
#   module Api
#     class LineItemsController < Spree::Api::BaseController

#       def create
#         variant = Spree::Variant.find(params[:line_item][:variant_id])
#         @line_item = order.contents.add(variant, params[:line_item][:quantity])
#         if @line_item.save
#           @order.ensure_updated_shipments
#           respond_with(@line_item, status: 201, default_template: :show)
#         else
#           invalid_resource!(@line_item)
#         end
#       end

#       def update
#         @line_item = order.line_items.find(params[:id])
#         if @line_item.update_attributes(line_item_params)
#           @order.ensure_updated_shipments
#           respond_with(@line_item, default_template: :show)
#         else
#           invalid_resource!(@line_item)
#         end
#       end

#       def destroy
#         @line_item = order.line_items.find(params[:id])
#         @line_item.destroy
#         respond_with(@line_item, status: 204)
#       end

#       private

#         def order
#           @order ||= Spree::Order.find_by!(number: params[:order_id])
#           authorize! :update, @order, params[:order_token]
#         end

#         def line_item_params
#           params.require(:line_item).permit(:quantity, :variant_id)
#         end
#     end
#   end
# end
