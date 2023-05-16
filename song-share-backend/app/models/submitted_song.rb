class SubmittedSong < ApplicationRecord
belongs_to: :playlist_track

validates :artist_name, presence: true
validates :song_name, presence: true
validates :artist_email, presence: true
validates :song_description, presence: true
validates :artist_phone, presence: true 


end
