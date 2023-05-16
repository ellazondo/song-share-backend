class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :playlist_name, :playlist_img, :playlist_genre, :created_by
end
