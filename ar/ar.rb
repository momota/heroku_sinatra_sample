require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter"  => "sqlite3",
  "database" => "./blog.db"
)

class Post < ActiveRecord::Base
end

post = Post.new(:title => "title1", :body => "body1")
post.save

p Post.all
