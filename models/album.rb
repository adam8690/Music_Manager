require_relative('../db/sql_runner.rb')

class Album

  attr_reader :album_id
  attr_accessor :album_name

  def initialize( options )
    @album_name = options['album_name']
    @album_id = options['album_id'].to_i
  end

end
