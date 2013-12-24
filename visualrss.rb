require './index.rb'

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


get '/perfil' do
  haml :perfil
end


get '/new_rss' do
  haml :new_rss
end


post '/new_rss' do
  rss2 = " #{params[:user][:rss]}"
  rss_title2 = " #{params[:user][:rss_titulo]}"
  un_usuario = User.first(:username => session["user"])
  un_usuario.rss << rss2
  un_usuario.titulo_rss << "####{rss_title2}"
  User.first(:username => session["user"]).update(:rss => un_usuario.rss)
  User.first(:username => session["user"]).update(:titulo_rss => un_usuario.titulo_rss)
  redirect to ('/')
end


get '/cambiar' do
  @titulos = User.first(:username => "#{session[:user]}").titulo_rss
  @rsss = User.first(:username => "#{session[:user]}").rss
  @titulos = @titulos.split("### ")
  @rsss = @rsss.split(" ")
  User.first(:username => session["user"]).update(:rss_used => @rsss[$next])
  User.first(:username => session["user"]).update(:titulo_used => @titulos[$next])
  redirect to ('/')
end


get '/index' do
  haml :index
end


get '/user/:id' do |id|
  @user = User.get(id)
end


get '/user/:id/perfil' do
  @user = User.get(params[:id])
end


post '/' do
  if (params[:user][:username].empty?) || (params[:user][:password].empty?)
    flash[:error] = "Error: The user or the password field is empty"
    redirect to ("/")
  elsif User.first(:username => "#{params[:user][:username]}", :password => "#{params[:user][:password]}")
    flash[:login] = "Login successfully"
    session["user"] = "#{params[:user][:username]}"
    redirect to ('/')
  else
    flash[:error] = "The user doesn't exist or the password is invalid"
    redirect to ('/')
  end
end


post '/sign_up' do
  if (params[:user][:username].empty?) || (params[:user][:password].empty?)
    redirect to ('/sign_up')
  elsif User.first(:username => "#{params[:user][:username]}")
    redirect to ('/sign_up')
  else
    user = User.create(params[:user])
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


use Rack::Static, :urls => ["/public"]
