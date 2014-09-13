class CreateArtistTable < ActiveRecord::Migration
  def up
    create_table :artists do |t|
      t.string :name
      t.text  :bio
      t.timestamps 
    end
  end

  def down
  end
end
