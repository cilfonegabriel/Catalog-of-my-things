module BookData
  def load_books
    books_data = HandleData.new('book')
    @books = []
    @labels = []
    books_data.read.map do |book|
      new_book = Book.new(
        publish_date: book['publish_date'],
        publisher: book['publisher'],
        cover_state: book['cover_state']
      )
      label = Label.new(
        title: book['label']['title'],
        color: book['label']['color']
      )
      label.add_item(new_book)
      @labels.push(label)
      @books.push(new_book)
    end
  end

  def save_book(books)
    book_json = []
    books.map do |book|
      book_json.push({
                       id: book.id,
                       archived: book.archived,
                       publisher: book.publisher,
                       cover_state: book.cover_state,
                       publish_date: book.publish_date,
                       label: {
                         id: book.label.id,
                         title: book.label.title,
                         color: book.label.color
                       }
                     })
    end
    HandleData.new('book').write(book_json)
  end
end
