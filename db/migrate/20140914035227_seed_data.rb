class SeedData < ActiveRecord::Migration

  require 'httparty'
  require 'json'

  def up
    seed_db
  end

  def down
  end

  private

  def seed_db
    response = HTTParty.get("http://freemusicarchive.org/api/get/albums.json", 
                            :query => {:api_key => "K5QDFJI669IV2UZV", :genre_handle => 'Indie'})
    album_data = JSON.parse(response.body)["dataset"]
    album_data.each { |album|
      artist = album["artist_name"]
      album_title = album["album_title"]
      album_id = album.album_id
      response = HTTParty.get("http://freemusicarchive.org/api/get/tracks.json", 
                              :query => {:api_key => "K5QDFJI669IV2UZV", :album_id => album_id})
      track_data = JSON.parse(response.body)["dataset"]
      new_artist = Artist.create!(:name => artist)
      new_album =  Album.create!(:title => album_title, :artist => new_artist)
      track_data.each { |track|
        new_song = Song.create!(:title => track["track_title"], :album => new_album)
      }
    }
  end

end
