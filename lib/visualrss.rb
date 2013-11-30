require 'dm-core'
require 'dm-migrations'
require 'sinatra'
require 'sass'
require 'pp'
require './lib/noko.rb'



settings.port = ENV['PORT'] || 4567
use Rack::Session::Pool, :expire_after => 2592000
set :session_secret, 'super secret'
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
DataMapper.auto_upgrade!


module VisualRSS
  
  
  
end