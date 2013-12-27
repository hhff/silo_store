class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |authentication|
      authentication.provider = auth.provider
      authentication.uid = auth.uid
      authentication.username = auth.info.nickname
      authentication.oauth_token = auth.credentials.token
      authentication.oauth_secret = auth.credentials.secret
    end
  end

end
