module Songs
  def self.new_song(params, current_user)
    song = current_user.songs.new(params)
    return ServiceContract.error("Error saving song") unless song.save
    ServiceContract.success(song)
  end

  def self.update_song(song_id, params, current_user)
    song = current_user.songs.find(song_id)
    return ServiceContract.error("Error updating song") unless song.update(params)
    ServiceContract.success(song)
  end

  def self.destroy_song(song_id, current_user)
    song = current_user.songs.find(song_id)
     ServiceContract.error('Error deleting user') and return unless song.destroy
    ServiceContract.success(payload: nil)
  end
end