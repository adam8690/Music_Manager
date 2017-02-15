require('pry')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')

album1 = Album.new({'album_name' => 'Now Thats What I Call Codeclan 1'})
album2 = Album.new({'album_name' => 'Back in Black'})

artist1 = Artist.new({'artist_name' => 'So Solid Codeclan Crew'})
artist2 = Artist.new({'artist_name' => 'AC/DC'})

binding.pry
nil
