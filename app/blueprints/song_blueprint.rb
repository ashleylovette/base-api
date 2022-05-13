class SongBlueprint < Blueprinter::Base 
  identifier :id
  fields :song_name, :song_chords

  view :normal do
    fields :created_at, :updated_at
  end
end