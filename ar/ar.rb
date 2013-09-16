require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter"  => "sqlite3",
  "database" => "./blog.db"
)

class Post < ActiveRecord::Base
end

# Post.create(:title => "title4", :body => "body4")

p Post.all
p Post.first
p Post.last
p Post.find( 3 )
p Post.find_by_title( "title2" )
p Post.find_by_title_and_id("title2", 2)

