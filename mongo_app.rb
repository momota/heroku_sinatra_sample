require 'sinatra'
require 'sinatra/reloader'
require 'mongo'

# filter
before do
  db_con = Mongo::Connection.new('localhost', 27017)
  @db    = db_con.db('sinatra_sample')
  @comments = @db.collection('comments')
end

#
# helper
#
helpers do
  # escape html
  include Rack::Utils
  alias_method :h, :escape_html
end

#
# GET
#
get '/' do
  erb :index
end

#
# POST
#
post '/new' do
  @comments.insert( :body => params[:body] )
  redirect '/'
end

post '/delete' do
  id = BSON::ObjectId( params[:id] )
  @comments.find('_id' => id).each { |d_comment|
    @comments.remove( d_comment )
  }
end

