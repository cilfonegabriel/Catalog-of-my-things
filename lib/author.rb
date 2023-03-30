require 'securerandom'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name:, last_name:)
    @id = SecureRandom.uuid
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items.push(item)
  end
end

# @im-20230328 test temp - borrar
# a = Author.new("Gabriel", "Garcia Marquez")
# p a
