class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name

  embed :ids, include: :true

  has_one :shipping_category, serializer: ShippingCategorySerializer
end