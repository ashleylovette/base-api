FactoryBot.define do
  factory :song do
    song_name { "MyString" }
    song_chords { "MyString" }
    user { nil }
  end
end
