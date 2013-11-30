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


get '/' do
  haml: :index
end

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


post '/user' do
  if (params[:user][:username].empty?) || (params[:user][:password].empty?)
    flash[:error] = "Error: Usuario o contraseña incorrectas"
    redirect to ('/')
  elsif User.first(:username => "#{params[:user][:username]}")
    flash[:error] = "El nombre de usuario ya está en uso."
    redirect to ('/user/sign_up')
  else
    user = User.create(params[:user])
    flash[:success] = "Usuario creado correctamente"
    redirect to("/user/#{user.id}")
  end
end

