class SeedData < ActiveRecord::Migration

  require 'net'http'

  def up
    seed_db
  end

  def down
  end

  private

  self.seed_db
    
  end

end
