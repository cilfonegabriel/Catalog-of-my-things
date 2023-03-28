require_relative './item'
require_relative './genre'
require 'date'

class MusicAlbum < MusicItem
  attr_accessor :on_spotify

  def initialize(publish_year, on_spotify: false)
    super(publish_year, is_archived: false)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def self.load_albums
    file = File.open('../data/music_lbums.json', 'r')
    data = JSON.parse(file) || []
    file.close
    data
  end
end