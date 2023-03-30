require_relative '../lib/genre'

describe Genre do
  describe '#initialize' do
    context 'with valid input' do
      let(:genre) { Genre.new(name: 'Rock') }

      it 'sets the name attribute' do
        expect(genre.name).to eq('Rock')
      end

      it 'sets a unique id attribute' do
        expect(genre.id).not_to be_nil
      end

      it 'initializes the items array as empty' do
        expect(genre.items).to be_empty
      end
    end
  end
end
