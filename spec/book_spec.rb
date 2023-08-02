# spec/book_spec.rb

require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('Sample Title', 'Sample Author') }

  describe '#initialize' do
    it 'sets title and author' do
      expect(book.title).to eq('Sample Title')
      expect(book.author).to eq('Sample Author')
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      rental = double('Rental')
      book.add_rental(rental)

      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_hash' do
    it 'converts the book object to a hash' do
      expected_hash = {
        'title' => 'Sample Title',
        'author' => 'Sample Author'
      }
      expect(book.to_hash).to eq(expected_hash)
    end
  end

  describe '.from_hash' do
    it 'creates a new Book object from a hash' do
      hash = {
        'title' => 'Sample Title',
        'author' => 'Sample Author'
      }
      new_book = Book.from_hash(hash)

      expect(new_book).to be_a(Book)
      expect(new_book.title).to eq('Sample Title')
      expect(new_book.author).to eq('Sample Author')
    end
  end
end
