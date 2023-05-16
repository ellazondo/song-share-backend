class SubmittedSongSerializer < ActiveModel::Serializer
  attributes :id, :artist_name, :song_name, :song_description, :artist_email, :artist_phone
end
