require_relative 'person'

class Student < Person
  def initialize(classroom = nil, name = 'Unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end