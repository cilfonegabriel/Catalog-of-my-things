module GameModule
  def add_game
    puts '---- Create a game -----'

    multiplayer = input_multiplayer

    publish_date = input_publish_date

    last_played_at = input_last_played_at

    game_instance = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)

    puts 'Game Author: '
    puts 'Author First Name: '
    first_name = gets.chomp
    puts 'Author Last Name: '
    last_name = gets.chomp

    author_instance = Author.new(first_name: first_name, last_name: last_name)
    game_instance.add_author(author_instance)
    @authors.push(author_instance)
    @games.push(game_instance)
    puts 'Game Created ...'
  end

  def input_multiplayer()
    loop do
      puts 'Is it muliplayer ? (yes, no, y, n):'
      multiplayer = gets.chomp.downcase
      return multiplayer if %w[yes no y n].include? multiplayer
    end
  end

  def input_publish_date
    publish_date = ''
    men = ''
    loop do
      print men
      print ' Published Date (YYYY-MM-DD): '
      publish_date = gets.chomp
      if valid_date?(publish_date)
        puts '... ok a valid date'
        return publish_date
      end
      men = '>>> Enter a valid date >>> - '
    end
  end

  def input_last_played_at
    men = ''
    last_played_at = ''
    loop do
      print men
      print ' Last played date (YYYY-MM-DD): '
      last_played_at = gets.chomp
      if valid_date?(last_played_at)
        puts '... ok a valid date'
        return last_played_at
      end
      men = '>>> Enter a valid date >>> '
    end
  end

  def game_list
    puts '=========================================================='
    if @games.empty?
      puts '>>> There aren\'t games'
    else
      puts "\tList of Games"
      puts '--------------------------------------------------------'
      @games.each_with_index do |game, index|
        print " #{index + 1}  - Publish Date: #{game.publish_date}"
        print "\n    - Last Played: #{game.last_played_at}"
        print "\n    - Author Name: #{game.author.first_name} #{game.author.last_name}\n"
      end
    end
    puts '=========================================================='
  end

  def author_list
    puts '=========================================================='
    if @authors.empty?
      puts '>>> There aren\'t Authors'
    else
      puts "\tList of Authors:"
      puts '--------------------------------------------------------'
      @authors.each_with_index do |author, index|
        puts "#{index + 1} - Name: #{author.first_name}, #{author.last_name}"
      end
    end
    puts '=========================================================='
  end

  def valid_date?(date)
    # date_format = '%d-%m-%Y'
    date_format = '%Y-%m-%d'
    DateTime.strptime(date, date_format)
    true
  rescue ArgumentError
    false
  end
end
