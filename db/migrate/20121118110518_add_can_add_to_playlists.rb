class AddCanAddToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :can_add, :boolean
  end
end
