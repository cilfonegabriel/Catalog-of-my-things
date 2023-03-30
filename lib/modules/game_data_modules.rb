module GameDataModule
  def load_games
    @games = []
    @authors = []
    games_data = HandleData.new('game')
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
end
