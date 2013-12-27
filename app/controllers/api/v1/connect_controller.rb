class Api::V1::ConnectController < ApplicationController
  include Devise::OmniAuth::UrlHelpers

  def index
    render json: {connect: {
      twitter_path: user_omniauth_authorize_path(:twitter),
      twitter_callback_path: user_omniauth_callback_path(:twitter),
      soundcloud_path: user_omniauth_authorize_path(:soundcloud),
      soundcloud_callback_path: user_omniauth_callback_path(:soundcloud)

    }}
  end
end
