class ShippingCategorySerializer < ActiveModel::Serializer
  attributes :id, :name

  embed :ids, include: :true

end