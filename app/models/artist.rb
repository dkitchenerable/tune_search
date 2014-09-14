class Artist < ActiveRecord::Base

  has_many :albums

  validates_presence_of :name
  
  attr_accessible :name

  searchable do
    text :name
  end


end
