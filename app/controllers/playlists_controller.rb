class PlaylistsController < ApplicationController
  
  def create
    @playlist = Playlist.new(params[:playlist])
    @playlist.user_id = current_user.id
    @playlist.save
    respond_to do |format|
      format.js {}
    end
  end
  
end
