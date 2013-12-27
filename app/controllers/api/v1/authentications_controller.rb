class Api::V1::AuthenticationsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    respond_with current_user.authentications
  end
end
