require './lib/noko.rb'
require 'dm-core'
require 'dm-migrations'
require 'sinatra'
require 'sass'
require 'pp'
require 'open-uri'
require 'nokogiri'
require 'ruby-bitly'
require 'haml'





settings.port = ENV['PORT'] || 4567
use Rack::Session::Pool, :expire_after => 2592000
set :session_secret, 'super secret'
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
DataMapper.auto_upgrade!

get '/' do
  haml :index
end

get '/sign_up' do
  haml :registro
end

get '/index' do
  haml :index
end

get '/user/:id' do |id|
  #@user = User.get(id)
  haml :usuario
end


get '/user/:id/perfil' do
  #@user = User.get(params[:id])
  #slim :perfil
end

=begin
post '/' do
  if (params[:user][:username].empty?) || (params[:user][:password].empty?)
    flash[:error] = "Error: Usuario o contraseña incorrectas"
    redirect to ('/')
  else
    redirect to("/user/#{user.id}")
  end
end


post '/sign_up' do
  if User.first(:username => "#{params[:user][:username]}")
    flash[:error] = "El nombre de usuario ya está en uso."
    redirect to ('/sign_up')
  else
    user = User.create(params[:user])
    flash[:success] = "Usuario creado correctamente"
    redirect to("/user/#{user.id}")
  end
end


put 'user/:id' do
  user = User.get(params[:id])
  user.update(params[:user])
  redirect to("/user/#{user.id}")
end

delete '/user/:id' do
   User.get(params[:id]).destroy
   redirect to('/user')
end
=end
