class ChangeToBigint < ActiveRecord::Migration
  def self.up
  	change_column :tweets, :twitter_id, :bigint
  end

  def self.down
  	change_column :tweets, :twitter_id, :integer
  end
end
