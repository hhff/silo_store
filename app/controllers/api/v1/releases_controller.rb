class Api::V1::ReleasesController < ApplicationController
	respond_to :json

	def index
		respond_with Release.all
	end

	def show
		respond_with Release.find(params[:id])
	end 

	def create
		respond_with Release.create(release_params)
	end

	def destroy
		respond_with Release.destroy(params[:id])
	end

	private

		def release_params
			params.require(:release).permit(:name, :artist, :releaseDate, :isPrivate, :upcEan)
		end

end
