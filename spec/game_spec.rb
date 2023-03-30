require_relative '../lib/game'
require_relative '../lib/item'
require 'securerandom'
require 'date'

describe Game do
  before(:each) do
    # @game = Game.new(publish_date: '03/01/2011', multiplayer: 'xxx', last_played_at: '01/01/2020')
    @game = Game.new(publish_date: '2011-01-01', multiplayer: 'xxx', last_played_at: '2020-01-01')
  end

  it 'Should return true if published years > 10 and last played > 2' do
    new_game = Game.new(publish_date: '03/01/1900', multiplayer: 'xxx', last_played_at: '01/01/2020')
    expect(new_game.send(:can_be_archived?)).to be true
  end

  it 'Should return false if published years > 10 and last played < 2' do
    new_game = Game.new(publish_date: '03/01/1900', multiplayer: 'xxx', last_played_at: '01/01/2023')
    expect(new_game.send(:can_be_archived?)).to be false
  end

  it 'Should return false if published years < 10 and last played > or < 2' do
    new_game = Game.new(publish_date: '03/01/2023', multiplayer: 'yes', last_played_at: '01/01/2023')
    expect(new_game.send(:can_be_archived?)).to be false
  end

  it 'it is an instance of Game class' do
    expect(@game).to be_instance_of(Game)
  end

  it 'Should return correctly for can_be_archived method' do
    expect(@game.send(:can_be_archived?)).to be true
  end
end
