require_relative './helpers/handle_data'
require_relative './modules/music_album'
require_relative './music_album'
require_relative './genre'

require_relative './modules/game_modules'
require_relative './game'
require_relative './author'

class App
  include MusicAlbumModule
  include GameModule

  def initialize
    load_music_albums
    load_games
  end

  def save_files
    save_music_albums(@music_albums)
    save_game(@games)
  end
end
