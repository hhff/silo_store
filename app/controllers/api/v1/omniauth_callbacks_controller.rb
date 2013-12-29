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

  def stripe_connect
    response = request.env["omniauth.auth"]

    authentication = Authentication.from_omniauth(response)
    authentication.oauth_secret = response.info.stripe_publishable_key
    authentication.user = current_user
    authentication.save!

    gateway = Spree::PaymentMethod.create!(
      type: "Spree::Gateway::StripeGateway",
      name: "Stripe Gateway for "+current_user.context,
      environment: "development"
    )

    gateway.set_preference(:server,  'test')
    gateway.set_preference(:publishable_key,  authentication.oauth_secret)
    gateway.set_preference(:secret_key,  authentication.oauth_token)

    if authentication.persisted?
      redirect_to '/#/admin/connect?success=true&provider='+authentication.provider
    else
      redirect_to '/#/admin/connect?success=false'
    end
  end

  alias_method :twitter, :all
  alias_method :soundcloud, :all

end
