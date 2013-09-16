require 'sinatra'
require 'sinatra/reloader'

=begin
get '/' do
  "hello world"
end

get '/about' do
  "about this site"
end

get '/hello/:name' do
  "hello #{params[:name]}"
end

get '/hello/:name' do |n|
  "hello #{n}"
end

=end

get '/hello/:fname/?:lname?' do |f, l|
  "hello #{f} #{l}"
end

