module Api
  module V1
    class SongsController < Api::V1::ApplicationController

      # GET all songs /api/v1/songs
      def index
        render_success(payload: SongBlueprint.render_as_hash(Song.all))
      end

      # POST /api/v1/songs
      def create 
        result = Songs.new_song(song_params, @current_user)
          render_error(errors: "There was a problem creating a new song", status: 400) and return unless result.success?
          payload = {
            song: SongBlueprint.render_as_hash(result.payload),
          }
          render_success(payload: payload)
      end

      # PATCH/PUT /api/v1/songs/:id
      def update 
        result = Songs.update_song(params[:id], song_params, @current_user)
          render_error(errors: "There was a problem updating a song", status: 400) and return unless result.success?
          payload = {
            song: SongBlueprint.render_as_hash(result.payload),
          }
          render_success(payload: payload)
      end

      # DELETE /api/v1/songs:id
      def destroy
        result = Songs.destroy_song(params[:id], @current_user)
        render_error(errors: "There was a problem deleting a song", status: 400) and return unless result.success?
        render_success(payload: nil)
      end
      
      # user songs - get current user songs
      def my_songs 
        render_success(payload: SongBlueprint.render_as_hash(@current_user.songs))
      end
  
      private
      def song_params
        params.require(:song).permit(:song_name, :song_chords)
      end
    end
  end
end


