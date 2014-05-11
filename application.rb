require 'twitter'
require 'json'
require './database'
require 'haml'

thread = Thread.new do
	puts "thread started"
	loop do
		since = Tweet.maximum("twitter_id") || 0
		puts since
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
    end
    client.search('turkuagileday OR #tad014', :count => 100, :since_id => since).map do |status|
      tweet = Tweet.new
      tweet.tweeted_at = status.created_at
      tweet.text = status.text
      tweet.twitter_id = status.id
      tweet.from_user = status.user.screen_name
      tweet.save!
    end
		sleep 60
	end
end


class WebApp < Sinatra::Base
	use ActiveRecord::ConnectionAdapters::ConnectionManagement

	get '/' do
		@tweets = Tweet.order('tweeted_at DESC').limit(1000)
		haml :index
	end
end
