require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  def setup
    @artist = Artist.new
    @artist.name = "DK"
    @artist.save

    @album =  Album.new
    @album.title = "DK Watches The Throne"
    @album.artist = @artist
    @album.save
  end

  test "should not save without title" do
    @album.title = nil
    assert_equal(false, @album.save, "Saved with title missing") 
  end

end
