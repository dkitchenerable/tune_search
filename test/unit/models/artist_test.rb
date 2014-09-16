require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  def setup
    @artist = Artist.new
    @artist.name = "DK"
    @artist.save
  end

  test "should not save without name" do
    @artist.name = nil
    assert_equal(false, @artist.save, "Saved with artist name missing") 
  end

end
