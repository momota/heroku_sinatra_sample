require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter"  => "sqlite3",
  "database" => "./blog.db"
)

class Post < ActiveRecord::Base
end

=begin
post = Post.new(:title => "title1", :body => "body1")
post.save
=end

post2 = Post.new
post2.title = "title2"
post2.body  = "body2"
post2.save

post3 = Post.new do |p|
  p.title = "title3"
  p.body  = "body3"
end
post3.save

Post.create(:title => "title4", :body => "body4")


p Post.all
