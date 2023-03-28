require 'securerandom'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(id : SecureRandom.uuid, publish_date:)
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    Date.today.year - @published_date.year > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end
end
