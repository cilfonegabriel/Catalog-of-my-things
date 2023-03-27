class Item
  def initialize(publish_date:)
    @id = SecureRandom.hex(10)
    @publish_date = publish_date
    @archived = false
    @source = nil
  end

  attr_accessor :genre, :author, :label
  attr_reader :id, :publish_date, :archived

  def can_be_archived?
    return true if Date.strptime(publish_date, '%d/%m/%Y') < Date.today - 365

    false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
