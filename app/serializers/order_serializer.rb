class OrderSerializer < ActiveModel::Serializer
  attributes :id, :number

  embed :ids, include: :true

  has_many :line_items, serializer: LineItemSerializer
end