require_relative 'person'

class Student < Person
  def initialize(classroom, name = 'Unknown', parent_permission: true, age = nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
