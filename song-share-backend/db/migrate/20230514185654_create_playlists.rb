class CreatePlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :playlists do |t|
      t.string :playlist_name
      t.string :playlist_img
      t.string :playlist_genre
      t.string :created_by

      t.timestamps
    end
  end
end
