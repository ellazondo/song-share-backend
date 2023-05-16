class PlaylistTrackSerializer < ActiveModel::Serializer
  attributes :id, :playlist_id, :user_id, :submitted_song_id
end
