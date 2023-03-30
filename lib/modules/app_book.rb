module BookModule
  def book_list
    if @books.empty?
      puts "\nThe Book list is empty, add a new Book in the menu\n"
    else
      puts "\nBook list:\n"
      @books.each_with_index do |book, i|
        puts "#{i + 1} -
            Label: #{book.label.title}
            Published Date: #{book.publish_date}
            Publisher: #{book.publisher}
            Cover State: #{book.cover_state}"
      end
    end
  end

  def add_book
    puts "\nEnter the Book info here\n"
    puts "\nEnter the Title's name:\n"
    book_title = gets.chomp
    puts "\nEnter the book's publish date:\n"
    book_publish = gets.chomp
    puts "\nEnter the book's publisher:\n"
    book_publisher = gets.chomp
    puts "\nEnter the book's cover state:\n"
    book_cover = gets.chomp
    puts "\nEnter the book's cover color:\n"
    book_color = gets.chomp
    label = Label.new(title: book_title, color: book_color)
    book = Book.new(publish_date: book_publish, publisher: book_publisher, cover_state: book_cover)
    label.add_item(book)
    @books.push(book)
    puts 'The Book has been created successfully'
  end

  def label_list
    if @labels.empty?
      puts "\nThe Label list is empty, add a newo Book in the menu\n"
    else
      puts "\n\nLabel list:"
      @labels.each_with_index do |label, i|
        puts "#{i + 1} -
            Title: #{label.title}
            Color: #{label.color}"
      end
    end
  end
end
