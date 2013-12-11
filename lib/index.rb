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
require './lib/noko.rb'

class User
  include DataMapper::Resource
  
  property :id,       Serial
  property :username, String
  property :password, String
  property :foto,     String
  has n,   :rsss
end

class Rss
  include DataMapper::Resource
  
  property :id,		String, key: true, unique_index: true
  property :short_link,	String
  
  belongs_to :user
  
end

DataMapper.finalize

