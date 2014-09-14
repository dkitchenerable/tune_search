class Song < ActiveRecord::Base

  belongs_to :album

  searchable do
    text :title
    text :album_title
    text :artist_name

    string :album_title
    string :artist_name
  end

  validates_presence_of :album
  
  attr_accessible :album_title, :artist_name

  def album_title
    self.album.title
  end

  def artist_name
    self.album.artist.name
  end

end
