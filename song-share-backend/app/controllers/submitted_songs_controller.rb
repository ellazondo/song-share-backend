class SubmittedSongsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        submitted_songs = Submitted_song.all
        render json: submitted_song, status: :ok
    end

    def show
        submitted_song = Submitted_song.find(params[:id])
        render json: submitted_song
    end

    def update
        submitted_song = Submitted_song.find(params[:id])
        outfit.update!(submitted_song_params)
        render json: submitted_song 

    end

    def create 
        new_submitted_song = Submitted_song.create!(submitted_song_params)
        render json: new_submitted_song, status: :created
    end

    def destroy
        submitted_song = Submitted_song.find(params[:id])
        submitted_song.destroy
        head :no_content
    end

    private

    def submitted_song_params
        params.permit(:artist_name, :song_name, :artist_email, song_description, :artist_phone)
    end

    def render_not_found_response
        render json: {error: "Track not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
