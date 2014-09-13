class CreateAlbumTable < ActiveRecord::Migration
  def up
    create_table :albums do |t|
      t.belongs_to :artist
      t.string :title
      t.datetime :release_date
      t.timestamps
    end
  end

  def down
  end
end
