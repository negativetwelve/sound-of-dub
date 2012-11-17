class Scraper < ActiveRecord::Base
  # attr_accessible :title, :body
  
  CLIENT_ID = "7369d5fe3bc71c4163f76b36b04b1128"
  CLIENT_SECRET = "04fcffa946f3a950f4361b523c007833"
  REDIRECT_URI = "sound-dub://soundcloud/callback"
  
  
  def get_top_tracks(num)
    # register a client with YOUR_CLIENT_ID as client_id_
    client = Soundcloud.new(:client_id => CLIENT_ID)
    # get 10 hottest tracks
    tracks = client.get('/tracks', :limit => num, :order => 'hotness')
    # print each link
    tracks.each do |track|
      puts track.permalink_url
    end
  end
  
end
