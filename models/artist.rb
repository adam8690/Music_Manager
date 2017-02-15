require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :artist_id
  attr_accessor :artist_name

  def initialize( options )
    @artist_name = options['artist_name']
    @artist_id = options['id'].to_i
  end


def save
sql = "INSERT INTO artists (artist_name) VALUES ('#{@artist_name}') RETURNING *;"
@artist_id = SqlRunner.run(sql)[0]['id'].to_i
end

def self.all
sql = "SELECT * FROM artists"
returned_array = SqlRunner.run(sql)
mapped_array = returned_array.map {|artist| Artist.new(artist) }
return mapped_array
end




















end
