class User < ApplicationRecord
    has_many :playlist_tracks, dependent: :destroy 
    has_many :playlists, through: :playlist_tracks 

    validates :username, presence: true, uniqueness: true 
    validates :password, presence: true
    validates :profile_pic, presence: true 

    has_secure_password
end
