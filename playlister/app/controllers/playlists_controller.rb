class PlaylistsController < ApplicationController
  # Associations were set up to allow the index page to render properly.
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(whitelisted_playlist_params)
    if @playlist.save
      flash[:notice] = "Playlist Created."
      redirect_to playlists_path
    else
      flash[:notice] = "Failed to create playlist because #{@playlist.errors.full_messages}"
      render :new
    end
  end

  # The assignment says that the form should be reusable for the edit paths.
  # The simplest way to verify this was to just write the controller actions.
  # One line has been added to the index view to link to the edit page.
  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(whitelisted_playlist_params)
      flash[:notice] = "Playlist Updated."
      redirect_to playlists_path
    else
      flash[:notice] = "Failed to update playlist because #{@playlist.errors.full_messages}"
      render :edit
    end
  end

  private

  # We take the playlist name, the user id, and the song_ids array.
  def whitelisted_playlist_params
    params.require(:playlist).permit(:name, :user_id, song_ids: [])
  end

end
