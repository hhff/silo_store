class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity

  embed :ids, include: :true
end