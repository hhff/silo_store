class Api::V1::ConnectController < ApplicationController
  include Devise::OmniAuth::UrlHelpers

  def index
    render json: {connect: {
      twitter_path: user_omniauth_authorize_path(:twitter)
    }}
  end
end
