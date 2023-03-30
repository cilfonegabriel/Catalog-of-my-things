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
                       source: game.source,
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
    puts 'Is it muliplayer ? (yes or no):'
    multiplayer = gets.chomp
    puts 'Published Date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Last played date (YYYY-MM-DD):'
    last_played_at = gets.chomp
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
      puts "\t\tList of Games:"
      puts '--------------------------------------------------------'
      @games.each_with_index do |game, index|
        puts " #{index + 1}
          Publish Date: #{game.publish_date}
          Last Played: #{game.last_played_at}
          Author Name: #{game.author.first_name} #{game.author.last_name}"
      end
    end
    puts '=========================================================='
  end

  def author_list
    puts '=========================================================='
    if @authors.empty?
      puts '>>> There aren\'t Authors'
    else
      puts "\t\tList of Authors:"
      puts '--------------------------------------------------------'
      @authors.each_with_index do |author, index|
        puts "#{index + 1}
          Name: #{author.first_name}, #{author.last_name}"
      end
    end
    puts '=========================================================='
  end
end
