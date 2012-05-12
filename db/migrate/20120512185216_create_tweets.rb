class CreateTweets < ActiveRecord::Migration
  def self.up
  	create_table :tweets do |t|
  		t.integer :twitter_id
  		t.string :from_user
  		t.string :text
  		t.timestamp :tweeted_at
  	end
  end

  def self.down
  	drop_table :tweets
  end
end
