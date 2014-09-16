class SongSweeper < ActionController::Caching::Sweeper
  observe Song, Artist, Album

  # expire cache for inserts and deleted songs, artists, and albums
 
  def after_save(record)
    Rails.cache.delete_matched(%r{song-search*})
  end
 
  def before_destroy(record)
    Rails.cache.delete_matched(%r{song-search*})
  end
end
