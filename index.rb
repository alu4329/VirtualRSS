#require './lib/visualrss.rb'
#require 'sinatra/flash'
require 'dm-core'
require 'dm-migrations'
require 'sinatra'
require 'sass'
require 'pp'
require 'open-uri'
require 'nokogiri'
require 'ruby-bitly'
require 'haml'
require './noko.rb'

class User
  include DataMapper::Resource
  
  property :id,       Serial
  property :username, String
  property :password, String
  property :foto,     String
  property :rss,      String
  
  
  #def rss= new_rss
    #@rss = Bitly.shorten(new_rss, "o_1qfb1am5b6", "R_770c5cbd981cadac42359a65fed206df")
  #end
end



DataMapper.finalize

