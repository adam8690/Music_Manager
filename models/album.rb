require_relative('../db/sql_runner.rb')

class Album

  attr_reader :album_id
  attr_accessor :album_name

  def initialize( options )
    @artist_id = options['artist_id'].to_i
    @album_name = options['album_name']
    @album_id = options['album_id'].to_i
  end

def save
sql = "INSERT INTO albums (album_name, artist_id) VALUES ('#{@album_name}', #{@artist_id}) RETURNING *;"
@album_id = SqlRunner.run(sql)[0]['id'].to_i
end

def self.all
  sql = "SELECT * FROM albums"
  returned_array = SqlRunner.run(sql)
  mapped_array = returned_array.map {|album| Album.new(album) }
  return mapped_array
end

def update
  sql = "UPDATE albums SET (album_name, artist_id) = ('#{@album_name}', #{@artist_id}) WHERE id = #{@album_id};"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM albums WHERE id = #{@album_id}"
  SqlRunner.run(sql)
end

def show_artist
  sql = "SELECT * FROM artists WHERE id = #{@artist_id}; "
  returned_array = SqlRunner.run(sql)
  return returned_array.map { |artist| Artist.new(artist) }
end

end
