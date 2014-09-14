module SearchHelper

  def song_search(query_params)
    search_object = Song.search do
      fulltext query_params["title"], :fields => [:title]
      fulltext query_params["album_title"], :fields => [:album_title]
      fulltext query_params["artist_name"], :fields => [:artist_name]
      keywords query_params["keywords"]
    end
    search_object.results
  end

end
