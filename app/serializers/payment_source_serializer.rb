class PaymentSourceSerializer < ActiveModel::Serializer
  attributes :id, :month, :year, :cc_type, :last_digits, :first_name, :last_name, :gateway_payment_profile_id

end