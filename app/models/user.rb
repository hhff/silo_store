class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :releases
  has_many :images
  has_many :tracks
  has_many :authentications

  has_many :products, :class_name => 'Spree::Product'

end
