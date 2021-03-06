class Release < ActiveRecord::Base
  belongs_to :user
  
  has_many :images
  has_many :tracks

  accepts_nested_attributes_for :tracks
  validates :user_id, presence: true
end
