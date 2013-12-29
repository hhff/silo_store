class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :isrc, :audiofile
end
