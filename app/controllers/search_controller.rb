class SearchController < ApplicationController

  layout 'search'
  include SearchHelper

  def index
  end

  def search
    @results = song_search(params[:search])
    render 'index'
  end

end
