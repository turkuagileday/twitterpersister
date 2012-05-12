require 'sinatra'
require 'sinatra/activerecord'

set :database, ENV['DATABASE_URL']

class Tweet < ActiveRecord::Base

end