class AuthenticationSerializer < ActiveModel::Serializer
  attributes :id, :provider, :oauth_token, :oauth_secret, :uid, :username
end
