class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :context
end
