class Api::V1::TemporaryController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!
  
  def create
    uploaded = params[:file][:data]

    guid = SecureRandom.hex(10)+'_'

    File.open(Rails.root.join('tmp', 'uploads', guid+uploaded.original_filename), 'wb', :encoding => 'utf-8') do |file|
      file.binmode
      file.write(uploaded.read)
    end

    render json: {tempfile: guid+uploaded.original_filename}

  end
end