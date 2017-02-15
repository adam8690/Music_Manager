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

# Trying to stop duplicate artists being entered into database with postgres. 

# # INSERT INTO example_table
# #     (id, name)
# # SELECT 1, 'John'
# # WHERE
# #     NOT EXISTS (
# #         SELECT id FROM example_table WHERE id = 1
# #     );

# def save
# sql = "INSERT INTO artists (artist_name) VALUES ('#{@artist_name}') RETURNING * WHERE NOT EXISTS ();"
# @artist_id = SqlRunner.run(sql)[0]['id'].to_i
# end




def self.all
sql = "SELECT * FROM artists"
returned_array = SqlRunner.run(sql)
mapped_array = returned_array.map {|artist| Artist.new(artist) }
return mapped_array
end

def update
  sql = "UPDATE artists SET (artist_name) = ('#{@artist_name}') WHERE id = #{@artist_id};"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM artists WHERE id = #{@artist_id}"
  SqlRunner.run(sql)
end

def list_albums
  sql = "SELECT * FROM albums WHERE artist_id = #{@artist_id}"
  return SqlRunner.run(sql).map { |album| Album.new(album) }
end














end
