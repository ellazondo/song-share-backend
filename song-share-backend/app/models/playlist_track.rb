class PlaylistTrack < ApplicationRecord

belongs_to :user
belongs_to :playlist
has_one :submitted_song

validates :playlist_id, presence: true
validates :user_id, presence: true
validates :submitted_song_id, presence: true 


end
