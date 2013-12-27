class Api::V1::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    authentication = Authentication.from_omniauth(request.env["omniauth.auth"])
    authentication.user = current_user
    authentication.save!

    if authentication.persisted?
      redirect_to '/#/admin/dashboard'
    else
      # Fail
    end
  end

  alias_method :twitter, :all

end
