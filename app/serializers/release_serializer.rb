class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :release_date, :is_private, :upc_ean

  embed :ids, include: :true

  has_many :tracks
  has_one :image
end
