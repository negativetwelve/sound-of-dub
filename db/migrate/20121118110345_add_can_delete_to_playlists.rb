class AddCanDeleteToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :can_delete, :boolean
  end
end
