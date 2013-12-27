class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |authentication|
      authentication.provider = auth.provider
      authentication.uid = auth.uid
      authentication.username = auth.info.nickname
    end
  end

end
