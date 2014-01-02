class Api::V1::ReleasesController < ApplicationController
	respond_to :json
  before_filter :authenticate_user!

	def index
		@releases = current_user.releases
    respond_with @releases

	end

	def show
    release = Release.find(params[:id])
		respond_with release
	end 

	def create
    puts params[:release][:tracks_attributes]

		@release = Release.new(release_params)

		@release.user = current_user

    @release.tracks.each do |track|
      track.user = current_user
      track.audiofile = (File.open(File.join(Rails.root, 'tmp', 'uploads', track.tempfile)))
    end

		if @release.save
      respond_with :api, :v1, @release
		else
			# Didn't work!
		end

	end

	def destroy
		respond_with Release.destroy(params[:id])
	end

private

	def release_params
		params.require(:release).permit(:name, :artist, :release_date, :is_private, :upc_ean, tracks_attributes: [:name, :isrc, :tempfile], images_attributes: [:tempfile])
	end

end
