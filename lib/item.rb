require 'securerandom'
require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :author, :label, :genre

  def initialize(publish_date:, archived: false, id: SecureRandom.hex(10))
    @id = id
    @publish_date = publish_date
    @archived = archived
    @author = nil
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_author(author)
    @author = author
    return if author.nil?

    author.items.push(self) unless author.items.include?(self)
  end

  private

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)).to_i / 365 > 10
  end
end
