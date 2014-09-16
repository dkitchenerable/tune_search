class CreateSongTable < ActiveRecord::Migration
  def up
    add_index :songs, :title
  end

  def down
  end
end
