module SearchHelper

=begin
  The search strategy:
  full text queries for users inputing in the title, album title, and artist name fields
  keyword search for users using the keyword input, where song title takes precedence in results
=end

  def song_search(query_params)
    results = Rails.cache.fetch("song-search-#{query_params["title"]}-#{query_params["album_title"]}-#{query_params["artist_name"]}-#{query_params["keywords"]}") do 
      search_object = Song.search do
        fulltext query_params["title"], :fields => [:title]
        fulltext query_params["album_title"], :fields => [:album_title]
        fulltext query_params["artist_name"], :fields => [:artist_name]
        keywords query_params["keywords"] do
          boost_fields :title => 2.0
        end
        paginate :page => 1, :per_page => 500
      end
      search_object.results        
    end
    results
  end

end
