class Album < ActiveRecord::Base

  has_many :songs
  belongs_to :artist 

  validates_presence_of :artist, :title

  attr_accessible :title

end
