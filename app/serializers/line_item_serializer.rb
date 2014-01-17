class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :variant_id, :quantity, :price

  embed :ids, include: :true

  has_one :product, serializer: ProductSerializer
end