class Api::V1::ReleasesController < ApplicationController
	respond_to :json
  before_filter :authenticate_user!

	def index
		@releases = current_user.releases

    @releases.each do |release|
    	image = Image.find(release.image_id)
      release['image_url'] = image.imagefile.url
    end

    respond_with @releases

	end

	def show
		respond_with Release.find(params[:id])
	end 

	def create
		@release = Release.new(release_params)
		@release.user = current_user

		if @release.save
			respond_with @release
		else
			# Didn't work!
		end

	end

	def destroy
		respond_with Release.destroy(params[:id])
	end

	private

		def release_params
			params.require(:release).permit(:name, :artist, :release_date, :is_private, :upc_ean, :user_id, :image_id)
		end

end
