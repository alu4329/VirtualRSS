require 'dm-core'
require 'dm-migrations'
require 'sinatra/flash'


class User
  include DataMapper::Resource
  property :id, Serial
  property :username, String
  property :password, String
  property :foto_url, String
  property :rss, Array
end



DataMapper.finalize


get '/user/sign_up' do
  haml :registro
end

get '/user/:id' do |id|
  @user = User.get(id)
  haml :usuario
end

get '/user/:id/perfil' do
  @user = User.get(params[:id])
  slim :perfil
end