# spec/person_spec.rb

require_relative '../person'

RSpec.describe Person do
  let(:person) { Person.new('John Doe', 20) }

  describe '#initialize' do
    it 'sets name and age' do
      expect(person.name).to eq('John Doe')
      expect(person.age).to eq(20)
    end

    it 'initializes rentals as an empty array' do
      expect(person.instance_variable_get(:@rentals)).to be_an(Array)
      expect(person.instance_variable_get(:@rentals)).to be_empty
    end

    it 'generates a unique ID starting with P' do
      expect(person.id).to match(/^P\d{4}$/)
    end

    it 'sets parent_permission to true by default' do
      expect(person.instance_variable_get(:@parent_permission)).to be true
    end
  end

  describe '#rename' do
    it 'changes the name of the person' do
      person.rename('Jane Smith')
      expect(person.name).to eq('Jane Smith')
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is 18 years or older' do
      expect(person.of_age?).to be true
    end

    it 'returns false if the person is younger than 18 years' do
      young_person = Person.new('Young Kid', 15)
      expect(young_person.of_age?).to be false
    end
  end

  describe '#generate_id' do
    it 'generates a unique ID starting with P' do
      id = person.generate_id
      expect(id).to match(/^P\d{4}$/)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a person' do
      expect(person.can_use_services?).to be true
    end
  end

  describe '#correct_name' do
    it 'capitalizes the name' do
      person.name = 'jane smith'
      expect(person.correct_name).to eq('Jane smith')
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      rental = double('Rental')
      person.add_rental(rental)

      expect(person.instance_variable_get(:@rentals)).to include(rental)
    end
  end

  describe '#to_hash' do
    it 'converts the person object to a hash' do
      expected_hash = {
        'type' => 'Student',
        'name' => 'John Doe',
        'age' => 20,
        'parent_permission' => true,
        'id' => person.id,
        'classroom' => nil
      }
      expect(person.to_hash).to eq(expected_hash)
    end
  end
end
