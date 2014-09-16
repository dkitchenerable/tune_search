class Song < ActiveRecord::Base

  belongs_to :album

=begin
  - block for creating solr indexes
  - must reindex when this changes
  - make searched song titles, album titles, 
    and artist name all fulltext searches
=end
  searchable do
    text :title
    text :album_title
    text :artist_name
  end

  validates_presence_of :album, :title
  
  # needed these attributes because search block uses attributes
  attr_accessible :album_title, :artist_name

  def album_title
    self.album.title
  end

  def artist_name
    self.album.artist.name
  end

end
