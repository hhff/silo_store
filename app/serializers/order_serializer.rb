class OrderSerializer < ActiveModel::Serializer
  attributes :id, :number, :email, :state, :item_total, :item_count, :completed_at

  embed :ids, include: :true

  has_many :line_items, serializer: LineItemSerializer, key: :line_items
  has_many :payments, serializer: PaymentSerializer, key: :payments

  has_one :ship_address, serializer: AddressSerializer, key: :ship_address
  has_one :bill_address, serializer: AddressSerializer, key: :bill_address

end