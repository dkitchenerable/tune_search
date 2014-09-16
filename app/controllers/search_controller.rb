class SearchController < ApplicationController

  layout 'search'

  include SearchHelper

  require "benchmark"

  def index
  end

  def search
    @time = Benchmark.measure do 
      @results = song_search(params[:search])
    end
    render 'index'
  end

end
