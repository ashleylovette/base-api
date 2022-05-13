class Song < ApplicationRecord
  validates :song_name, presence: true
  validates :song_chords, presence: true
  belongs_to :user
end
