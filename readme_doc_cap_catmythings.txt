Documment ggdiaz - Capstone-catalogue-of-my-things

main.rb
	Menu.new
		app = App.new
		loop do
			menu options
				12-app.add_game


--------------------------------------
# lib/modules/game.rb - include in App class 
module GameModule
	- def load_games
		- games_data = HandleData.new('game')...read
			- new_game = Game.new(...)
			- author = Author.new(...)
			- new_game.add_author(author)
			- @games.push(new_game)
			- @authors.push(author)
		
	- def add_game 
		- (date entry - puts- gets.chomp)
		- new_game.add_author(author)
		- @games.push(new_game)
		- @authors.push(author)

	- def game_list
		@games.each_with_index do |game, index|
			puts...
			
	- def author_list
		@authors.each_with_index do |author, index|
			puts...
			
	- def save_game(games)
		- game_json = []
		- games.map do |game|
			- game_json.push({...
		- HandleData.new('game').write(game_json)	
		
---------------------------------------------------
# lib/game.rb - class Game - (simple)

require_relative './item'
require_relative './author'
require 'date'
require 'securerandom'

class Game < Item
def initialize(publish_date:, multiplayer:, last_played_at: Date.today)
    super(publish_date: publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super() && year_since_last_played_at > 2
  end

  def year_since_last_played_at
    d = (Date.today - Date.parse(last_played_at)) / 365
    d.to_i
  end
------------------------------------------
# lib/author.rb - class Author - (simple)

require 'securerandom'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name:, last_name:)
    @id = SecureRandom.hex(10)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items.push(item)
  end
end

# app.rb - Class App

require_relative './helpers/handle_data'
require_relative './game'
require_relative './modules/game'
require_relative './modules/book'
require_relative './modules/music_album'
require_relative './modules/movies'
require_relative './book'
require_relative './music_album'
require_relative './genre'
require_relative './movie'

class App
  include GameModule
  include BookModule
  include MusicAlbumModule
  include MovieModule

  def initialize
    load_movies
    load_games
    load_music_albums
    load_books
  end

  def save_files
    save_game(@games)
    save_book(@books)
    save_music_albums(@music_albums)
    save_movies(@movies)
  end
end
				