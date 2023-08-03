# student_spec.rb

require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  describe '#initialize' do
    it 'sets name, age, and classroom' do
      classroom = Classroom.new('Class A')
      student = Student.new('John Doe', 20, classroom)

      expect(student.name).to eq('John Doe')
      expect(student.age).to eq(20)
      expect(student.classroom).to eq(classroom)
    end

    it 'initializes parent_permission to true by default' do
      classroom = Classroom.new('Class A')
      student = Student.new('John Doe', 20, classroom)

      expect(student.instance_variable_get(:@parent_permission)).to be true
    end
  end

  describe '#play_hooky' do
    it 'returns a shrug emoji' do
      classroom = Classroom.new('Class A')
      student = Student.new('John Doe', 20, classroom)
      expect(student.play_hooky).to eq('¯\\_(ツ)_/¯')
    end
  end

  describe '#to_hash' do
    it 'converts the student object to a hash' do
      classroom = Classroom.new('Class A')
      student = Student.new('John Doe', 20, classroom)

      expected_hash = {
        'type' => 'Student',
        'name' => 'John Doe',
        'age' => 20,
        'parent_permission' => true,
        'id' => student.id
      }
      expect(student.to_hash).to eq(expected_hash)
    end
  end

  describe '.from_hash' do
    it 'creates a new Student object from a hash' do
      classroom = Classroom.new('Class B')
      hash = {
        'type' => 'Student',
        'name' => 'Jane Smith',
        'age' => 18,
        'parent_permission' => true,
        'id' => 'P1234'
      }
      new_student = Student.from_hash(hash)

      expect(new_student).to be_a(Student)
      expect(new_student.name).to eq('Jane Smith')
      expect(new_student.age).to eq(18)
      expect(new_student.id).to eq('P1234')
    end
  end
end
