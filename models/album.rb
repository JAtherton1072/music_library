require_relative('../db/sql_runner')

  class Album

    attr_reader(:album_id)
    attr_accessor(:title, :genre)


    def initialize(options)
      @album_id = options['album_id'].to_i if options['album_id']
      @title = options['title']
      @genre = options['genre']
      @artists_id = options['artists_id'].to_i

    end


    def save
      sql = "INSERT INTO albums (title, genre, artists_id)
      VALUES ($1, $2, $3) RETURNING album_id"
      values = [@title, @genre, @artists_id]
      new_album = SqlRunner.run(sql, values)
      @album_id = new_album[0]['album_id']
    end


    def Album.all

      sql = "SELECT * FROM albums"
      album_hash = SqlRunner.run(sql)
      albums = album_hash.map { |album| Album.new(album)}
      return albums

    end




    def Album.find(artists_id)
       sql = "SELECT * FROM albums
       WHERE id = $1"
       values = [artists_id]
       results = SqlRunner.run(sql, values)
       album_hash = results.first
       album = Album.new(album_hash)
       return album
     end




  end
