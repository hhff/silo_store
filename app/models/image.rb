class Image < ActiveRecord::Base

  mount_uploader :imagefile, ImagefileUploader

end
