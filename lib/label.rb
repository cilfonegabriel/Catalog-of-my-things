require 'securerandom'

class Label
  attr_accessor :title, :color

  def initialize(title, color)
    @id = SecureRandom.uuid
    @title = title
    @color = color
  end

  def add_item(item)
    @item << item
    item.label << self
  end
end
