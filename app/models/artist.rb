class Artist < ActiveRecord::Base

  has_many :albums

  validates_presence_of :name 
  validates_uniqueness_of :name 


  searchable do
    text :name
  end


end
