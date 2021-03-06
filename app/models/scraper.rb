class Scraper < ActiveRecord::Base
  # attr_accessible :title, :body
  
  CLIENT_ID = "7369d5fe3bc71c4163f76b36b04b1128"
  CLIENT_SECRET = "04fcffa946f3a950f4361b523c007833"
  REDIRECT_URI = "sound-dub://soundcloud/callback"
  
  CLIENT = Soundcloud.new(client_id: CLIENT_ID)
  
  
  def print(tracks, attribute)
    tracks.each do |track|
      puts track[attribute]
    end
  end
  
  def insert_soundcloud_tracks(tracks)
    curr_songs_ids = Song.pluck(:upload_id)
    imported = 0
    already_had = 0
    tracks.each do |t|
      if !curr_songs_ids.include?(t['id'] && t['streamable'])
        Song.create(title: t['title'], artwork_url: t['artwork_url'], upload_date: t['created_at'], downloadable: t['downloadable'], duration: t['duration'], genre: t['genre'], upload_id: t['id'], url: t['permalink_url'], server_plays: t['playback_count'].to_i, purchase_url: t['purchase_url'], streamable: t['streamable'], tag_list: t['tag_list'], track_type: t['track_type'], uri: t['uri'], user_upload_id: t['user_id'], service: 'Soundcloud', stream_url: t['stream_url'])
        imported += 1
      else
        already_had += 1
      end
    end
    puts "IMPORTED: #{imported}"
    puts "ALREADY HAD: #{already_had}"
  end
  
  def get_top_tracks(num)
    tracks = CLIENT.get('/tracks', limit: num, order: 'hotness')
    #print(tracks, 'title')
  end
  
  def get_top_dubstep(num)
    tracks = CLIENT.get('/tracks', genres: 'dubstep', limit: num, order: 'hotness')
    #print(tracks, 'title')
  end
  
end
