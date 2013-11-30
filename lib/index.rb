require './lib/visualrss.rb'
#require 'sinatra/flash'


class User
  include DataMapper::Resource
  property :id, Serial
  property :username, String
  property :password, String
  property :foto_url, String
  property :rss, Array
end



DataMapper.finalize