Spree::Order.class_eval do

  checkout_flow do
    go_to_state :address
    go_to_state :delivery
    go_to_state :payment, :if => lambda { |order| order.payment_required? }
    go_to_state :confirm, :if => lambda { |order| order.payment_required? }
    go_to_state :complete
    remove_transition :from => :delivery, :to => :confirm
  end

  # Can probably remove this
  accepts_nested_attributes_for :line_items, :allow_destroy => true

  # def shipment_required?
  #   # My ruby straight SUCKS
  #   non_digital = 0

  #   line_items.each do |line_item|

  #     # Digital (ie no Shipping) will always be shipping_category 1
  #     if line_item.product.shipping_category.id != 1
  #       non_digital = non_digital + 1    
  #     end
  #   end

  #   if non_digital > 0
  #     return true
  #   else
  #     return false
  #   end

  # end

end