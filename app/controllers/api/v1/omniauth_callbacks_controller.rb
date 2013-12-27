class Api::V1::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    authentication = Authentication.from_omniauth(request.env["omniauth.auth"])
    authentication.user = current_user
    authentication.save!

    if authentication.persisted?
      redirect_to '/#/admin/connect?success=true&provider='+authentication.provider
    else
      redirect_to '/#/admin/connect?success=false'
    end
  end

  alias_method :twitter, :all
  alias_method :soundcloud, :all
  alias_method :stripe_connect, :all

end
