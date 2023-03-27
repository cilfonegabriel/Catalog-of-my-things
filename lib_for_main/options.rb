class Options

    def display
      puts 'Please type the number of your selection'
      option = gets.chomp.to_i
  
      select(option)
    end
  
    def select(option)
      choice = {
        1 => 'book_list', 2 => 'album_list', 3 => 'game_list', 
        4 => 'genre_list', 5 => 'label_list', 6 => 'author_list',
        7 => 'add_book', 8 => 'add_album', 9 => 'add_movie', 
        10 => 'add_game', 11 => 'exit'
      }
  
      case option
      when 1..11
        choice[option]
      else
        puts 'Invalid option'
      end
    end
  end