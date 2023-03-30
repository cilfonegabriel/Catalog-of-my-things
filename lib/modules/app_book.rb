module BookModule
    def book_list
      if @books.empty?
        puts "\nThe Book list is empty, add a new Book in the menu\n"
      else
        puts "\nBook list:\n"
        @books.each_with_index do |book, index|
          puts "#{index + 1} -
            Label: #{book.label.title}
            Published Date: #{book.publish_date}
            Publisher: #{book.publisher}
            Cover State: #{book.cover_state}"
        end
      end
    end
    
    def label_list
      if @labels.empty?
        puts "\nThe Label list is empty, add a newo Book in the menu\n"
      else
        puts "\n\nLabel list:"
        @labels.each_with_index do |label, index|
          puts "#{index + 1} -
            Title: #{label.title}
            Color: #{label.color}"
        end
      end
    end  
end
  