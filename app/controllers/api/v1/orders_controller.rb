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
        format.json { render json: order, serializer: OrderSerializer }
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
        line_items_attributes: [:id, :quantity, :price, :variant_id],
        ship_address_attributes: [:firstname, :lastname, :address1, :address2, :city, :zipcode, :phone, :country_id, :state_id], 
        payments_attributes: [:amount, :payment_method_id, source_attributes: [:last_digits, :month, :year, :cc_type, :gateway_payment_profile_id]],
      )
    end

    # def default_bill_address
    #   :firstname => "Default", :lastname => "Default", :address1 => "Default", :city => "Default", :zipcode => "12345", :country_id => 49, :state_id => 48, :phone => "5512213610"
    # end

end

# Order has many payments
# Payment has one payment_source

#<Spree::CreditCard:0x00000107a555c0> {
#                              :id => 6,
#                           :month => "6",
#                            :year => "2016",
#                         :cc_type => "visa",
#                     :last_digits => "4242",
#                      :first_name => "Hugh",
#                       :last_name => "Francis",
#                      :address_id => nil,
#     :gateway_customer_profile_id => nil,
#      :gateway_payment_profile_id => "tok_103KBc2IAeqjfvEtuFo55cIg",
#                      :created_at => Fri, 17 Jan 2014 07:40:42 UTC +00:00,
#                      :updated_at => Fri, 17 Jan 2014 07:40:42 UTC +00:00
# }


# Create Payment:
# Parameters: {"utf8"=>"✓", "authenticity_token"=>"sJeL1CW29sroCTWUSUqQIsHFXqIcP16SgcU/rJcZQP8=", "order"=>{"payments_attributes"=>[{"payment_method_id"=>"1"}]}, "payment_source"=>{"1"=>{"number"=>"[FILTERED]", "expiry"=>"05 / 16", "verification_value"=>"[FILTERED]", "cc_type"=>"visa", "first_name"=>"Hugh", "last_name"=>"Francis"}}, "state"=>"payment"}

# Update Payment:
# Parameters: {"utf8"=>"✓", "authenticity_token"=>"sJeL1CW29sroCTWUSUqQIsHFXqIcP16SgcU/rJcZQP8=", "order"=>{"payments_attributes"=>[{"payment_method_id"=>"1"}]}, "payment_source"=>{"1"=>{"cc_type"=>"visa", "first_name"=>"Hugh", "last_name"=>"Francis", "gateway_payment_profile_id"=>"tok_103K9z2IAeqjfvEtdHl7N8ZL", "last_digits"=>"4242", "month"=>"9", "year"=>"2016"}}, "state"=>"payment"}


# Spree.stripePaymentMethod.append("<input type='hidden' class='stripeToken' name='payment_source[" + paymentMethodId  + "][gateway_payment_profile_id]' value='" + token + "'/>");
# Spree.stripePaymentMethod.append("<input type='hidden' class='stripeToken' name='payment_source[" + paymentMethodId  + "][last_digits]' value='" + response.card.last4 + "'/>");
# Spree.stripePaymentMethod.append("<input type='hidden' class='stripeToken' name='payment_source[" + paymentMethodId  + "][month]' value='" + response.card.exp_month + "'/>");
# Spree.stripePaymentMethod.append("<input type='hidden' class='stripeToken' name='payment_source[" + paymentMethodId  + "][year]' value='" + response.card.exp_year + "'/>");