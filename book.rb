# book.rb
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title = nil, author = nil)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def to_hash
    {
      'title' => title,
      'author' => author
    }
  end

  def self.from_hash(hash)
    title = hash['title']
    author = hash['author']
    new(title, author)
  end
end
