class Playlist < ApplicationRecord

has_many: playlist_tracks
has_many :users, through: :playlist_tracks

validates :playlist_name, uniqueness: true
validates :playlist_img, presence: true
validates :created_by, presence: true 
# list of all of the genres of music

end
