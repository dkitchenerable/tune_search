class Album < ActiveRecord::Base

  has_many :songs
  belongs_to :artist 

  validates_presence_of :title
  validates_uniqueness_of :title


  searchable do
    text :title
  end


end
