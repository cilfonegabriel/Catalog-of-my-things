require_relative './helpers/handle_data'
require_relative './modules/music_album'
require_relative './music_album'
require_relative './genre'

class App
  include MusicAlbumModule

  def initialize
    load_music_albums
  end

  def save_files
    save_music_albums(@music_albums)
  end
end
