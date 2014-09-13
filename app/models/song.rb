class Song < ActiveRecord::Base

  belongs_to :album

  searchable do
    text :title
  end

end
