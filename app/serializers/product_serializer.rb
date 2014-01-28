class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :format

  embed :ids, include: :true

  has_one :shipping_category, serializer: ShippingCategorySerializer
  has_many :images, serializer: ImageSerializer
end