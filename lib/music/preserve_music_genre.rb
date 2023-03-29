class PreserveMusicGenre
  def self.albums(album)
    author = {
      id: album.author.id,
      first_name: album.author.first_name,
      last_name: album.author.last_name
    }

    music_album = {
      id: album.id,
      on_spotify: album.on_spotify,
      publish_date: album.publish_year,
      is_archived: album.is_archived,
      author: author
    }

    file = '../../data/music_album.json'
    File.write(file, '[]') unless File.exist?(file)
    albums_data = File.read(file)
    @music_albums = JSON.parse(albums_data)
    @music_albums << music_album
    File.write(file, JSON.pretty_generate(@music_albums))
  end

  def self.genre(genre)
    nmusic_genre = {
      id: genre.id,
      name: genre.name
    }

    file = '../../data/genre.json'
    File.write(file, '[]') unless File.exist?(file)
    genres_data = File.read(file)
    @genres = JSON.parse(genres_data)
    @genres << nmusic_genre
    File.write(file, JSON.pretty_generate(@genres))
  end
end