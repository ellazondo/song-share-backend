class CreateSubmittedSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :submitted_songs do |t|
      t.string :artist_name
      t.string :song_name
      t.string :song_description
      t.string :artist_email
      t.string :artist_phone

      t.timestamps
    end
  end
end
