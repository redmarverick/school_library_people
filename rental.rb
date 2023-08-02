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
    def to_hash
      {
        'date' => date.to_s,
        'book' => book.to_hash,
        'person' => person.to_hash
      }
    end
  
    def self.from_hash(hash)
      date = Date.parse(hash['date'])
      book_hash = hash['book']
      person_hash = hash['person']
  
      book = Book.from_hash(book_hash)
      person_type = person_hash['type']
      person = if person_type == 'Student'
                 Student.from_hash(person_hash)
               elsif person_type == 'Teacher'
                 Teacher.from_hash(person_hash)
               else
                 raise ArgumentError, "Invalid person type: #{person_type}"
               end
  
      rental = Rental.new(date, book, person)
      rental
    end
  end
  