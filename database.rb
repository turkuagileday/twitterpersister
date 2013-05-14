require 'sinatra'
require 'sinatra/activerecord'

set :database, ENV['DATABASE_URL'] || 'sqlite://database.db'

class Tweet < ActiveRecord::Base

end