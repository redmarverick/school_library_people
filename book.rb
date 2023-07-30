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
end
