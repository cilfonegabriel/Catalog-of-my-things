class MusicItem
    attr_accessor :publish_year, :is_archive
    attr_reader :id, :genre, :author, :label

    def initialize(publish_year = Date.today, id = SecureRandom.uuid, is_archive = false)
        @id = id
        @publish_year = publish_year
        @is_archive = is_archive
    end

    def genre = (genre)
        @genre = genre
        genre.item.push(self) unless genre.item.include?(self)
    end

    def author = (author)
        @author = author
        author.item.push(self) unless author.item.include?(self)
    end

    def label = (label)
        @label = label
        label.item.push(self) unless label.include?(self)
    end

    def move_to_archive
        @is_archive = true if can_be_archived?
    end

    private

    def can_be_archived?
        (Date.today - Date.parse(@publish_year)).to_i / 365 > 10
    end
end