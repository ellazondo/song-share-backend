class PlaylistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        playlists = Playlist.all
        render json: playlists, status: :ok
    end

    def show
        playlist = Playlist.find(params[:id])
        render json: playlist
    end

    def update
        playlist = Playlist.find(params[:id])
        outfit.update!(playlist_params)
        render json: playlist 

    end

    def create 
        new_playlist = Playlist.create!(outfit_params)
        render json: new_playlist, status: :created
    end

    def destroy
        playlist = Playlist.find(params[:id])
        playlist.destroy
        head :no_content
    end

    private

    def playlist_params
        params.permit(:playlist_name, :playlist_img, :playlist_genre, :created_by)
    end

    def render_not_found_response
        render json: {error: "Playlist not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

end
