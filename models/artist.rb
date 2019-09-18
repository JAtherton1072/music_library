require_relative('../db/sql_runner')

  class Artist

    attr_reader(:artists_id)
    attr_accessor(:name)


    def initialize(options)
      @artists_id = options['artists_id'].to_i if options['artists_id']
      @name = options['name']
    end


    def save
      sql = "INSERT INTO artists (name)
      VALUES($1) RETURNING artists_id"
      values = [@name]
      new_artist = SqlRunner.run(sql, values)
      @artists_id = new_artist[0]['artists_id']
    end


    def Artist.all

      sql = "SELECT * FROM artists"
      artist_hash = SqlRunner.run(sql)
      artists = artist_hash.map { |artist| Artist.new(artist)}
      return artists

    end


    # def Artist.albums(artists_id)
    #
    # sql = "SELECT * FROM albums
    # WHERE artists_id = $1"
    # values = [artists_id]
    # albums = SqlRunner.run( sql, values )
    # result = albums.map { |album_hash| Album.new( album_hash ) }
    # return result
    #
    # end




end
