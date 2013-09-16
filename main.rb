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

get '/hello/:fname/?:lname?' do |f, l|
  "hello #{f} #{l}"
end

get '/from/*/to/*' do |f, t|
  "from #{f} to #{t}"
end

get %r{/users/([0-9]+)} do |i|
  "user id = #{i}"
end

=end

get '/:name' do |n|
  @name  = n
  @title = 'sinatra sample'
  erb :index
end

