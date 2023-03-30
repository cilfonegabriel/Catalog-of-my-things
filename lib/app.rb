require_relative './helpers/handle_data'
require_relative './modules/music_album'
require_relative './music_album'
require_relative './genre'
require_relative './modules/app_book'
require_relative './modules/app_book_data'
require_relative './book'
require_relative './label'
require_relative './modules/game_modules'
require_relative './modules/game_data_modules'
require_relative './game'
require_relative './author'

class App
  include MusicAlbumModule
  include GameModule
  include GameDataModule
  include BookModule
  include BookData

  def initialize
    load_music_albums
    load_games
    load_books
  end

  def save_files
    save_music_albums(@music_albums)
    save_game(@games)
    save_book(@books)
  end
end
