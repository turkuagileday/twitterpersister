require 'twitter'
require 'json'
require './database'
require 'haml'

thread = Thread.new do
	puts "thread started"
	loop do
		since = Tweet.maximum("twitter_id") || 0
		puts since
		Twitter.search('turkuagileday OR #tad012 OR #tad100', :rpp => 100, :since_id => since).map do |status|
			tweet = Tweet.new
			tweet.tweeted_at = status.created_at
			tweet.text = status.text
			tweet.twitter_id = status.id
			tweet.from_user = status.from_user
			tweet.save!
		end
		sleep 60
	end
end


class WebApp < Sinatra::Base
	use ActiveRecord::ConnectionAdapters::ConnectionManagement

	get '/' do
		@tweets = Tweet.order('tweeted_at DESC')
		haml :index
	end
end
