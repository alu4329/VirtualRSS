#require './lib/visualrss.rb'
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
require 'sinatra/flash'

class User
  include DataMapper::Resource
  
  property :id,       		Serial
  property :username, 		String
  property :password, 		String
  property :foto,     		String
  property :rss,      		String, 	:required => false
  property :titulo_rss,		String, 	:required => false
  property :num,		Integer,	:default => 5
  property :rss_used,		String,		:required => false  #Puede ser nulo
  property :titulo_used,	String,		:required => false  #Puede ser nulo
  

#  has n, :rsss
end
  
=begin Acortar link
  #def rss= new_rss
    #@rss = Bitly.shorten(new_rss, "o_1qfb1am5b6", "R_770c5cbd981cadac42359a65fed206df")
  #end
  */
=end
  
=begin Esto funciona

end

class Rss
  include DataMapper::Resource
  
  property :rss_key,		Serial
  property :rss_name,		String
  property :rss_title,		String
  
  belongs_to :user
end
=end


DataMapper.finalize

