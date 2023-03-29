require 'securerandom'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(author, label, publish_date, archived: false)
    @id = SecureRandom.uuid
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    Date.today.year - @published_date.year > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
