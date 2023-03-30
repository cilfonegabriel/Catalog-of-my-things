require_relative '../lib/book'
require_relative '../lib/item'

describe Book do
    context 'Test the Book class' do
        it 'Create an instance object of the class book' do
            book_one = Book.new(publisher: 'Sony', cover_state: 'good', publish_date: '2023-03-30')
            expect(book_one).to be_instance_of(Book)
        end

        it 'Check if it can be archived case: true' do
            book_two = Book.new(publisher: 'JK Books', cover_state: 'bad', publish_date: '1990-12-25')
            expect(book_two.can_be_archived?).to be true
        end
    end
end