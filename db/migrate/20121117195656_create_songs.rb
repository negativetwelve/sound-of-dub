class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artwork_url
      t.string :upload_date
      t.boolean :downloadable
      t.integer :duration
      t.string :genre
      t.integer :upload_id
      t.string :url
      t.string :server_plays
      t.string :purchase_url
      t.boolean :streamable
      t.text :tag_list
      t.string :track_type
      t.string :uri
      t.integer :user_upload_id
      t.string :service
      t.string :stream_url

      t.timestamps
    end
  end
end
