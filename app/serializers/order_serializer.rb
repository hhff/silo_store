class OrderSerializer < ActiveModel::Serializer
  attributes :id, :number, :token

  embed :ids, include: :true

  has_many :line_items, serializer: LineItemSerializer
end