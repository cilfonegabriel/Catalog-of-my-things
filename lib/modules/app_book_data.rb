module BookData
    def load_books
        books_data = HandleData.new('book')
        @books = []
        @labels = []
        books_data.read.map do |book|
          new_book = Book.new(publish_date: book['publish_date'], publisher: book['publisher'],
                              cover_state: book['cover_state'])
          label = Label.new(title: book['label']['title'], color: book['label']['color'])
          label.add_item(new_book)
          @labels.push(label)
          @books.push(new_book)
        end
    end
end