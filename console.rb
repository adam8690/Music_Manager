require('pry')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')

artist1 = Artist.new({'artist_name' => 'So Solid Codeclan Crew'})
artist2 = Artist.new({'artist_name' => 'AC/DC'})

artist1.save
artist2.save


album1 = Album.new({'album_name' => 'Now Thats What I Call Codeclan 1', 'artist_id' => artist1.artist_id})
album2 = Album.new({'album_name' => 'Back in Black' , 'artist_id' => artist2.artist_id})

album1.save
album2.save



binding.pry
nil
