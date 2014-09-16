require 'test_helper'

class SongTest < ActiveSupport::TestCase

  def setup
    @artist = Artist.new
    @artist.name = "DK"
    @artist.save

    @album =  Album.new
    @album.title = "DK Watches The Throne"
    @album.artist = @artist
    @album.save
  
    @song = Song.new
    @song.title = "DK Ballad"
    @song.album = @album
    @song.save
  end

  test "album title attribute" do
    assert_equal(@album.title, @song.album_title, "Album title did not match")
  end

  test "artist name attribute" do
    assert_equal(@artist.name, @song.artist_name, "Artist title did not match")
  end

  test "should not save without title" do
    @song.title = nil
    assert_equal(false, @song.save, "Saved with title missing") 
  end


  test "should not save without album" do
    @song.album = nil
    assert_equal(false, @song.save, "Saved with album missing") 
  end

end
