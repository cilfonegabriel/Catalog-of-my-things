require_relative '../lib/author'
require_relative '../lib/item'
require 'securerandom'
require 'date'

describe Author do
  before(:each) do
    @author = Author.new(first_name: 'Ivan', last_name: 'Martinez')
    @item = Item.new(publish_date: Date.today)
  end

  it 'it should return the first name of author correctly' do
    expect(@author.first_name).to eq('Ivan')
  end

  it 'it should return the last name of author correctly' do
    expect(@author.last_name).to eq('Martinez')
  end

  it 'Should add an item correctly' do
    before_length = @author.items.length
    @author.add_item(@item)
    expect(@author.items.length).to eq(before_length + 1)
  end

  it 'Should return author for item correctly' do
    @author.add_item(@item)
    expect(@item.author).to eq(@author)
  end

  it 'it is an instance of Author class' do
    expect(@author).to be_instance_of(Author)
  end
end
