require_relative '../lib/app'
require_relative './options'

class Menu
  app = App.new
  print "\e[2J\e[f------------------------------------ \n-      Catalog of our Things       -\n"
  loop do
    Option.new.menu_option
    print "----------------------------------- \n--> Select an option (1-9 or x): "
    option = gets.chomp.upcase
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
    when 'X'
      app.save_files
      puts "Thank you for using this app!\n\n"
      break
    end
    print '--> Push any key to continue...'
    gets.chomp
  end
end
