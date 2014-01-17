class AddressSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :address1, :address2, :city, :zipcode, :phone, :country_id, :state_id

  embed :ids, include: :true

end