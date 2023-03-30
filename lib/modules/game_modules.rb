module GameModule
  def load_games
    @games = []
    @authors = []
    games_data= HandleData.new('game')
    games_data.read.map do |game|
      game_instance = Game.new(publish_date: game['publish_date'], multiplayer: game['multiplayer'],
                          last_played_at: game['last_played_at'])
      author = Author.new(
        first_name: game['author']['first_name'],
        last_name: game['author']['last_name']
      )
      game_instance.add_author(author)
      @games.push(game_instance)
      @authors.push(author)
    end
  end

  def save_game(games)
    game_json = []
    games.map do |game|
      game_json.push({
                       id: game.id,
                       archived: game.archived,
                       publish_date: game.publish_date,
                       last_played_at: game.last_played_at,
                       multiplayer: game.multiplayer,
                       author: {
                         id: game.author.id,
                         first_name: game.author.first_name,
                         last_name: game.author.last_name
                       }
                     })
    end
    HandleData.new('game').write(game_json)
  end

  def add_game
    puts '---- Create a game -----'
    multiplayer=""
    loop do
      puts 'Is it muliplayer ? (yes, no, y, n):'
      multiplayer = gets.chomp.downcase
      if ['yes', 'no','y' ,'n'].include? multiplayer
        break
      end  
    end

    publish_date = ''
    men = ''
    loop do
      puts men + 'Published Date (YYYY-MM-DD):'
      publish_date = gets.chomp
      if valid_date? (publish_date) 
        puts '... ok a valid date'
        break
      end  
      men = '>>> Enter a valid date >>> - '
    end

    men = ''
    last_played_at = ''
    loop do
      puts men + 'Last played date (YYYY-MM-DD):'
      last_played_at = gets.chomp
      if valid_date? (last_played_at)
        puts '... ok a valid date'
        break
      end         
      men = '>>> Enter a valid date >>> '
    end

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
