# teacher.rb
require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  # Convert a Teacher object to a hash
  def to_hash
    {
      'type' => 'Teacher',
      'name' => name,
      'age' => age,
      'specialization' => specialization,
      'parent_permission' => true,
      'id' => id
    }
  end

  def self.from_hash(hash)
    name = hash['name']
    age = hash['age']
    parent_permission = hash['parent_permission']

    teacher = Teacher.new(name, age, parent_permission: parent_permission)
    teacher.set_id(hash['id'])

    teacher
  end
end
