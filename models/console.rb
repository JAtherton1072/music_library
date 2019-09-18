require_relative('./album')
require_relative('./artist')
require('pry')



new_artist1 = {
 'name' => 'Kylie Minogue'
}
new_artist1 = Artist.new(new_artist1)
new_artist1.save




new_artist2 = {
 'name' => 'Robbie Williams'
}
new_artist2 = Artist.new(new_artist2)
new_artist2.save

new_albums1 = {
 'title' => 'Spinning Around',
 'genre' => 'Pop',
 'artists_id' => new_artist1.artists_id
}

new_albums2 = {
 'title' => 'Let me entertain you',
 'genre' => 'Pop',
 'artists_id' => new_artist2.artists_id
}


new_album1 = Album.new(new_albums1)
new_album2 = Album.new(new_albums2)

new_album1.save
new_album2.save

# # all_artists = Artist.all
# all_albums = Album.all
album_by_artist_id = Album.find(2)

binding.pry
