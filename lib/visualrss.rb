require './lib/index.rb'






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
  @user = User.get(id)
  #haml :usuario
end


get '/user/:id/perfil' do
  @user = User.get(params[:id])
  #slim :perfil
end



post '/' do
  @totalidad = User.all
  @totalidad.each do |user|
    "#{user.username}"
  end
=begin
  if (params[:user][:username].empty?) || (params[:user][:password].empty?)
    #redirect to ('/')
  else
    session["user"] = "#{params[:user][:username]}" 
    @user = User.get(params[:id])
    #redirect to("/")
  end
=end
end


post '/sign_up' do
  if (params[:user][:username].empty?) || (params[:user][:password].empty?)
    #flash[:error] = "Error: The user or the password field is empty"
    redirect to ('/sign_up')
  elsif User.first(:username => "#{params[:user][:username]}")
    #flash[:error] = "The user has been already created"
    redirect to ('/sign_up')
  else
    user = User.create(params[:user])
    #flash[:success] = "User created successfully"
    #flash[:login] = "Login successfully"
    session["user"] = "#{params[:user][:username]}"
    redirect to("/")
  end
end

get '/logout' do
  user = User.get(params[:id])
  session["user"] = nil
  session.clear
  redirect to ("/")
end

put 'user/:id' do
  user = User.get(params[:id])
  user.update(params[:user])
  redirect to("/user/#{user.id}")
end

=begin
delete '/user/:id' do
   User.get(params[:id]).destroy
   redirect to('/user')
end
=end
