class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :amount, :order_id, :payment_method_id, :state

  embed :ids, include: :true

  has_one :payment_source, serializer: PaymentSourceSerializer, key: :source, root: :sources

end