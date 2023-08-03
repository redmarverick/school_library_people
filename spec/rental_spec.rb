require_relative '../rental'
require_relative '../book'
require_relative '../student'
require_relative '../teacher'
require 'date' 

RSpec.describe Rental do
  let(:book) { Book.new('Book Title', 'Author Name') }
  let(:person) { Student.new('John Doe', 20) }

  describe '#initialize' do
    it 'creates a new rental with date, book, and person' do
      date = Date.new(2023, 8, 2)
      rental = Rental.new(date, book, person)

      expect(rental).to be_a(Rental)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end

  describe '#to_hash' do
    it 'converts the rental object to a hash' do
      date = Date.new(2023, 8, 2)
      rental = Rental.new(date, book, person)

      expected_hash = {
        'date' => '2023-08-02',
        'book' => book.to_hash,
        'person' => person.to_hash
      }
      expect(rental.to_hash).to eq(expected_hash)
    end
  end

  describe '.from_hash' do
    it 'creates a new Rental object from a hash' do
      date = Date.new(2023, 8, 2)
      book_hash = {
        'title' => 'Book Title',
        'author' => 'Author Name'
      }
      person_hash = {
        'type' => 'Student',
        'name' => 'John Doe',
        'age' => 20,
        'parent_permission' => true,
        'id' => 'P1234'
      }
      hash = {
        'date' => '2023-08-02',
        'book' => book_hash,
        'person' => person_hash
      }

      new_rental = Rental.from_hash(hash)

      expect(new_rental).to be_a(Rental)
      expect(new_rental.date).to eq(date)
      expect(new_rental.book.title).to eq('Book Title')
      expect(new_rental.book.author).to eq('Author Name')
      expect(new_rental.person.name).to eq('John Doe')
      expect(new_rental.person.age).to eq(20)
      expect(new_rental.person.id).to eq('P1234')
    end
  end
end
