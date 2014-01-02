class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :release

  has_attached_file :imagefile, :default_url => "/audio/missing.png"

end
