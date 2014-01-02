class Api::V1::TracksController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    @tracks = current_user.tracks
    respond_with @tracks
  end

  def create
    @track = Track.new(track_params)
    @track.user = current_user

    if @track.save
      render json: @track, status: :created
    else
      render json: {response: 'No Save SORRY'}
    end

  end

  private

    def track_params
      params.require(:track).permit( :audiofile, :isrc)
    end
    
end
