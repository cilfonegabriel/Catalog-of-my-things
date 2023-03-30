require_relative '../lib/app'
require_relative './options'

class Menu
  app = App.new

  puts "\nWelcome to the Catalog of my things App!"
  puts "\n"

  loop do
    Option.new.menu_option
    option = gets.chomp
    case option
    when '1'
      app.book_list
    when '2'
      app.music_album_list
    when '3'
      app.game_list
    when '4'
      app.genre_list
    when '5'
      app.label_list
    when '6'
      app.author_list
    when '7'
      app.add_book
    when '8'
      app.add_music_album
    when '9'
      app.add_game
    when '10'
      app.save_files
      puts "\n"
      puts puts "Hope you have a great day, thank you for using the App!\n"
      break
    else
      puts "\nWrong input, select an option by entering a corresponding number!\n"
    end
  end
end
