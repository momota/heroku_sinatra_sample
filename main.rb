require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "hello world"
end

get '/about' do
  "about this site"
end

