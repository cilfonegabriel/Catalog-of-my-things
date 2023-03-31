require_relative '../lib/music_album'
require_relative '../lib/genre'
require 'date'

describe 'Music Album class test cases.' do
    context 'Three parameters will be assigned.' do
        it 'Will return an object' do
          album = MusicAlbum.new(publish_date: '2022-04-10', on_spotify: true)
          expect(album).to be_an_instance_of MusicAlbum
        end
     end
end

