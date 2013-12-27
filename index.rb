require 'dm-core'
require 'dm-migrations'

class User
  include DataMapper::Resource
  
  property :id,       		Serial
  property :username, 		String
  property :password, 		String
  property :foto,     		String
  property :rss,      		String, 	:length => 2000,	:required => false
  property :titulo_rss,		String, 	:length => 2000,	:required => false
  property :num,		Integer,	:default => 5
  property :rss_used,		String,		:required => false  #Puede ser nulo
  property :titulo_used,	String,		:required => false  #Puede ser nulo
end


DataMapper.finalize

