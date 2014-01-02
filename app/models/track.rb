class Track < ActiveRecord::Base
  attr_accessor :tempfile

  belongs_to :release
  belongs_to :user

  has_attached_file :audiofile, :default_url => "/audio/missing.png"
end
