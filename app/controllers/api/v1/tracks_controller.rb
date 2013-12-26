class Api::V1::TracksController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    @tracks = current_user.tracks
    respond_with @tracks
  end
  
end
