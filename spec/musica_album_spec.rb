require_relative '../lib/music_album'
require_relative '../lib/genre'
require 'date'

describe 'Music Album class test cases.' do
  context 'Three parameters will be assigned.' do
    it 'Will return an object' do
      album = MusicAlbum.new(publish_date: '2022-04-10', on_spotify: true)
      expect(album).to be_an_instance_of MusicAlbum
    end

    it 'Checks if it can be archived case: false' do
      album = MusicAlbum.new(publish_date: '2021-05-06', on_spotify: false)
      expect(album.can_be_archived?).to be false
    end

    it 'Checks if it can be archived case: true' do
      album = MusicAlbum.new(publish_date: '2002-05-06', on_spotify: true)
      expect(album.can_be_archived?).to be true
    end
  end
end
