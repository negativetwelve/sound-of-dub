class Playlist < ActiveRecord::Base
  attr_accessible :title, :can_add, :can_delete
  has_and_belongs_to_many :songs
  belongs_to :user
end
