require 'mongo'

# connect to db
con = Mongo::Connection.new

puts "*** db list ***"
puts con.database_names

puts "------------------------------------"

puts "*** db info (name, byte, ...) ***"
con.database_info.each { |info| puts info.inspect }


db = con.db('mongo_test')
col = db.collection('test_col')
data = {
  'name' => 'mongodb',
  'type' => 'database',
  'count' => 1,
  'info' => {
    'x' => 203,
    'y' => 555
  }
}
id = col.insert( data )
10.times { |i|
  col.insert( 'i' => i)
}

puts "------------------------------------"
puts "*** collection list ***"
puts db.collection_names

puts "*** all documents from collectio ***"
p col.find
puts col.find.each { |row| puts row.inspect }


puts "------------------------------------"
puts "*** delete collection ***"
puts db.collection_names
col.drop
puts db.collection_names

puts "*** drop db ***"
puts con.database_names
con.drop_database('mongo_test')
puts con.database_names

