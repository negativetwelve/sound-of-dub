class CreateScrapers < ActiveRecord::Migration
  def change
    create_table :scrapers do |t|
      t.string :client_id
      
      t.timestamps
    end
  end
end
