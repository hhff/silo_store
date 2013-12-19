class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :release_date, :is_private, :upc_ean, :created_at
end
