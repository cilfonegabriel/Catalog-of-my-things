require_relative '../lib/app'
require_relative './options'

class Menu 
  app = App.new

  puts 'Welcome to our Catalog!'

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
      puts puts "Thank you for using this app!\n\n"
      break
    when '11'
      puts puts "Thank you for using this app!\n\n"
      break
    else
      puts 'Incorrect input, Please choose between 1 and 7'
    end
  end
end
