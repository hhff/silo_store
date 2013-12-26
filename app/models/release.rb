class Release < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  has_many :tracks

  # validates :user_id, presence: true
end
