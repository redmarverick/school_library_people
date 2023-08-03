require_relative '../classroom'

RSpec.describe Classroom do
  describe '#initialize' do
    it 'creates a new classroom with a label' do
      classroom = Classroom.new('Class A')
      expect(classroom).to be_a(Classroom)
      expect(classroom.label).to eq('Class A')
      expect(classroom.students).to be_an(Array)
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new('Class B')
      student = double('Student')
      classroom.add_student(student)

      expect(classroom.students).to include(student)
    end
  end
end
