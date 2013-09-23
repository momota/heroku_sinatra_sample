require 'sinatra'
require 'sinatra/reloader'
require 'mongo'
require 'uri'

# filter
before do
  db = URI.parse( ENV['MONGOHQ_URL'] )
  db_name = db.path.gsub(/^\//, '')
  db_con  = Mongo::Connection.new(db.host, db.port).db(db_name)
  db_con.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
  @comments = db_con.db('sinatra_sample').collection('comments')
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

