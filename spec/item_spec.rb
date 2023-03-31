require_relative '../lib/item'

describe Item do
    describe '#move_to_archive' do
      context 'when item can be archived' do
        it 'archives the item' do
          item = Item.new(publish_date: '2010-01-01')
          item.move_to_archive
          expect(item.archived).to be true
        end
      end
  
      context 'when item cannot be archived' do
        it 'does not archive the item' do
          item = Item.new(publish_date: '2022-01-01')
          item.move_to_archive
          expect(item.archived).to be false
        end
      end
    end
  
    describe '#add_author' do
      let(:author) { double('Author', items: []) }
  
      context 'when given a valid author' do
        it 'assigns the author to the item and adds the item to the author' do
          item = Item.new(publish_date: '2020-01-01')
          item.add_author(author)
          expect(item.author).to eq(author)
          expect(author.items).to include(item)
        end
      end
  
      context 'when given a nil author' do
        it 'does not assign the author to the item or add the item to the author' do
          item = Item.new(publish_date: '2020-01-01')
          item.add_author(nil)
          expect(item.author).to be_nil
          expect(author.items).not_to include(item)
        end
      end
  
      context 'when the item is already assigned to the author' do
        it 'does not add the item to the author again' do
          item = Item.new(publish_date: '2020-01-01')
          author.items << item
          item.add_author(author)
          expect(author.items.count(item)).to eq(1)
        end
      end
    end
  end