module SearchHelper

  def song_search(query_params)
    search_object = Sunspot.search.search do
        fulltext query_params["song"]
    end
    search_object.results
  end

end
