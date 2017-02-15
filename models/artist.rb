require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :artist_id
  attr_accessor :artist_name

  def initialize( options )
    @artist_name = options['artist_name']
    @artist_id = options['artist_id'].to_i
  end

end
