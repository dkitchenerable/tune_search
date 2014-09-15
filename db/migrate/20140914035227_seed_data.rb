class SeedData < ActiveRecord::Migration

=begin
  A simple api call to seed the db. hard-coded genre.
=end

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
                            :query => {:api_key => "K5QDFJI669IV2UZV", :genre_handle => 'Rock'})
    album_data = JSON.parse(response.body)["dataset"]
    album_data.each { |album|
      artist = album["artist_name"]
      album_title = album["album_title"]
      album_id = album["album_id"]
      response = HTTParty.get("http://freemusicarchive.org/api/get/tracks.json", 
                              :query => {:api_key => "K5QDFJI669IV2UZV", :album_id => album_id})
      track_data = JSON.parse(response.body)["dataset"]
      new_artist = Artist.new
      new_artist.name = artist
      new_artist.save

      new_album =  Album.new
      new_album.title = album_title
      new_album.artist = new_artist
      new_album.save

      track_data.each { |track|
        new_song = Song.new
        new_song.title = track["track_title"]
        new_song.album = new_album
        new_song.save
      }
    }
  end

end
