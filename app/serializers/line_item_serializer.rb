class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :variant_id, :quantity, :price

  has_one :product, serializer: ProductSerializer, embed: :ids, include: :true
  has_one :order, embed: :ids
end