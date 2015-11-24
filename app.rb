require 'bundler'
Bundler.require

get '/' do
  "Hello world"
end

get '/home' do
 erb :home
end

get '/login' do
  erb :login
end

get '/registration' do
  erb :registration
end
