# student.rb
require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name = 'Unknown', age = nil, classroom = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  def to_hash
    {
      'type' => 'Student',
      'name' => name,
      'age' => age,
      'parent_permission' => true,
      'id' => id
    }
  end

  def self.from_hash(hash)
    name = hash['name']
    age = hash['age']
    parent_permission = hash['parent_permission']
  
    student = Student.new(name, age, parent_permission: parent_permission)
    student.set_id(hash['id'])
  
    student
  end
end