class Image < ActiveRecord::Base
  belongs_to :user

  # mount_uploader :imagefile, ImagefileUploader

  has_attached_file :imagefile, :default_url => "/audio/missing.png"


end
