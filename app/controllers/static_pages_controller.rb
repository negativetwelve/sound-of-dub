class StaticPagesController < ApplicationController

  def home
    @songs = []
    if signed_in?
      current_user.playlists[current_user.current_playlist_id.to_i].songs.each do |song|
        if song.streamable?
          @songs += [{title: song.title, mp3: song.stream_url.to_s + "?client_id=7369d5fe3bc71c4163f76b36b04b1128", artwork_url: song.artwork_url}]
        end
      end
    else
      Song.all.each do |song|
        if song.streamable?
          @songs += [{title: song.title, mp3: song.stream_url.to_s + "?client_id=7369d5fe3bc71c4163f76b36b04b1128", artwork_url: song.artwork_url}]
        end
      end
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
