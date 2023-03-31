require 'date'
require 'securerandom'
require_relative './item'
require_relative './author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date:, multiplayer:, last_played_at: Date.today)
    super(publish_date: publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && ((Date.today.year - Date.parse(@last_played_at).year) > 2)
  end
end
