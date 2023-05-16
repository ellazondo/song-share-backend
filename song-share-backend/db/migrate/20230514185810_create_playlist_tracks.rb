class CreatePlaylistTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :playlist_tracks do |t|
      t.integer :playlist_id
      t.integer :user_id
      t.integer :submitted_song_id

      t.timestamps
    end
  end
end
