require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(name = 'Unknown', age = nil, parent_permission = true, classroom)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
    @rentals = []
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  def add_rental(rental)
    @rentals << rental
  end
end
