# rental.rb
class Rental
    attr_accessor :date, :book, :person
  
    def initialize(date = nil, book = nil, person = nil)
      @date = date
      @book = book
      @person = person
      book&.add_rental(self)
      person&.add_rental(self)
    end
  end
  