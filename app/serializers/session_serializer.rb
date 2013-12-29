class SessionSerializer < ActiveModel::Serializer
  attributes :id, :email, :context
end
