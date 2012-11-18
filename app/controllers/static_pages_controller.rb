class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @songs = []
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
