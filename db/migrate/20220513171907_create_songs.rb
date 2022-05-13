class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :song_name
      t.string :song_chords
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
