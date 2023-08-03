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

  # Convert a Book object to a hash
  def to_hash
    {
      'title' => title,
      'author' => author
    }
  end

  # Create a Book object from a hash
  def self.from_hash(hash)
    title = hash['title']
    author = hash['author']
    new(title, author)
  end
end
