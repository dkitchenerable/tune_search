class Album < ActiveRecord::Base

  has_many :songs
  belongs_to :artist 

  validates_presence_of :title

  attr_accessible :title

  searchable do
    text :title
  end


end
