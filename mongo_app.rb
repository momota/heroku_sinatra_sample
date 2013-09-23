require 'sinatra'
require 'sinatra/reloader'
require 'mongo'
require 'uri'



def get_connection
  return @db_connection if @db_connection
  db = URI.parse(ENV['MONGOHQ_URL'])
  db_name = db.path.gsub(/^\//, '')
  @db_connection = Mongo::Connection.new(db.host, db.port).db(db_name)
  @db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
  @db_connection
end


# filter
before do
  db_con = get_connection
  @comments = db_con.collection('comments')
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

