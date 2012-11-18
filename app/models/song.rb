class Song < ActiveRecord::Base
  attr_accessible :title, :artwork_url, :upload_date, :downloadable, :duration, :genre, :upload_id, :url, :server_plays, :purchase_url, :streamable, :stream_url, :tag_list, :track_type, :uri, :user_upload_id, :service
  
  has_and_belongs_to_many :playlists
  
end
