class PlaylistTracksController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        playlist_tracks = Playlist_track.all
        render json: playlist_tracks, status: :ok
    end

    def show
        playlist_track = Playlist_track.find(params[:id])
        render json: playlist_track
    end

    # def update
    #     playlist_track = Playlist_track.find(params[:id])
    #     outfit.update!(playlist_track_params)
    #     render json: playlist_track 

    # end

    def create 
        new_playlist_track = Playlist_track.create!(playlist_track_params)
        render json: new_playlist_track, status: :created
    end

    def destroy
        playlist_track = Playlist_track.find(params[:id])
        playlist_track.destroy
        head :no_content
    end

    private

    def playlist_track_params
        params.permit(:playlist_id, :user_id, :submitted_song_id)
    end

    def render_not_found_response
        render json: {error: "Track not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

end
