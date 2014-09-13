class CreateSongTable < ActiveRecord::Migration
  def up
    create_table :songs do |t|
      t.belongs_to :album
      t.string :title
      t.timestamps
    end
  end

  def down
  end
end
