#require './lib/visualrss.rb'
require 'dm-core'
require 'pg'
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
end


DataMapper.finalize

